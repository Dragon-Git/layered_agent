#!/bin/bash
# g++ -O3 -Wall -shared -std=c++17 -fPIC  -undefined dynamic_lookup $(python3 -m pybind11 --includes) src/svuvm.cpp -o svuvm$(python3-config --extension-suffix) $(python3-config --ldflags --embed) -I inc
export TB_PATH=$PWD/src

verilator -vpi -j $(nproc) --binary -top top -Mdir build --output-groups $(($(nproc))) \
+incdir+$PWD/uvm-verilator/src $PWD/uvm-verilator/src/uvm_pkg.sv \
-f $PWD/src/test_tb_lib/filelist.f \
-Wno-lint -Wno-style -Wno-SYMRSVDWORD -Wno-IGNOREDRETURN -Wno-CONSTRAINTIGN -Wno-ZERODLY \
$PWD/uvm-verilator/src/dpi/uvm_dpi.cc \
-CFLAGS "-I$PWD/uvm-verilator/src/dpi -I$PWD/inc" \

./build/Vtop
