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
    output logic       jump,
    output logic [1:0] aluop
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [8:0] controls; // 9-bit control vector

    // controls has 9 logical signals
    assign {regwrite, regdst, alusrc, branch, memwrite,
            memtoreg, jump, aluop} = controls;

    always @* begin
        case(op)
            6'b000000: controls <= 9'b110000000; // RTYPE
            6'b000001: controls <= 9'b101001011; // LW
            6'b000010: controls <= 9'b001010011; // SW
            6'b000011: controls <= 9'b101000011; // ADDI
            6'b000100: controls <= 9'b000100010; // BEQ
            6'b000101: controls <= 9'b101000001; // STLI
            6'b000110: controls <= 9'b000000100; // Jump
            6'b000111: controls <= 9'b110001100; //JAL
            default:   controls <= 9'bxxxxxxxxx; // illegal operation
        endcase
    end

endmodule

`endif // MAINDEC
