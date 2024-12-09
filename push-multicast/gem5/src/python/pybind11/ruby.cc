#include "pybind11/pybind11.h"

#include "mem/ruby/slicc_interface/AbstractController.hh"

namespace py = pybind11;

void
pybind_init_ruby(py::module &m_native)
{
    py::module m_ruby = m_native.def_submodule("ruby");
    m_ruby
        .def("enablePrepush", &AbstractController::enablePrepush)
        .def("disablePrepush", &AbstractController::disablePrepush)
        ;
}
