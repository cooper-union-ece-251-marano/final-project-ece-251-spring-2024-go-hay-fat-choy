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


    //apply input vectors
    initial begin : prog_apply_stimuli
    #0
    #10 
    OP = 3'b000;
    for(int i=0; i<2**N; i++)
        begin
        for(int j=0; j<2**N; j++)
            begin
                A = i;
                B = j;
                #10
                $display("A=%b B=%b OP=%b Y=%b\n", A, B, OP, Y);
            end
        end
    #10 
    OP = 3'b001;
    for(int i=0; i<2**N; i++)
        begin
        for(int j=0; j<2**N; j++)
            begin
                A = i;
                B = j;
                #10
                $display("A=%b B=%b OP=%b Y=%b\n", A, B, OP, Y);
            end
        end
    OP = 3'b010;
    for(int i=0; i<2**N; i++)
        begin
        for(int j=0; j<2**N; j++)
            begin
                A = i;
                B = j;
                #10
                $display("A=%b B=%b OP=%b Y=%b\n", A, B, OP, Y);
            end
        end
    OP = 3'b011;
    for(int i=0; i<2**N; i++)
        begin
        for(int j=0; j<2**N; j++)
            begin
                A = i;
                B = j;
                #10
                $display("A=%b B=%b OP=%b Y=%b\n", A, B, OP, Y);
            end
        end
    OP = 3'b100;
    for(int i=0; i<2**N; i++)
        begin
        for(int j=0; j<2**N; j++)
            begin
                A = i;
                B = j;
                #10
                $display("A=%b B=%b OP=%b Y=%b\n", A, B, OP, Y);
            end
        end
    OP = 3'b101;
    for(int i=0; i<2**N; i++)
        begin
        for(int j=0; j<2**N; j++)
            begin
                A = i;
                B = j;
                #10
                $display("A=%b B=%b OP=%b Y=%b\n", A, B, OP, Y);
            end
        end
    OP = 3'b110;
    for(int i=0; i<2**N; i++)
        begin
        for(int j=0; j<2**N; j++)
            begin
                A = i;
                B = j;
                #10
                $display("A=%b B=%b OP=%b Y=%b\n", A, B, OP, Y);
            end
        end 
    #10
    $finish;
end

//
// ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
//
alu uut(.a(A), .b(B), .clk(CLK), .op(OP), .zero(ZERO), .y(Y));


endmodule
`endif // TB_ALU