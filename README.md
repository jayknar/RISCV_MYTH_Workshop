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

This command will be show the PC(Program counter) values, the address of the instructions in memory, the assembly language instructions used and the registers that are accessed by these instructions.
Since a byte of data in stored at a particular memory location, the addresses will be incremented by 32'd4 after each instruction.

The assembly code is available [here](Day1/assembly_code_with_ofast_option)


The object code is then run using Spike simulator and we get the [result](using_spike_to_run_program.png) of the C program

The command to run the spike simulator is:

`spike pk <object filename>`

Spike can also be used as a debugger to step through the instructions and find the register values. [snapshot](Day1/run_till_100b0_pc.png)

Debug command:

`spike -d pk <object Filename>` 

To go to PC of our choice - `until pc 0 <pc of your choice>`

## Introduction to ABI and basic verification using iverilog
Application Binary Interface is a set of libraries available in high-level languages like C/Java that allows the application programmers to access some of the registers available in the hardware using system calls. Most of the registers are accessible to OS only through the System ISA. 

There are 32 registers available RV32 and RV64. The width of each register is defined using XLEN. XLEN is 32 bits for RV32 and 64 bit for RV64. 
There are 2 different ways to load data into the registers:

- Load the 64 bit registers directly
- Load into memory and then load to register

Since only 4 bytes can be stored in one memory location in RISC-V, multiple memory access will be required to access the instructions. Also RISC-V belongs to the little-endian memory adddressing system where the lower byte is stored in first memory location, next byte in second memory location and so on.

Instruction size in RV32 and RV64 is fixed at 32 bits.There are many types of instructions that are supported by RISC-V. RV64I are the base integer instructions that supports operations on integers.

The C program was modified to call a load function which was implemented using assembly instructions. The load function used register manipulations, branch and jump instructions to get the sum of numbers from 1 to N. The C program only passed the number N and the result of the summation was returned by the assembly code to the C program.

The modified C program is available [here](Day2/1t09_custom_c.png)

The C program was converted to hex and was executed in RISC-V picorv-32 verilog implementation using iverilog open source compiler. The results of the verification is shown [here](Day2/C_program_verification.png)

## Digital logic design using TL-Verliog and Makerchip
Makerchip IDE allows easier circuit design using the emerging [TL-Verilog](https://www.tl-x.org/) (Transaction Level Verilog Standard). TL-Verilog introduces new constructs that simplify designing of pipelined logic. The [Makerchip](https://www.makerchip.com/) IDE provides a platform for designing circuits using TL-Verilog, visualize the generated logic and get the waveforms for testing the design functionality.

TL-Verilog provides an operator `>>1$in` which provides the value of 'in' signal 1 cycle before. Similarly we can get signals 2 or 3 cycles before current clock using `>>2` and `>>3`.

Timing abstract concept of TL-Verilog allows to convert the design to a pipelined design easily using `|pipe` scope with each pipeline stage defined as `@n` 
where n is the pipeline stage number.

TL-Verilog introduces another concept called Validity. Signals are assigned to a variable `$valid` specifiying the condition when the design needs to be executed.
Using `?$valid` we indent the part of the code that needs to be executed only when the condition is satisfied.

The following designs were implemented using TL-Verilog concepts:
[Combinational Calculator](Day3/























