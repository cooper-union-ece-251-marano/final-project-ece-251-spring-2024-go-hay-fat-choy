//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Zachary Hsieh & Andrew Yuan
// 
//     Create Date: 2023-02-07
//     Module Name: aludec
//     Description: 16-bit RISC ALU decoder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef ALUDEC
`define ALUDEC

`timescale 1ns/100ps

module aludec
    #(parameter n = 16)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input logic [5:0] funct,      //
    input logic [1:0] aluop,      //Operation type
    output logic [2:0] alucontrol //ALU operations
    );
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    always @*
    begin
        case(aluop)                  //I-type instructions
        2'b11: alucontrol <= 3'b010; // addi (for lw/sw/jr/addi)
        2'b10: alucontrol <= 3'b100; // subi (for beq)
        2'b01: alucontrol <= 3'b101; //slt (for slti)
            default: case(funct)           // R-type instructions
                6'b100100: alucontrol <= 3'b000; // and
                6'b100101: alucontrol <= 3'b001; // or
                6'b100000: alucontrol <= 3'b010; // add
                6'b100111: alucontrol <= 3'b011; // nor
                6'b100010: alucontrol <= 3'b100; // subtract
                6'b101010: alucontrol <= 3'b101; // slt
                6'b000000: alucontrol <= 3'b110; // sll
                6'b000010: alucontrol <= 3'b111; // slr
                default: alucontrol <= 3'bxxx; // ???
            endcase
        endcase
    end
endmodule

`endif // ALUDEC