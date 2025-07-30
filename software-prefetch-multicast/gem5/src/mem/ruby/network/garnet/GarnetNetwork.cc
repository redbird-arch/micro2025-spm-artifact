/*
 * Copyright (c) 2020 Advanced Micro Devices, Inc.
 * Copyright (c) 2008 Princeton University
 * Copyright (c) 2016 Georgia Institute of Technology
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met: redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer;
 * redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution;
 * neither the name of the copyright holders nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


#include "mem/ruby/network/garnet/GarnetNetwork.hh"

#include <cassert>

#include "base/cast.hh"
#include "debug/RubyNetwork.hh"
#include "mem/ruby/common/NetDest.hh"
#include "mem/ruby/network/MessageBuffer.hh"
#include "mem/ruby/network/garnet/CommonTypes.hh"
#include "mem/ruby/network/garnet/CreditLink.hh"
#include "mem/ruby/network/garnet/GarnetLink.hh"
#include "mem/ruby/network/garnet/NetworkInterface.hh"
#include "mem/ruby/network/garnet/NetworkLink.hh"
#include "mem/ruby/network/garnet/Router.hh"
#include "mem/ruby/protocol/CoherenceRequestType.hh"
#include "mem/ruby/protocol/CoherenceResponseType.hh"
#include "mem/ruby/system/RubySystem.hh"

using namespace std;

/*
 * GarnetNetwork sets up the routers and links and collects stats.
 * Default parameters (GarnetNetwork.py) can be overwritten from command line
 * (see configs/network/Network.py)
 */

GarnetNetwork::GarnetNetwork(const Params &p)
    : Network(p)
{
    m_num_rows = p.num_rows;
    m_ni_flit_size = p.ni_flit_size;
    m_max_vcs_per_vnet = 0;
    m_buffers_per_data_vc = p.buffers_per_data_vc;
    m_buffers_per_ctrl_vc = p.buffers_per_ctrl_vc;
    m_routing_algorithm = p.routing_algorithm;

    m_enable_fault_model = p.enable_fault_model;
    if (m_enable_fault_model)
        fault_model = p.fault_model;

    enableMulticast = p.enableMulticast;
    doubleChannelMulticast = p.doubleChannelMulticast;
    asynchronousMulticast = p.asynchronousMulticast;
    holdSWForMulticastOnly = p.holdSwitchForMulticastOnly;
    prepushFilter = p.prepushFilter;
    prepushFilterNoDrop = p.prepushFilterNoDrop;

    if (p.coherenceConstraint == "unordered") {
        coherenceConstraint = UNORDERED_;
    } else if (p.coherenceConstraint == "ordered-vnet") {
        coherenceConstraint = ORDERED_VNET_;
    } else if (p.coherenceConstraint == "ordered-prepush-inv") {
        coherenceConstraint = ORDERED_PREPUSH_INV_;
    } else {
        panic("Unknown coherence order constraint for NoC: %s",
              p.coherenceConstraint);
    }

    if (enableMulticast) {
        panic_if(!doubleChannelMulticast && !asynchronousMulticast,
                 "At least either doubleChannelMulticast or "
                 "asynchronousMulticast should be enabled for deadlock "
                 "freedom.");
        int num_flits = (int) divCeil((float) m_data_msg_size,
                (float) m_ni_flit_size);
        panic_if(asynchronousMulticast && num_flits > m_buffers_per_data_vc,
                "Asynchronous multicast sends the whole packet to an output "
                "VC before requesting aonther output VC to avoid deadlock, so"
                " it requires the virtual channel to hold the whole packet: "
                "number of flits per data packet is %d but number of buffers "
                "per data vc is %d, use \'--buffers-per-data-vc\' to specify "
                "the buffer size!\n", num_flits, m_buffers_per_data_vc);
    }

    m_vnet_type.resize(m_virtual_networks);

    for (int i = 0 ; i < m_virtual_networks ; i++) {
        if (m_vnet_type_names[i] == "response")
            m_vnet_type[i] = DATA_VNET_; // carries data (and ctrl) packets
        else
            m_vnet_type[i] = CTRL_VNET_; // carries only ctrl packets
    }

    for (int i = 0 ; i < m_virtual_networks ; i++) {
        if (m_vnet_type_names[i] == "request") {
            requestVnet = i;
        } else if (m_vnet_type_names[i] == "l1unblock-l2fwdrequest") {
            forwardRequestVnet = i;
        }
    }

    // record the routers
    for (vector<BasicRouter*>::const_iterator i =  p.routers.begin();
         i != p.routers.end(); ++i) {
        Router* router = safe_cast<Router*>(*i);
        m_routers.push_back(router);

        // initialize the router's network pointers
        router->init_net_ptr(this);
    }

    // record the network interfaces
    for (vector<ClockedObject*>::const_iterator i = p.netifs.begin();
         i != p.netifs.end(); ++i) {
        NetworkInterface *ni = safe_cast<NetworkInterface *>(*i);
        m_nis.push_back(ni);
        ni->init_net_ptr(this);
        ni->setRequestVnet(requestVnet);
        ni->setForwardRequestVnet(forwardRequestVnet);
    }

    numCoherenceMsgType = CoherenceRequestType_NUM +
        CoherenceResponseType_NUM;

    // Print Garnet version
    inform("Garnet version %s\n", garnetVersion);
}

void
GarnetNetwork::init()
{
    Network::init();

    for (int i=0; i < m_nodes; i++) {
        m_nis[i]->addNode(m_toNetQueues[i], m_fromNetQueues[i]);
    }

    // The topology pointer should have already been initialized in the
    // parent network constructor
    assert(m_topology_ptr != NULL);
    m_topology_ptr->createLinks(this);

    // Initialize topology specific parameters
    if (getNumRows() > 0) {
        // Only for Mesh topology
        // m_num_rows and m_num_cols are only used for
        // implementing XY or custom routing in RoutingUnit.cc
        m_num_rows = getNumRows();
        m_num_cols = m_routers.size() / m_num_rows;
        assert(m_num_rows * m_num_cols == m_routers.size());
    } else {
        m_num_rows = -1;
        m_num_cols = -1;
    }

    // FaultModel: declare each router to the fault model
    if (isFaultModelEnabled()) {
        for (vector<Router*>::const_iterator i= m_routers.begin();
             i != m_routers.end(); ++i) {
            Router* router = safe_cast<Router*>(*i);
            M5_VAR_USED int router_id =
                fault_model->declare_router(router->get_num_inports(),
                                            router->get_num_outports(),
                                            router->get_vc_per_vnet(),
                                            getBuffersPerDataVC(),
                                            getBuffersPerCtrlVC());
            assert(router_id == router->get_id());
            router->printAggregateFaultProbability(cout);
            router->printFaultVector(cout);
        }
    }
}

/*
 * This function creates a link from the Network Interface (NI)
 * into the Network.
 * It creates a Network Link from the NI to a Router and a Credit Link from
 * the Router to the NI
*/

void
GarnetNetwork::makeExtInLink(NodeID global_src, SwitchID dest, BasicLink* link,
                             std::vector<NetDest>& routing_table_entry)
{
    NodeID local_src = getLocalNodeID(global_src);
    assert(local_src < m_nodes);

    GarnetExtLink* garnet_link = safe_cast<GarnetExtLink*>(link);

    // GarnetExtLink is bi-directional
    NetworkLink* net_link = garnet_link->m_network_links[LinkDirection_In];
    net_link->setType(EXT_IN_);
    CreditLink* credit_link = garnet_link->m_credit_links[LinkDirection_In];

    m_networklinks.push_back(net_link);
    m_creditlinks.push_back(credit_link);

    PortDirection dst_inport_dirn = "Local";

    m_max_vcs_per_vnet = std::max(m_max_vcs_per_vnet,
                             m_routers[dest]->get_vc_per_vnet());

    /*
     * We check if a bridge was enabled at any end of the link.
     * The bridge is enabled if either of clock domain
     * crossing (CDC) or Serializer-Deserializer(SerDes) unit is
     * enabled for the link at each end. The bridge encapsulates
     * the functionality for both CDC and SerDes and is a Consumer
     * object similiar to a NetworkLink.
     *
     * If a bridge was enabled we connect the NI and Routers to
     * bridge before connecting the link. Example, if an external
     * bridge is enabled, we would connect:
     * NI--->NetworkBridge--->GarnetExtLink---->Router
     */
    if (garnet_link->extBridgeEn) {
        DPRINTF(RubyNetwork, "Enable external bridge for %s\n",
            garnet_link->name());
        m_nis[local_src]->
        addOutPort(garnet_link->extNetBridge[LinkDirection_In],
                   garnet_link->extCredBridge[LinkDirection_In],
                   dest, m_routers[dest]->get_vc_per_vnet());
    } else {
        m_nis[local_src]->addOutPort(net_link, credit_link, dest,
            m_routers[dest]->get_vc_per_vnet());
    }

    if (garnet_link->intBridgeEn) {
        DPRINTF(RubyNetwork, "Enable internal bridge for %s\n",
            garnet_link->name());
        m_routers[dest]->
            addInPort(dst_inport_dirn,
                      garnet_link->intNetBridge[LinkDirection_In],
                      garnet_link->intCredBridge[LinkDirection_In]);
    } else {
        m_routers[dest]->addInPort(dst_inport_dirn, net_link, credit_link);
    }

}

/*
 * This function creates a link from the Network to a NI.
 * It creates a Network Link from a Router to the NI and
 * a Credit Link from NI to the Router
*/

void
GarnetNetwork::makeExtOutLink(SwitchID src, NodeID global_dest,
                              BasicLink* link,
                              std::vector<NetDest>& routing_table_entry)
{
    NodeID local_dest = getLocalNodeID(global_dest);
    assert(local_dest < m_nodes);
    assert(src < m_routers.size());
    assert(m_routers[src] != NULL);

    GarnetExtLink* garnet_link = safe_cast<GarnetExtLink*>(link);

    // GarnetExtLink is bi-directional
    NetworkLink* net_link = garnet_link->m_network_links[LinkDirection_Out];
    net_link->setType(EXT_OUT_);
    CreditLink* credit_link = garnet_link->m_credit_links[LinkDirection_Out];

    m_networklinks.push_back(net_link);
    m_creditlinks.push_back(credit_link);

    PortDirection src_outport_dirn = "Local";

    m_max_vcs_per_vnet = std::max(m_max_vcs_per_vnet,
                             m_routers[src]->get_vc_per_vnet());

    /*
     * We check if a bridge was enabled at any end of the link.
     * The bridge is enabled if either of clock domain
     * crossing (CDC) or Serializer-Deserializer(SerDes) unit is
     * enabled for the link at each end. The bridge encapsulates
     * the functionality for both CDC and SerDes and is a Consumer
     * object similiar to a NetworkLink.
     *
     * If a bridge was enabled we connect the NI and Routers to
     * bridge before connecting the link. Example, if an external
     * bridge is enabled, we would connect:
     * NI<---NetworkBridge<---GarnetExtLink<----Router
     */
    if (garnet_link->extBridgeEn) {
        DPRINTF(RubyNetwork, "Enable external bridge for %s\n",
            garnet_link->name());
        m_nis[local_dest]->
            addInPort(garnet_link->extNetBridge[LinkDirection_Out],
                      garnet_link->extCredBridge[LinkDirection_Out]);
    } else {
        m_nis[local_dest]->addInPort(net_link, credit_link);
    }

    if (garnet_link->intBridgeEn) {
        DPRINTF(RubyNetwork, "Enable internal bridge for %s\n",
            garnet_link->name());
        m_routers[src]->
            addOutPort(src_outport_dirn,
                       garnet_link->intNetBridge[LinkDirection_Out],
                       routing_table_entry, link->m_weight,
                       garnet_link->intCredBridge[LinkDirection_Out],
                       m_routers[src]->get_vc_per_vnet());
    } else {
        m_routers[src]->
            addOutPort(src_outport_dirn, net_link,
                       routing_table_entry,
                       link->m_weight, credit_link,
                       m_routers[src]->get_vc_per_vnet());
    }
}

/*
 * This function creates an internal network link between two routers.
 * It adds both the network link and an opposite credit link.
*/

void
GarnetNetwork::makeInternalLink(SwitchID src, SwitchID dest, BasicLink* link,
                                std::vector<NetDest>& routing_table_entry,
                                PortDirection src_outport_dirn,
                                PortDirection dst_inport_dirn)
{
    GarnetIntLink* garnet_link = safe_cast<GarnetIntLink*>(link);

    // GarnetIntLink is unidirectional
    NetworkLink* net_link = garnet_link->m_network_link;
    net_link->setType(INT_);
    CreditLink* credit_link = garnet_link->m_credit_link;

    m_networklinks.push_back(net_link);
    m_creditlinks.push_back(credit_link);

    m_max_vcs_per_vnet = std::max(m_max_vcs_per_vnet,
                             std::max(m_routers[dest]->get_vc_per_vnet(),
                             m_routers[src]->get_vc_per_vnet()));

    /*
     * We check if a bridge was enabled at any end of the link.
     * The bridge is enabled if either of clock domain
     * crossing (CDC) or Serializer-Deserializer(SerDes) unit is
     * enabled for the link at each end. The bridge encapsulates
     * the functionality for both CDC and SerDes and is a Consumer
     * object similiar to a NetworkLink.
     *
     * If a bridge was enabled we connect the NI and Routers to
     * bridge before connecting the link. Example, if a source
     * bridge is enabled, we would connect:
     * Router--->NetworkBridge--->GarnetIntLink---->Router
     */
    if (garnet_link->dstBridgeEn) {
        DPRINTF(RubyNetwork, "Enable destination bridge for %s\n",
            garnet_link->name());
        m_routers[dest]->addInPort(dst_inport_dirn,
            garnet_link->dstNetBridge, garnet_link->dstCredBridge);
    } else {
        m_routers[dest]->addInPort(dst_inport_dirn, net_link, credit_link);
    }

    if (garnet_link->srcBridgeEn) {
        DPRINTF(RubyNetwork, "Enable source bridge for %s\n",
            garnet_link->name());
        m_routers[src]->
            addOutPort(src_outport_dirn, garnet_link->srcNetBridge,
                       routing_table_entry,
                       link->m_weight, garnet_link->srcCredBridge,
                       m_routers[dest]->get_vc_per_vnet());
    } else {
        m_routers[src]->addOutPort(src_outport_dirn, net_link,
                        routing_table_entry,
                        link->m_weight, credit_link,
                        m_routers[dest]->get_vc_per_vnet());
    }
}

// Total routers in the network
int
GarnetNetwork::getNumRouters()
{
    return m_routers.size();
}

// Get ID of router connected to a NI.
int
GarnetNetwork::get_router_id(int global_ni, int vnet)
{
    NodeID local_ni = getLocalNodeID(global_ni);

    return m_nis[local_ni]->get_router_id(vnet);
}

// Get IDs of routers connected to a vector of NIs.
vector<SwitchID>
GarnetNetwork::getRouterIDs(vector<NodeID> global_nis, int vnet)
{
    vector<SwitchID> router_ids;

    for (auto global_ni: global_nis) {
        NodeID local_ni = getLocalNodeID(global_ni);
        router_ids.push_back(m_nis[local_ni]->get_router_id(vnet));
    }

    return router_ids;
}

void
GarnetNetwork::regStats()
{
    Network::regStats();

    // Packets
    m_packets_received
        .init(m_virtual_networks)
        .name(name() + ".packets_received")
        .flags(Stats::pdf | Stats::total | Stats::nozero | Stats::oneline)
        ;

    m_packets_injected
        .init(m_virtual_networks)
        .name(name() + ".packets_injected")
        .flags(Stats::pdf | Stats::total | Stats::nozero | Stats::oneline)
        ;

    m_packet_network_latency
        .init(m_virtual_networks)
        .name(name() + ".packet_network_latency")
        .flags(Stats::oneline)
        ;

    m_packet_queueing_latency
        .init(m_virtual_networks)
        .name(name() + ".packet_queueing_latency")
        .flags(Stats::oneline)
        ;

    for (int i = 0; i < m_virtual_networks; i++) {
        m_packets_received.subname(i, csprintf("vnet-%i", i));
        m_packets_injected.subname(i, csprintf("vnet-%i", i));
        m_packet_network_latency.subname(i, csprintf("vnet-%i", i));
        m_packet_queueing_latency.subname(i, csprintf("vnet-%i", i));
    }

    m_avg_packet_vnet_latency
        .name(name() + ".average_packet_vnet_latency")
        .flags(Stats::oneline);
    m_avg_packet_vnet_latency =
        m_packet_network_latency / m_packets_received;

    m_avg_packet_vqueue_latency
        .name(name() + ".average_packet_vqueue_latency")
        .flags(Stats::oneline);
    m_avg_packet_vqueue_latency =
        m_packet_queueing_latency / m_packets_received;

    m_avg_packet_network_latency
        .name(name() + ".average_packet_network_latency");
    m_avg_packet_network_latency =
        sum(m_packet_network_latency) / sum(m_packets_received);

    m_avg_packet_queueing_latency
        .name(name() + ".average_packet_queueing_latency");
    m_avg_packet_queueing_latency
        = sum(m_packet_queueing_latency) / sum(m_packets_received);

    m_avg_packet_latency
        .name(name() + ".average_packet_latency");
    m_avg_packet_latency
        = m_avg_packet_network_latency + m_avg_packet_queueing_latency;

    // Flits
    m_flits_received
        .init(m_virtual_networks)
        .name(name() + ".flits_received")
        .flags(Stats::pdf | Stats::total | Stats::nozero | Stats::oneline)
        ;

    m_flits_injected
        .init(m_virtual_networks)
        .name(name() + ".flits_injected")
        .flags(Stats::pdf | Stats::total | Stats::nozero | Stats::oneline)
        ;

    m_flit_network_latency
        .init(m_virtual_networks)
        .name(name() + ".flit_network_latency")
        .flags(Stats::oneline)
        ;

    m_flit_queueing_latency
        .init(m_virtual_networks)
        .name(name() + ".flit_queueing_latency")
        .flags(Stats::oneline)
        ;

    for (int i = 0; i < m_virtual_networks; i++) {
        m_flits_received.subname(i, csprintf("vnet-%i", i));
        m_flits_injected.subname(i, csprintf("vnet-%i", i));
        m_flit_network_latency.subname(i, csprintf("vnet-%i", i));
        m_flit_queueing_latency.subname(i, csprintf("vnet-%i", i));
    }

    m_avg_flit_vnet_latency
        .name(name() + ".average_flit_vnet_latency")
        .flags(Stats::oneline);
    m_avg_flit_vnet_latency = m_flit_network_latency / m_flits_received;

    m_avg_flit_vqueue_latency
        .name(name() + ".average_flit_vqueue_latency")
        .flags(Stats::oneline);
    m_avg_flit_vqueue_latency =
        m_flit_queueing_latency / m_flits_received;

    m_avg_flit_network_latency
        .name(name() + ".average_flit_network_latency");
    m_avg_flit_network_latency =
        sum(m_flit_network_latency) / sum(m_flits_received);

    m_avg_flit_queueing_latency
        .name(name() + ".average_flit_queueing_latency");
    m_avg_flit_queueing_latency =
        sum(m_flit_queueing_latency) / sum(m_flits_received);

    m_avg_flit_latency
        .name(name() + ".average_flit_latency");
    m_avg_flit_latency =
        m_avg_flit_network_latency + m_avg_flit_queueing_latency;


    // Hops
    m_avg_hops.name(name() + ".average_hops");
    m_avg_hops = m_total_hops / sum(m_flits_received);

    // Links
    m_total_ext_in_link_utilization
        .name(name() + ".ext_in_link_utilization");
    m_total_ext_out_link_utilization
        .name(name() + ".ext_out_link_utilization");
    m_total_int_link_utilization
        .name(name() + ".int_link_utilization");
    m_average_link_utilization
        .name(name() + ".avg_link_utilization");
    m_average_vc_load
        .init(m_virtual_networks * m_max_vcs_per_vnet)
        .name(name() + ".avg_vc_load")
        .flags(Stats::pdf | Stats::total | Stats::nozero | Stats::oneline)
        ;


    // Traffic breakdown
    std::vector<std::string> coherence_types;

    std::string coherence_types_string = "Requests [ ";
    for (int i = 0; i < CoherenceRequestType_NUM; i++) {
        std::string type =
            CoherenceRequestType_to_string((CoherenceRequestType) i);
        coherence_types.push_back(type);
        coherence_types_string += type  + " ";
    }

    coherence_types_string += "], Responses [ ";
    for (int i = 0; i < CoherenceResponseType_NUM; i++) {
        std::string type =
            CoherenceResponseType_to_string((CoherenceResponseType) i);
        coherence_types.push_back(type);
        coherence_types_string += type + " ";
    }
    coherence_types_string += "]";

    std::string description;

    description = "external input links utilization breakdown for coherence "
                  "traffics: " + coherence_types_string;
    extInLinkUtilization
        .init(numCoherenceMsgType)
        .name(name() + ".ext_in_link_utilization_breakdown")
        .desc(description.c_str())
        .flags(Stats::pdf | Stats::total | Stats::nozero | Stats::oneline)
        ;

    description = "external output links utilization breakdown for coherence "
                  "traffics: " + coherence_types_string;
    extOutLinkUtilization
        .init(numCoherenceMsgType)
        .name(name() + ".ext_out_link_utilization_breakdown")
        .desc(description.c_str())
        .flags(Stats::pdf | Stats::total | Stats::nozero | Stats::oneline)
        ;

    description = "inter links utilization breakdown for coherence traffics: "
        + coherence_types_string;
    intLinkUtilization
        .init(numCoherenceMsgType)
        .name(name() + ".int_link_utilization_breakdown")
        .desc(description.c_str())
        .flags(Stats::pdf | Stats::total | Stats::nozero | Stats::oneline)
        ;

    for (int i = 0; i < CoherenceRequestType_NUM; i++) {
        extInLinkUtilization.subname(i, csprintf("request-%s",
                    coherence_types[i]));
        extInLinkUtilization.subdesc(i, csprintf("Request_%s",
                    coherence_types[i]));

        extOutLinkUtilization.subname(i, csprintf("request-%s",
                    coherence_types[i]));
        extOutLinkUtilization.subdesc(i, csprintf("Request_%s",
                    coherence_types[i]));

        intLinkUtilization.subname(i, csprintf("request-%s",
                    coherence_types[i]));
        intLinkUtilization.subdesc(i, csprintf("Request_%s",
                    coherence_types[i]));
    }

    for (int i = CoherenceRequestType_NUM; i < numCoherenceMsgType; i++) {
        extInLinkUtilization.subname(i, csprintf("response-%s",
                    coherence_types[i]));
        extInLinkUtilization.subdesc(i, csprintf("Response_%s",
                    coherence_types[i]));

        extOutLinkUtilization.subname(i, csprintf("response-%s",
                    coherence_types[i]));
        extOutLinkUtilization.subdesc(i, csprintf("Response_%s",
                    coherence_types[i]));

        intLinkUtilization.subname(i, csprintf("response-%s",
                    coherence_types[i]));
        intLinkUtilization.subdesc(i, csprintf("Response_%s",
                    coherence_types[i]));
    }

    extInLinkCtrlUtilization
        .name(name() + ".ext_in_link_ctrl_utilization")
        .flags(Stats::nozero);

    extInLinkDataUtilization
        .name(name() + ".ext_in_link_data_utilization")
        .flags(Stats::nozero);

    extOutLinkCtrlUtilization
        .name(name() + ".ext_out_link_ctrl_utilization")
        .flags(Stats::nozero);

    extOutLinkDataUtilization
        .name(name() + ".ext_out_link_data_utilization")
        .flags(Stats::nozero);

    intLinkCtrlUtilization
        .name(name() + ".int_link_ctrl_utilization")
        .flags(Stats::nozero);

    intLinkDataUtilization
        .name(name() + ".int_link_data_utilization")
        .flags(Stats::nozero);

    extInLinkPrepushUtilization
        .name(name() + ".ext_in_link_prepush_utilization")
        .flags(Stats::nozero)
        ;

    extOutLinkPrepushUtilization
        .name(name() + ".ext_out_link_prepush_utilization")
        .flags(Stats::nozero)
        ;

    intLinkPrepushUtilization
        .name(name() + ".int_link_prepush_utilization")
        .flags(Stats::nozero)
        ;

    // filtering distribution
    routerPrepushFilterQueries
        .name(name() + ".router_prepush_filter_queries")
        .flags(Stats::nozero)
        ;

    routerPrepushFilterRegistries
        .name(name() + ".router_prepush_filter_registries")
        .flags(Stats::nozero)
        ;

    routerPrepushFilterActivity
        .name(name() + ".router_prepush_filter_activity")
        .flags(Stats::nozero)
        ;

    coreNIPrepushFilterActivity
        .name(name() + ".core_ni_prepush_filter_activity")
        .flags(Stats::nozero)
        ;

    llcNIPrepushFilterActivity
        .name(name() + ".llc_ni_prepush_filter_activity")
        .flags(Stats::nozero)
        ;

    corePrepushFilterActivity
        .name(name() + ".core_prepush_filter_activity")
        .flags(Stats::nozero)
        ;

    llcPrepushFilterActivity
        .name(name() + ".llc_prepush_filter_activity")
        .flags(Stats::nozero)
        ;
}

void
GarnetNetwork::collateStats()
{
    RubySystem *rs = params().ruby_system;
    double time_delta = double(curCycle() - rs->getStartCycle());

    for (int i = 0; i < m_networklinks.size(); i++) {
        link_type type = m_networklinks[i]->getType();

        int activity = m_networklinks[i]->getLinkUtilization();
        int ctrl_activity = m_networklinks[i]->getLinkCtrlUtilization();
        int data_activity = m_networklinks[i]->getLinkDataUtilization();
        m_networklinks[i]->calculateLinkFlitLoad(time_delta);

        vector<unsigned int> link_utilized_breakdown =
            m_networklinks[i]->getLinkUtilizationBreakdown();
        unsigned int prepush_activity =
            m_networklinks[i]->getLinkPrepushUtilization();

        if (type == EXT_IN_) {
            m_total_ext_in_link_utilization += activity;
            for (int j = 0; j < link_utilized_breakdown.size(); j++) {
                extInLinkUtilization[j] += link_utilized_breakdown[j];
            }
            extInLinkCtrlUtilization += ctrl_activity;
            extInLinkDataUtilization += data_activity;
            extInLinkPrepushUtilization += prepush_activity;
        } else if (type == EXT_OUT_) {
            m_total_ext_out_link_utilization += activity;
            for (int j = 0; j < link_utilized_breakdown.size(); j++) {
                extOutLinkUtilization[j] += link_utilized_breakdown[j];
            }
            extOutLinkCtrlUtilization += ctrl_activity;
            extOutLinkDataUtilization += data_activity;
            extOutLinkPrepushUtilization += prepush_activity;
        } else if (type == INT_) {
            m_total_int_link_utilization += activity;
            for (int j = 0; j < link_utilized_breakdown.size(); j++) {
                intLinkUtilization[j] += link_utilized_breakdown[j];
            }
            intLinkCtrlUtilization += ctrl_activity;
            intLinkDataUtilization += data_activity;
            intLinkPrepushUtilization += prepush_activity;
        }

        m_average_link_utilization +=
            (double(activity) / time_delta);

        vector<unsigned int> vc_load = m_networklinks[i]->getVcLoad();
        for (int j = 0; j < vc_load.size(); j++) {
            m_average_vc_load[j] += ((double)vc_load[j] / time_delta);
        }
    }

    // Ask the routers to collate their statistics
    for (int i = 0; i < m_routers.size(); i++) {
        m_routers[i]->collateStats();
        m_routers[i]->calculateRouterFlitLoad(time_delta);

        routerPrepushFilterQueries += m_routers[i]->getPrepushFilterQueries();
        routerPrepushFilterRegistries +=
            m_routers[i]->getPrepushFilterRegistries();
        routerPrepushFilterActivity +=
            m_routers[i]->getPrepushFilterActivity();
    }

    for (unsigned int i = 0; i < m_nis.size(); ++i) {
        coreNIPrepushFilterActivity +=
            m_nis[i]->getCoreNIPrepushFilterActivity();
        llcNIPrepushFilterActivity +=
            m_nis[i]->getLLCNIPrepushFilterActivity();
        corePrepushFilterActivity += m_nis[i]->getCorePrepushFilterActivity();
        llcPrepushFilterActivity += m_nis[i]->getLLCPrepushFilterActivity();
    }
}

void
GarnetNetwork::resetStats()
{
    for (int i = 0; i < m_routers.size(); i++) {
        m_routers[i]->resetStats();
    }
    for (int i = 0; i < m_networklinks.size(); i++) {
        m_networklinks[i]->resetStats();
    }
    for (int i = 0; i < m_creditlinks.size(); i++) {
        m_creditlinks[i]->resetStats();
    }

    for (unsigned int i = 0; i < m_nis.size(); ++i) {
        m_nis[i]->resetStats();
    }
}

void
GarnetNetwork::print(ostream& out) const
{
    out << "[GarnetNetwork]";
}

std::string
GarnetNetwork::printNetworkString(int vnet) const
{
    std::ostringstream oss;

    if (vnet == -1) {
        oss << "GarnetNetwork:\n";
    } else if (vnet >= 0 && vnet < m_vnet_type.size()) {
        oss << "GarnetNetwork virtual network " << vnet << ":\n";
    } else {
        oss << "Unknown vnet " << vnet << "!\n";
        return oss.str();
    }

    oss << "\n- Network Interfaces:\n";
    for (unsigned int i = 0; i < m_nis.size(); ++i) {
        oss << m_nis[i]->printNIString(vnet);
    }

    oss << "\n- Routers:\n";
    for (unsigned int i = 0; i < m_routers.size(); i++) {
        oss << m_routers[i]->printRouterString(vnet);
    }

    return oss.str();
}

bool
GarnetNetwork::functionalRead(Packet *pkt)
{
    for (unsigned int i = 0; i < m_routers.size(); i++) {
        if (m_routers[i]->functionalRead(pkt))
            return true;
    }

    for (unsigned int i = 0; i < m_nis.size(); ++i) {
        if (m_nis[i]->functionalRead(pkt))
            return true;
    }

    for (unsigned int i = 0; i < m_networklinks.size(); ++i) {
        if (m_networklinks[i]->functionalRead(pkt))
            return true;
    }

    return false;
}

uint32_t
GarnetNetwork::functionalWrite(Packet *pkt)
{
    uint32_t num_functional_writes = 0;

    for (unsigned int i = 0; i < m_routers.size(); i++) {
        num_functional_writes += m_routers[i]->functionalWrite(pkt);
    }

    for (unsigned int i = 0; i < m_nis.size(); ++i) {
        num_functional_writes += m_nis[i]->functionalWrite(pkt);
    }

    for (unsigned int i = 0; i < m_networklinks.size(); ++i) {
        num_functional_writes += m_networklinks[i]->functionalWrite(pkt);
    }

    return num_functional_writes;
}
