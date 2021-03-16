`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//Eric Chhour
//CECS341 Lab 02
//2/06/21
//////////////////////////////////////////////////////////////////////////////////

module testBench;
    //Reg=inputs, wire=outputs
	reg clkTB, resetTB;
	wire [31:0]DoutTB;
	
	integer i;
	
	Datapath uut(.clk(clkTB), .reset(resetTB), .Dout(DoutTB));
	
	always 
	   #10 clkTB = ~clkTB;
	task Dump_RegFile; begin
        $timeformat(-9, -1, " ns", 9);
        for(i=0; i<32; i=i+1) begin
            @(posedge clkTB)
            $display("t=%t rf[%0d]: %h", $time, i, uut.rf.regArray[i]);
	       end
	    end
	endtask
	
	initial begin
	   $readmemh("imem.dat", uut.im.imem);    
	   $readmemh("regfile.dat", uut.rg.regArray);
	   resetTB = 2'b1;
       #20 resetTB = 2'b0;
	   Dump_RegFile;
	   $finish;
	end

endmodule
