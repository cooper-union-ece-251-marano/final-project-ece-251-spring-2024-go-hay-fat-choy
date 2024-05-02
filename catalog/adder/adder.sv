//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Zachary Hsieh and Andrew Yuan
// 
//     Create Date: 2023-02-07
//     Module Name: adder
//     Description: simple behavorial adder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef ADDER
`define ADDER

`timescale 1ns/100ps

module adder
    #(parameter n = 32)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    
    input logic [n-1:0] a,
    input logic [n-1:0] b,
    input logic en,
    output logic [n-1:0] sum, //two outputs for an adder
    output logic carry
);

    reg [n:0] temp;
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    always @(*) begin
        if(en)
            begin
            temp = a + b;
            carry = temp[n];
            sum = temp[n-1:0];
            end
        else
            begin
            sum = 'bz;
            carry = 'bz;
            end

    end

endmodule

`endif // ADDER