`include "./Top.v"
`timescale 100ns/10ns

module top_tb;
    
    reg clk = 0;
    always #5 clk = ~clk;

    wire [31:0] instr;

    Top uut(
        .clk(clk),
        .instr(instr)
    );

    integer i;
    initial begin
        $dumpfile("./waves/top_tb.vcd");
        $dumpvars(0, top_tb);    

        for (i = 0; i<100 ; i = i + 1) begin
            #10
            $display("instr[%d]: %h", i, instr);
        end

        $finish;
    end

endmodule