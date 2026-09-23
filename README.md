# Lab 2 – Binary to BCD Converter

**Course:** ECE 2300L – Digital Logic Design Laboratory
**Board:** Nexys A7-100T
**Tools:** Verilog, Xilinx Vivado

## Files

| File | Description |
|---|---|
| `add_3.v` | Add-3 correction cell |
| `bin2bcd.v` | 8-bit binary → 12-bit BCD converter |
| `bin2bcd_tb.v` | Testbench for `bin2bcd` |
| `adder_subtractor.v` | 4-bit two's-complement adder/subtractor |
| `csa_multiplier.v` | 4x4 carry-save-adder multiplier |
| `simple_calc.v` | Calculator core (add/subtract/multiply) |
| `simple_calc_bcd.v` | Top-level module (switches/LEDs, Nexys A7-100T) |
| `simple_calc_bcd_tb.v` | Testbench for the calculator |
| `simple_calc_bcd.xdc` | Pin constraints for the Nexys A7-100T |

## Part 1 – Binary to BCD Converter

Combinational binary-to-BCD converter (`add_3` + `bin2bcd`) using the
double-dabble algorithm, verified with a testbench.

**Simulation screenshot:**

![Simulation waveform](screenshots/Testbench_screenshot)

## Part 2 – Simple Calculator with BCD Output

4-bit calculator (`adder_subtractor` + `csa_multiplier` + `simple_calc`)
displaying its result as BCD via `bin2bcd`, verified with a testbench
and tested on the FPGA board.

**Block diagram:**

**[Insert block diagram here]**

**Demo video:**

**[Insert video link here]**
