# RISC-V CORE USING TL-VERILOG WORKSHOP
This repository contains codes and information that were designed as part of [RISC-V based MYTH workshop](https://www.vlsisystemdesign.com/riscv-based-myth/). As part of this workshop participants were introduced to RISC-V GCC Toolchain, TL-Verilog and makerchip platform which helped to understand RISC-V architecture.
## Table of Contents
- Introduction to RISC-V ISA and GNU Compiler chain
- Introduction to ABI and basic verification using iverilog
- Digital logic design using TL-Verliog and Makerchip
- Basic RISC-V CPU Architecture
- Pipelined RISC-V CPU micro-architecture
## Introduction to RISC-V ISA and GNU Compiler chain
RISC-V is an open instruction set architecture (ISA) which can be used to implement a RISC-V for free without paying royalties. It also allows for customizations thus enabling developers to create processors for specific use cases.

ISA (Instruction Set Architecture) defines the types of instructions, the instruction format and maximum length of instructions supported by the implemented processor.

To convert the C program [Count from 1 to n](Day1/Code/Cprogramcountton.png) to machine code a RISC-V GCC compiler toolchain was used which contains a compiler and a disassembler. The machine code was then run on picorv32 cpu core implementation to validate the results.

Following commands were used to compile the C program







