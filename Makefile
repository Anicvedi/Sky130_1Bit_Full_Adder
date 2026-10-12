# ==============================================================================
# 1-Bit Full Adder: Complete ASIC Toolchain Automation
# ==============================================================================

MODULE   := full_adder
PDK_LIB  := $(HOME)/.volare/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

.PHONY: all sim rschem synth gschem sta gls clean help

help:
	@echo "------------------------------------------------------------------"
	@echo " 1-Bit Full Adder ASIC Implementation Targets:"
	@echo "------------------------------------------------------------------"
	@echo "  make sim     -> Run RTL functional simulation (Icarus Verilog)"
	@echo "  make rschem  -> Generate RTL elaborated schematic SVG (Yosys)"
	@echo "  make synth   -> Synthesize to Sky130 standard cells (Yosys)"
	@echo "  make gschem  -> Generate technology gate schematic SVG (Yosys)"
	@echo "  make sta     -> Run Static Timing Analysis (OpenSTA)"
	@echo "  make gls     -> Run Gate-Level Simulation (GLS)"
	@echo "  make clean   -> Remove build artifacts"
	@echo "------------------------------------------------------------------"

sim:
	@mkdir -p sim
	iverilog -g2012 -Wall -I rtl -o sim/$(MODULE).vvp rtl/$(MODULE).v tb/tb_$(MODULE).v
	cd sim && vvp $(MODULE).vvp

rschem:
	@mkdir -p docs
	yosys -q -p "read_verilog -sv rtl/$(MODULE).v; prep -top $(MODULE); show -format svg -prefix docs/rtl_schematic"

synth:
	@mkdir -p synth reports
	yosys -q -p "read_verilog -sv rtl/$(MODULE).v; synth -top $(MODULE); abc -liberty $(PDK_LIB); clean; write_verilog -noattr synth/$(MODULE)_netlist.v; stat -liberty $(PDK_LIB)" | tee reports/synthesis_area.rpt

gschem:
	yosys -q -p "read_verilog -sv synth/$(MODULE)_netlist.v; prep -top $(MODULE); show -format svg -prefix docs/gate_schematic"

sta:
	@mkdir -p reports
	sta -no_splash sdc/sta.tcl | tee reports/timing_sta.rpt

clean:
	rm -rf sim/*.vvp sim/*.vcd
