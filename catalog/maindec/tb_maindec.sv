//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Zachary Hsieh and Andrew Yuan
// 
//     Create Date: 2023-02-07
//     Module Name: tb_maindec
//     Description: Test bench for simple behavorial main decoder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_MAINDEC
`define TB_MAINDEC

`timescale 1ns/100ps
`include "maindec.sv"

module tb_maindec;
    parameter N = 32;

    reg [5:0] OP;

    wire REGWRITE;
    wire REGDST;
    wire ALUSRC;
    wire BRANCH;
    wire MEMWRITE;
    wire MEMTOREG;
    wire JUMP;
    wire [1:0] ALUOP;

    //apply input vectors
    initial begin : prog_apply_stimuli
    #0
    OP = 0;
    #10 
    for(int i=0; i<2**3+1; i++)
    begin
        OP = i;
        #10;
        $display("OP: %b\tOUTPUT: %b%b%b%b%b%b%b%b\n", OP, REGWRITE, REGDST, ALUSRC, BRANCH, MEMWRITE, MEMTOREG, JUMP, ALUOP);
        #10;
    end
    #10
    $finish;
end

//
// ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
//
maindec uut(.op(OP), .regwrite(REGWRITE), .regdst(REGDST), .alusrc(ALUSRC), .branch(BRANCH), .memwrite(MEMWRITE), .memtoreg(MEMTOREG),
            .jump(JUMP), .aluop(ALUOP));


endmodule
`endif // TB_MAINDEC