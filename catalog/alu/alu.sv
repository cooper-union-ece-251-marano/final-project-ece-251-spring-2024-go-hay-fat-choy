//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Zachary Hsieh and Andrew Yuan
// 
//     Create Date: 2023-02-07
//     Module Name: alu
//     Description: 32-bit RISC-based CPU alu (MIPS)
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

    logic [(n-1):0]invertb, sum;

    assign zero = (y == {n{1'b0}});
    assign invertb = op[2] ? ~b : b;
    assign sumSlt = a + invertb + op[2];

    always @(a,b,op) begin
        case(op)
            3'b000: y = a & b;
            3'b001: y = a | b;
            3'b010: y = a + b;
            3'b011: y = ~(a | b);
            3'b100: y = sumSlt;
            3'b101: begin
                if (a[31] != b[31])
                    if(a[31]>b[31])
                        y = 1;
                    else
                        y = 0;
                else
                    if(a<b)
                        y=1;
                    else
                        y=0;
            end
            3'b110: y = 0;
        endcase
    end



endmodule

`endif // ALU
