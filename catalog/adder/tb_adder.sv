//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Zachary Hsieh and Andrew Yuan
// 
//     Create Date: 2023-02-07
//     Module Name: tb_adder
//     Description: Test bench for simple behavorial adder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_ADDER
`define TB_ADDER

`timescale 1ns/100ps
`include "./adder.sv"

module tb_adder;
   parameter N = 32;

   reg [N-1:0] A;
   reg [N-1:0] B;   //inputs are reg for test bench

   wire [N-1:0] Y;     //outputs are wire for test bench
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //

   //apply input vectors
   initial begin: apply_stimulus
   A = 32'b00110101100100111001111111000000;
   B = 32'b10101111010000000101010001011001;
   $display("A=%b B=%b Y=%b\n", A, B, Y);
      $finish;
   end


   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   adder uut(.a(A), .b(B), .y(Y));

endmodule

`endif // TB_ADDER