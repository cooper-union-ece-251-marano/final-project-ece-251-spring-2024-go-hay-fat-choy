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
    #(parameter n = 16)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //

    input logic clk,
    input logic [(n-1):0], a, b,
    input logic [2:0] op,
    output logic [(n-1): 0] y,
    output logic zero
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //

    logic [(n-1):0]invertb;

    assign zero = (y == {n{1'b0}}); 
    assign invertb = op[2] ? ~b : b; //inverting
    assign subtraction = a + invertb + op[2];   //adding the two's complement invertedb along with 1 and then adding a on top of it: effectively subtraction

    always @(a,b,op) begin
        case(op)
            3'b000: y = a & b;  //and
            3'b001: y = a | b;  //or
            3'b010: y = a + b;  //add
            3'b011: y = ~(a | b);   //nor
            3'b100: y = subtraction;    subtract
            3'b101: begin   //set less than
                if (a < b) 
                begin
                    y = 1;
                end
                else
                begin
                    y = 0;
                end
            end
            3'b110: y = zero;
        endcase
    end



endmodule

`endif // ALU
