#!/bin/bash
# g++ -O3 -Wall -shared -std=c++17 -fPIC  -undefined dynamic_lookup $(python3 -m pybind11 --includes) src/svuvm.cpp -o svuvm$(python3-config --extension-suffix) $(python3-config --ldflags --embed) -I inc
export TB_PATH=$PWD/src
verilator -j $(nproc) --vpi --binary +define+UVM_NO_DPI -top top -Mdir build -MAKEFLAGS VM_PARALLEL_BUILDS=O --output-groups $(($(nproc)*4)) \
+incdir+$PWD/uvm-verilator/src $PWD/uvm-verilator/src/uvm_pkg.sv \
-f $PWD/src/test_tb_lib/filelist.f \
-Wno-lint -Wno-style -Wno-SYMRSVDWORD -Wno-IGNOREDRETURN -Wno-CONSTRAINTIGN -Wno-ZERODLY \
--debug --gdbbt | tee compile.log

# $PWD/uvm-verilator/src/dpi/uvm_dpi.cc \
# -CFLAGS "-I$PWD/uvm-verilator/src/dpi -I$PWD/inc" \
# -DUVM_CMDLINE_NO_DPI -DUVM_REGEX_NO_DPI -DUVM_HDL_NO_DPI \

./build/Vtop