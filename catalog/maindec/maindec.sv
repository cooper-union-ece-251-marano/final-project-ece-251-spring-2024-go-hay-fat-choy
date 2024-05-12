//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Zachary Hsieh and Andrew Yuan
// 
//     Create Date: 2023-02-07
//     Module Name: maindec
//     Description: 32-bit RISC-based CPU main decoder (MIPS)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef MAINDEC
`define MAINDEC

`timescale 1ns/100ps

module maindec
    #(parameter n = 32)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic [5:0] op,
    output logic       memtoreg, memwrite,
    output logic       branch, alusrc,
    output logic       regdst, regwrite,
    output logic       jump, jumpreg,
    output logic [1:0] aluop
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [9:0] controls; // 10-bit control vector

    // controls has 10 logical signals
    assign {regwrite, regdst, alusrc, branch, memwrite,
            memtoreg, jump, jumpreg, aluop} = controls;

    always @* begin
        case(op)
            6'b000000: controls <= 10'b1100000000; // RTYPE
            6'b000001: controls <= 10'b1010010011; // LW
            6'b000010: controls <= 10'b0010100011; // SW
            6'b000011: controls <= 10'b1010000011; // ADDI
            6'b000100: controls <= 10'b0001000010; // BEQ
            6'b000101: controls <= 10'b1010000001; // STLI
            6'b000110: controls <= 10'b0000001000; // Jump
            6'b000111: controls <= 10'b1100011000; //JAL
            6'b001000: controls <= 10'b0010001111; //jr
            default:   controls <= 10'bxxxxxxxxxx; // illegal operation
        endcase
    end

endmodule

`endif // MAINDEC
