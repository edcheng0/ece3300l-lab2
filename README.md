# Lab 2 – Binary to BCD Converter

**Course:** ECE 2300L – Digital Logic Design Laboratory

## Purpose

This lab implements a combinational binary-to-BCD converter using the
double-dabble (shift-add-3) algorithm, verifies it with a testbench,
and integrates it with a 4-bit calculator so the result of an
addition, subtraction, or multiplication is displayed on the board's
LEDs as BCD.

## Repository Contents

| File | Description |
|---|---|
| `add_3.v` | Add-3 correction cell (Part 1) |
| `bin2bcd.v` | 8-bit binary → 12-bit BCD converter (Part 1) |
| `bin2bcd_tb.v` | Exhaustive testbench for `bin2bcd` (256 vectors) |
| `adder_subtractor.v` | 4-bit two's-complement adder/subtractor (Part 2) |
| `csa_multiplier.v` | 4x4 carry-save-adder multiplier (Part 2) |
| `simple_calc.v` | Calculator core: add/subtract/multiply + sign handling (Part 2) |
| `simple_calc_bcd.v` | Top-level module: switches/LEDs + `simple_calc` + `bin2bcd` (Part 2) |
| `simple_calc_bcd_tb.v` | Exhaustive testbench for the calculator (768 vectors) |
| `simple_calc_bcd.xdc` | Pin constraints for the Nexys A7-100T |

## Part 1 – Binary to BCD Converter

### `add_3`

Combinational module implementing the add-3 correction: passes the
4-bit input through unchanged if it is less than 5, otherwise adds 3.

| A[3:0] | S[3:0] |
|---|---|
| 0000–0100 | unchanged |
| 0101–1001 | A + 3 |
| 1010–1111 | don't care |

### `bin2bcd`

8-bit input (`bin`), 12-bit output (`bcd`) = `{hundreds, tens, ones}`.
Built entirely from `add_3` instances and wiring — no registers, no
storage elements. Uses the shift-add-3 (double dabble) algorithm:
correct the accumulated digit nibbles, then shift the whole register
left by one bit, repeated for all 8 input bits.

### Testbench Verification

`bin2bcd_tb.v` exhaustively checks all 256 possible 8-bit inputs
(0–255) against the expected decimal digits.

```
*** ALL 256 VECTORS PASSED ***
```

**[Insert simulation screenshot here]**

## Part 2 – Simple Calculator with BCD Output

### Design

- `adder_subtractor` – 4-bit two's-complement add/subtract with
  `carry_out` and `overflow` flags.
- `csa_multiplier` – 4x4 unsigned multiply using a carry-save adder
  array, producing an 8-bit product.
- `simple_calc` – selects between add/subtract/multiply based on
  `op_sel`, and converts a negative add/subtract result into
  sign + magnitude (2's complement) before it reaches `bin2bcd`.
- `simple_calc_bcd` – top-level module mapping switches and LEDs to
  the calculator and BCD converter.

### I/O Mapping (Nexys A7-100T)

| Signal | Board I/O | Description |
|---|---|---|
| X[3:0] | SW3–SW0 | Operand X |
| Y[3:0] | SW7–SW4 | Operand Y |
| op_sel[1:0] | SW15–SW14 | `00`=add, `01`=subtract, `1x`=multiply |
| result (BCD) | LED11–LED0 | Result displayed as BCD |
| negative flag | LED13 | 1 = result is negative |
| carry_out | LED14 | Carry out of the adder/subtractor |
| overflow | LED15 | Signed overflow of the adder/subtractor |

### Block Diagram

**[Insert block diagram here — simple_calc as a blackbox with inputs
X, Y, op_sel and outputs result, negative, carry_out, overflow]**

### Testbench Verification

`simple_calc_bcd_tb.v` exhaustively checks all 16×16×3 = 768
combinations of X, Y, and operation, verifying the BCD digits,
negative flag, carry_out, and overflow against an independently
derived expected value.

```
*** ALL 768 CALCULATOR VECTORS PASSED ***
```

**[Insert simulation screenshot here]**

### Hardware Demo

**[Insert link to demo video here]**

## Submission Checklist

- [x] All Verilog code (`add_3.v`, `bin2bcd.v`, `adder_subtractor.v`, `csa_multiplier.v`, `simple_calc.v`, `simple_calc_bcd.v`)
- [x] All testbenches (`bin2bcd_tb.v`, `simple_calc_bcd_tb.v`)
- [ ] Screenshot of `bin2bcd_tb` simulation output (embedded above)
- [ ] Screenshot of `simple_calc_bcd_tb` simulation output (embedded above)
- [ ] Block diagram of Part 2 (embedded above)
- [ ] Demo video link (embedded above)
