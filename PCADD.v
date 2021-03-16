`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2021 11:37:39 AM
// Design Name: 
// Module Name: PCADD
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PCADD(
    input [31:0] Din,
    output [31:0] PC_add_out
    );
    assign PC_add_out = Din+4;
endmodule
