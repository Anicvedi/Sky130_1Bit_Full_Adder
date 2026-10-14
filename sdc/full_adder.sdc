# Synopsys Design Constraints (SDC) for 1-Bit Full Adder
# Combinational datapath modeled using 100 MHz Virtual Reference Clock

create_clock -name vclk -period 10.000
set_clock_uncertainty 0.200 [get_clocks vclk]
set_clock_transition 0.100 [get_clocks vclk]
