module Datapath_tb();
    reg clk_tb, reset_tb;
    wire [31:0] Dout_tb;

    integer i;

    Datapath uut(.clk(clk_tb), .reset(reset_tb), .Dout(Dout_tb));

    always
        #10 clk_tb = ~clk_tb;

    task Dump_RegFile; begin
        $timeformat(-9, 1, " ns", 9);
        for(i=0; i<32; i=i+1) begin
            @(posedge clk_tb)
            $display("t=%t rf[%0d]: %h", $time, i, uut.register.regArray[i]);
        end
    end
    endtask

    initial
    begin
        clk_tb = 0;
        $readmemh("imem.dat", uut.Imem.imem);
        $readmemh("regfile.dat", uut.register.regArray);
        reset_tb = 2'b1;
        #20 reset_tb = 2'b0;
        Dump_RegFile;
        $finish;
    end
endmodule
