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
   parameter N = 8;

   reg [N-1:0] A;
   reg [N-1:0] B;   //inputs are reg for test bench
   reg EN;

   wire [N-1:0] SUM;     //outputs are wire for test bench
   wire CARRY;
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   initial
     begin
        $dumpfile("tb_example_module.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, uut);
     end

   initial begin : initialize_variable
   A = 8'b00000000;
   B = 8'b00000000;
   EN = 1'b1;
   end

   //apply input vectors
   initial
   begin: apply_stimulus
      #0
      #10 EN = 1'b1;
      for(int i=0; i<2**N; i++)
         begin
            for(int j=0; j<2**N; j++)
               begin
                  A = i;
                  B = j;
                  #10
                  $display("A=%b B=%b EN=%b CARRY=%b SUM=%b\n", A, B, EN, CARRY, SUM);
               end
         end
      #10 EN = 1'b0;
      for(int i=0; i<2**N; i++)
         begin
            for(int j=0; j<2**N; j++)
               begin
                  A = i;
                  B = j;
                  #10
                  $display("A=%b B=%b EN=%b CARRY=%b SUM=%b\n", A, B, EN, CARRY, SUM);
               end
         end
      #10
      $finish;
   end

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   adder uut(.a(A), .b(B), .en(EN), .sum(SUM), .carry(CARRY));

endmodule