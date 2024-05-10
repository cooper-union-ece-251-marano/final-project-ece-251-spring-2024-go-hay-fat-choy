//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Zachary Hsieh and Andrew Yuan
// 
//     Create Date: 2023-02-07
//     Module Name: tb_alu
//     Description: Test bench for simple behavorial ALU
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_ALU
`define TB_ALU

`timescale 1ns/100ps
`include "alu.sv"

module tb_alu;
    parameter N = 32;

    reg [N-1:0] A;
    reg [N-1:0] B;
    reg [2:0] OP;
    reg CLK;

    wire [N-1:0] Y;

    initial begin : initialize_variable
    A = 0;
    B = 0;
    end

    always begin : clock
        #5 CLK = ~CLK;
    end

    always @(posedge CLK) 
    begin
        case (OP)
            3'b000: $display("A=%b B=%b OP=%b Y=%b Zero=%b\n", A, B, OP, Y, ZERO);
            3'b001: $display("A=%b B=%b OP=%b Y=%b Zero=%b\n", A, B, OP, Y, ZERO);
            3'b010: $display("A=%b B=%b OP=%b Y=%b Zero=%b\n", A, B, OP, Y, ZERO);
            3'b011: $display("A=%b B=%b OP=%b Y=%b Zero=%b\n", A, B, OP, Y, ZERO);
            3'b100: $display("A=%b B=%b OP=%b Y=%b Zero=%b\n", A, B, OP, Y, ZERO);
            3'b101: $display("A=%b B=%b OP=%b Y=%b Zero=%b\n", A, B, OP, Y, ZERO);
            3'b110: $display("A=%b B=%b OP=%b Y=%b Zero=%b\n", A, B, OP, Y, ZERO);
            3'b111: $display("A=%b B=%b OP=%b Y=%b Zero=%b\n", A, B, OP, Y, ZERO);
        endcase
    end


    //apply input vectors
    initial begin
    $dumpfile("tb_alu.vcd");
    $dumpvars(0, tb_alu.uut);
    A = 32'b11100000010100010110011110101010;
    B = 32'b01100001100101100100101001011111;
    CLK = 0;
    #10;
    OP = 3'b000;
    #10;
    OP = 3'b001;
    #10;
    OP = 3'b010;
    #10;
    OP = 3'b011;
    #10;
    OP = 3'b100;
    #10;
    OP = 3'b101;
    #10;
    OP = 3'b110;
    #10;
    $finish;
end

//
// ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
//
alu uut(.a(A), .b(B), .clk(CLK), .op(OP), .zero(ZERO), .y(Y));


endmodule
`endif // TB_ALU