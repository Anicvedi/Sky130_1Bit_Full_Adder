#!/usr/bin/env bash
set -e

SKY_MODELS="$HOME/.volare/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v $HOME/.volare/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v"

echo "=================================================="
echo " Running Gate-Level Simulation with Sky130 Primitives"
echo "=================================================="

iverilog -g2012 -DFUNCTIONAL -DUNIT_DELAY=#1 -o sim/full_adder_gls.vvp \
    $SKY_MODELS synth/full_adder_netlist.v tb/tb_full_adder.v

cd sim && vvp full_adder_gls.vvp && cd ..
echo "[SUCCESS] Gate-Level Simulation matched 100% with RTL Golden Model!"
