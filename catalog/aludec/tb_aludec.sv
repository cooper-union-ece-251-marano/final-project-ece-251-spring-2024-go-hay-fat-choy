//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Zachary Hsieh & Andrew Yuan
// 
//     Create Date: 2023-02-07
//     Module Name: tb_aludec
//     Description: Test bench for simple behavorial ALU decoder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_ALUDEC
`define TB_ALUDEC

`timescale 1ns/100ps
`include "aludec.sv"

module tb_aludec;
 // Inputs
    reg [5:0] funct;
    reg [1:0] aluop;

    // Outputs
    wire [2:0] alucontrol;

    // Instantiate the Unit Under Test (UUT)
    aludec uut (
        .funct(funct),
        .aluop(aluop),
        .alucontrol(alucontrol)
    );

    // Testbench logic
    initial begin
        // Initialize Inputs
        funct = 0;
        aluop = 0;

        // Wait for global reset
        #100;
        
        // Test various combinations
        funct = 6'b100000; aluop = 2'b00; #100;
        funct = 6'b100101; aluop = 2'b00; #100;
        funct = 6'b100000; aluop = 2'b00; #100;
        funct = 6'b100111; aluop = 2'b00; #100;
        funct = 6'b100010; aluop = 2'b00; #100;
        funct = 6'b101010; aluop = 2'b00; #100;
        funct = 6'b000000; aluop = 2'b00; #100;
        funct = 6'b000010; aluop = 2'b00; #100;

        funct = 6'bxxxxxx; aluop = 2'b01; #100; // Tests for partial don't care in `funct`
        funct = 6'bxxxxxx; aluop = 2'b10; #100; // Tests for partial don't care in `funct`
        funct = 6'bxxxxxx; aluop = 2'b11; #100; // Tests for partial don't care in `funct`

        // Additional test for undefined operation
        funct = 6'b010101; aluop = 2'b11; #100;

        // Finish simulation
        $finish;
    end

    // Monitor changes
    initial begin
        $monitor("At time %t, funct = %b, aluop = %b, alucontrol = %b", $time, funct, aluop, alucontrol);
    end

endmodule
`endif // TB_ALUDEC