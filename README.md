# Traffic Light Controller using Verilog FSM

## Overview
A simple two-road traffic light controller implemented as a finite-state machine (FSM).

## Sequence
1. North-South green, East-West red
2. North-South yellow, East-West red
3. North-South red, East-West green
4. North-South red, East-West yellow
5. Repeat

The timer parameter controls the number of clock cycles spent in each state.

## Files
- `rtl/traffic_light_fsm.v` — RTL module
- `tb/tb_traffic_light_fsm.v` — testbench

## Run simulation
```bash
iverilog -g2012 -o traffic_sim rtl/traffic_light_fsm.v tb/tb_traffic_light_fsm.v
vvp traffic_sim
```

## Concepts demonstrated
Finite-state machines, sequential logic, counters, reset behavior and testbench monitoring.

This is an educational model, not a safety-certified traffic controller.
