# Vending Machine — Verilog HDL (FSM)

A vending machine controller implemented in **Verilog** using an **FSM (Mealy)** design. Accepts coin inputs, dispenses a product when the required amount is met, and returns change if overpaid.

## Features
- Mealy FSM with real-time output
- Supports coin denominations (e.g., 5, 10)
- Dispense + change-return logic
- Reset/invalid input handling
- Testbench-driven verification

## Files
- `src/VendingMachine.v` — RTL
- `sim/VendingMachineTB.v` — Testbench
- `constraints/VendingMachine.xdc` — (optional for FPGA pinout)

## Tools
- Vivado 2025.1 (XSim), ModelSim compatible

## Simulation (Vivado XSim)
1. Open Vivado → **Create Project** (RTL) → add `src/` and `sim/` files.
2. Set top for simulation: `VendingMachineTB`.
3. Run **Simulation** → **Run All**.

## Notes
Developed as part of a VLSI program by 1stop.ai in association with E-Cell, IIT Guwahati (Jul–Sep 2025).
