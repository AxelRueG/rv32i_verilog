`include "./dataPath/ALU.v"

module alu_tb;
    
    reg [31:0] srcA;
    reg [31:0] srcB;
    reg [2:0] ALUControl;
    wire [31:0] res;
    wire zero;

    ALU uut(
        .srcA(srcA),
        .srcB(srcB),
        .ALUControl(ALUControl),
        .res(res),
        .zero(zero)
    );

    initial begin
        srcA = 10;
        srcB = 12;
        

        for (integer i = 0 ; i<8 ; i=i+1 ) begin
            ALUControl = i;
            #10
            $display("{\n[op: %b] = %h (%d)\nzero: %b\n}", ALUControl, res, res, zero);
        end

        $finish;
    end

endmodule