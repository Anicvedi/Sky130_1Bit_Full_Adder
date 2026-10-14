# Synopsys Design Constraints (SDC) for 1-Bit Full Adder
# Combinational datapath modeled using 100 MHz Virtual Reference Clock

create_clock -name vclk -period 10.000
set_clock_uncertainty 0.200 [get_clocks vclk]
set_clock_transition 0.100 [get_clocks vclk]

# Input Arrival Constraints (Budgeted external driving delay)
set_input_delay -clock vclk -max 1.500 [get_ports {a b cin}]
set_input_delay -clock vclk -min 0.200 [get_ports {a b cin}]

# Output Delay Constraints (Budgeted external setup requirements)
set_output_delay -clock vclk -max 2.000 [get_ports {sum cout}]
set_output_delay -clock vclk -min 0.400 [get_ports {sum cout}]
