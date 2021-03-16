`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2021 11:38:01 AM
// Design Name: 
// Module Name: PCRegister
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


module PCRegister(
    input clk,reset,
    input [31:0] Din,
    output reg [32:0] PC_out
    );
    
    always@(posedge clk, posedge reset)
        if(reset)
            PC_out <= 32'b0;
        else 
            PC_out <= Din;
endmodule
