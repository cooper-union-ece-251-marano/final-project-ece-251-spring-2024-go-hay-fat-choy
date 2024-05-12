[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/pelSJLGu)
# Catalog of Verilog Components to Build and Simulate a MIPS-based RISC.

This work is based off the MIPS Verilog code by [Harris and Harris](https://pages.hmc.edu/harris/ddca/ddca2e.html)

The basis of the single cycle computer as provided by these Verilog components:

This processor is single-cycled with 32-bit words and byte addressable memory. The datapath components include a program counter, a memory split into data and 
instruction memory, a regfile of 32 registers,, an ALU, a sign extender for immediate values, a maindecoder, an ALU decoder, several MUXes, and 2 adders. The main decoder and ALU decoder together form the controller, which turns on and off the other components in the data path to execute certain actions depending on the 
input instruction. 

To successfully demo, the mult-prog_exe file must be modified so that instructions, using our ISA, are hand compiled into machine code in hex and placed into the file. There can be no more than 64 instructions at a time due to instruction memory size limitations, and anything underneath that size should have the rest of the lines filled as 8 0s. In this case, there is a leaf and recursive demonstration (fibonacci) attached. To run the program, underneath the \catalog\computer directory, run:
```
make compile simulate
```
To view the timing diagram on GTKWave, run:
```
make display
```

Note that the duration alotted in each of the programs vary, so in the tb_computer.sv file underneath \catalog\computer, underneath the "// initialize test" commend, change the number next to finish. In the two demos, the leaf code will run and finish with #90, and the fib code will run with #500.

It should also be noted that we are aware that our last few lines of our fib code are sketchy, as we did not implement a stack pointer and function call in our assembly. We attempted to do so, but were unsuccessful. We believe that the issue lied somewhere in the fact that we were not utilizing the stack pointer, return address register, or the proper data path for a jal function. One of those (or a combination of those) resulted in $ra always being "don't care" values, and any time we attempted to load word to restore $s0, the register we were using to store the result of a function call, the value in $s0 would also become "don't care" values. The functions were iterating correctly, and the failed attempts with jal/implementation as function calls is attached.

Due to this error, instead, a non-function implementation was done for fib and our leaf code, and in the assembly, we are aware that without a stack pointer and function call system, we cannot quite save our resulting register into non-reserved or non-instruction memory space (we can only store up to 16 bits of an address, not 32, from our add immediate). So, we just wrote that we stored it into reserved space anyway, and the lw function that comes after is basically pointless. This was done just as a placeholder for storing it into the proper place in memory.