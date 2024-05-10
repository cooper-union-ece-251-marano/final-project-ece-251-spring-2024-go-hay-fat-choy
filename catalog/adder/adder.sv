//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Andrew Yuan and Zachary Hsieh
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
    output logic [n-1:0] y
);

    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    assign y = a + b;


endmodule

`endif // ADDER