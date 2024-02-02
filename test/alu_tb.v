`include "dataPath/ALU.v"

module alu_tb;
    
    reg [31:0] SrcA;
    reg [31:0] SrcB;
    reg [2:0] AluControl;
    wire [31:0] AluResult;

    ALU uut(
        .SrcA(SrcA),
        .SrcB(SrcB),
        .AluControl(AluControl),
        .AluResult(AluResult)
    );

    initial begin
        SrcA = 10;
        SrcB = 12;
        

        for (integer i = 0 ; i<8 ; i=i+1 ) begin
            AluControl = i;
            #10
            $display("[op: %b] = %h (%d)", AluControl, AluResult, AluResult);
        end

        $finish;
    end

endmodule