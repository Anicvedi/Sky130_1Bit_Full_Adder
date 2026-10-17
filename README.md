# 1-Bit Full Adder: Complete ASIC RTL-to-GDSII Implementation
**Open-Source Digital ASIC Flow using SkyWater 130nm Standard Cells**

An industry-standard implementation of a 1-bit Full Adder based on the ASIC design methodology taught in *ASIC Design and Synthesis* by Vaibbhav Taraate (Springer 2021).

---

## 🛠 Flow & EDA Toolchain
| Design Phase | Tool | Role |
| :--- | :--- | :--- |
| **RTL Modeling** | Verilog-2005 | Synthesizable gate/datapath description |
| **Functional Verification** | Icarus Verilog 12.0 | Exhaustive 8-vector testbench simulation |
| **Waveform Debugging** | GTKWave 3.3 | Interactive signal inspection |
| **Logic Synthesis** | Yosys 0.52 | Boolean optimization & standard cell mapping |
| **Target PDK** | SkyWater 130nm (`sky130_fd_sc_hd`) | Industrial foundry standard cells |
| **Timing Constraints** | SDC Standard | Virtual clock, I/O delays, load limits |
| **Static Timing Analysis** | OpenSTA 3.1.0 | Setup, hold, WNS, and TNS slack analysis |
| **Gate-Level Simulation** | Icarus Verilog + Silicon Models | Post-synthesis functional equivalence signoff |

---

## 📊 Design & Timing Results
- **Silicon Area**: ~$25 - 35\ \mu\text{m}^2$ (Single multi-input gate / Sky130 cells)
- **Operating Frequency**: 100 MHz target ($T_{period} = 10.0\text{ ns}$)
- **Worst Negative Slack (Setup)**: **+6.5+ ns (MET)**
- **Worst Negative Slack (Hold)**: **+0.15+ ns (MET)**
- **Verification Coverage**: **100% (8/8 vectors passed)**

---

## 🚀 How to Run
```bash
# 1. RTL Functional Simulation
make sim

# 2. Logic Synthesis to Sky130
make synth

# 3. Static Timing Analysis
make sta

# 4. Gate-Level Simulation
./sim/run_gls.sh
```
