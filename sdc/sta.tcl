# OpenSTA Static Timing Analysis Script for 1-Bit Full Adder
read_liberty /home/anirudh/.volare/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog synth/full_adder_netlist.v
link_design full_adder
read_sdc sdc/full_adder.sdc

puts "=================================================="
puts ">>> Setup Timing Check (Max Delay Paths):"
puts "=================================================="
report_checks -path_delay max -fields {slew cap input_pins} -digits 3

puts "=================================================="
puts ">>> Hold Timing Check (Min Delay Paths):"
puts "=================================================="
report_checks -path_delay min -fields {slew cap input_pins} -digits 3

puts "=================================================="
puts ">>> Slack Metrics (WNS & TNS):"
puts "=================================================="
report_worst_slack -max
report_worst_slack -min
report_tns

exit
