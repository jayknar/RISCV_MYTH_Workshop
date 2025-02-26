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

To convert the C program [Count from 1 to n](Day1/Code/C_program_count_to_n.png) to machine code a RISC-V GCC compiler toolchain was used which contains a compiler and assembler. The object code is run on RISC-V function simulator called Spike.

To use the risc-v gcc compiler use below command: 

`riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o <object filename> <C filename>`

It was observed that if we used -Ofast option instead of -O1 option the optimization increased and the generated instructions were less. For the same C program the number of instructions for -O1 option was 15 and -Ofast option was 12.

To visualize the assembly code use the below command:

`riscv64-unknown-elf-objdump -d <object filename>`

The assembly code is available [here](Day1/assembly_code_with_ofast_option)

The object code is then run using Spike simulator and we get the [result](using_spike_to_run_program.png) of the C program

The command to run the spike simulator is:

`spike pk <object filename>`

Spike can also be used as a debugger to step through the instructions and find the register values. [snapshot](Day1/run_till_100b0_pc.png)

Debug command:

`spike -d pk <object Filename>` 

To go to PC of our choice - `until pc 0 <pc of your choice>`

## Introduction to ABI and basic verification using iverilog


















