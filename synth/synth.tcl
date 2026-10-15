# Yosys Synthesis & Technology Mapping Script for 1-Bit Full Adder
# Target Standard Cell Library: SkyWater 130nm High-Density (sky130_fd_sc_hd)

read_verilog -sv rtl/full_adder.v
hierarchy -top full_adder
synth -top full_adder
abc -liberty /home/anirudh/.volare/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
clean
write_verilog -noattr synth/full_adder_netlist.v
stat -liberty /home/anirudh/.volare/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
