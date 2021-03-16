`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Eric Chhour & Daniel Secundino
//////////////////////////////////////////////////////////////////////////////////

module datapath(
    input clk,
    input reset,
    output [31:0] Dout
    );
    //Wire Declarations
    wire [31:0]IMout, PCout, PCAddout, rs, rt;
    wire [3:0] ALUCntl; 
    wire Negative, Zero, Overflow, Carry, RegWrite;
    
    //Wire everything together
    PCRegister pc(.clk(clk), .reset(reset), .Din(PCAddout), .PC_out(PCOut));
    PCADD pcadd(.Din(PCOut), .PC_add_out(PCAddout));
    Instruction_Memory im(.Addr(PCOut), .Inst_out(IMout));
    regfile32 rf(.clk(clk), .reset(reset), .D_En(RegWrite), .D_Addr(IMout[11:15]), .S_Addr(IMout[25:21]), .T_Addr(IMout[20:16]), .D(Dout), .s(rs), .t(rt));
    control cnt(.Op(IMout[5:0]), .Func(IMout[31:26]), .RegWrite(RegWrite), .ALUCntl(ALUCntl));
    ALU V(.A(rs), .B(rt), .ALUCntl(ALUCntrl), .ALUout(Dout), .N(Negative), .Z(Zero), .C(Carry), .V(Overflow));
endmodule
