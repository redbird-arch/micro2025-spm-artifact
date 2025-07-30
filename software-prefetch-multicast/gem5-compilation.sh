#!/bin/bash
cd ./gem5

yes '' | scons build/X86_MESI_Three_Level_PrepushAck/gem5.opt -j64
yes '' | scons build/X86_MESI_Three_Level_PrepushAck_Bingo/gem5.opt -j64
yes '' | scons build/X86_MESI_Three_Level_Prepush_Feedback_Restart_Ratio/gem5.opt -j64
yes '' | scons build/X86_MESI_Three_Level_SoftPrepush/gem5.opt -j64