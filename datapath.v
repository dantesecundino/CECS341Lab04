module Datapath(
    input clk,
    input reset,
    output [31:0] Dout
    );
    wire [31:0] pcAddress, pcAdder, instructionMem, rsOut, rtOut, writeData;
    wire [5:0] op, func;
    wire [4:0] rsIn, rtIn, rdIn;
    wire [3:0] ALUCntl;
    wire RegWrite;

    assign op = instructionMem[31:26];
    assign rsIn = instructionMem[25:21];
    assign rtIn = instructionMem[20:16];
    assign rdIn = instructionMem[15:11];
    assign func = instructionMem[5:0];
    
    PCRegister PC(.clk(clk), .reset(reset), .Din(pcAdder), .PC_out(pcAddress));
    PCADD PCadd(.Din(pcAddress), .PC_add_out(pcAdder));
    Instruction_Memory Imem(.Addr(pcAddress),.Inst_out(instructionMem));
    control cnt(.Op(op), .Func(func), .RegWrite(RegWrite), .ALUCntl(ALUCntl));
    regfile32 register(.clk(clk), .reset(reset), .D_En(RegWrite), .D_Addr(rdIn), .S_Addr(rsIn), .T_Addr(rtIn), .D(writeData), .S(rsOut), .T(rtOut));
    alu V(.A(rsOut), .B(rtOut), .ALUCntrl(ALUCntl), .ALU_Out(Dout));
    assign writeData = Dout;
endmodule
