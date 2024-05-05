//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Zachary Hsieh and Andrew Yuan
// 
//     Create Date: 2023-02-07
//     Module Name: alu
//     Description: 16-bit RISC-based CPU alu (MIPS)
//
// Revision: 1.0
// see https://github.com/Caskman/MIPS-Processor-in-Verilog/blob/master/ALU32Bit.v
//////////////////////////////////////////////////////////////////////////////////
`ifndef ALU
`define ALU

`timescale 1ns/100ps

module alu
    #(parameter n = 32)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //

    input logic clk,
    input logic [n-1:0] a, 
    input logic [n-1:0] b,
    input logic [2:0] op,
    output logic [n-1: 0] y,
    output logic zero
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //


    assign zero = (y == {n{1'b0}}); //assigning zero to be the matching n bits of the output, with each output to be 0

    always @(a,b,op) begin
        case(op)
            3'b000: y = a & b;  //and
            3'b001: y = a | b;  //or
            3'b010: y = a + b;  //add
            3'b011: y = ~(a | b);   //nor
            3'b100: y = a-b;    //subtract
            3'b101: y = (a < b) ? {n{1'b1}} : {n{1'b0}};   //set less than
            3'b110: y = a << b[3:0]; //sll; we have 16 bits, so our max shift amount of 16, which is 4 bits of b if we assume that b is the shift amount and a is the shifted number
            3'b111: y = a >> b[3:0]; //slr
        endcase
    end



endmodule

`endif // ALU
