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
        $dumpfile("./waves/alu_tb.vcd");
        $dumpvars(0, alu_tb);

        srcA = 32'h00000003;
        srcB = 32'h00000001;
        
        // or  t0, s0, s1
        ALUControl = 3'b011;
        #10
        // and t1, s0, s1
        ALUControl = 3'b010;
        #10
        // odd t2, s0, s1
        ALUControl = 3'b000;
        #10
        // sub t3, s0, s1
        ALUControl = 3'b001;
        #10
        // sub t4, s1, s0
        srcA = 32'h00000001;
        srcB = 32'h00000003;
        ALUControl = 3'b001;
        #10
        // slt t5, s0, s1
        srcA = 32'h00000003;
        srcB = 32'h00000001;
        ALUControl = 3'b101;
        #10
        // slt t6, s1, s0
        ALUControl = 3'b101;
        srcA = 32'h00000001;
        srcB = 32'h00000003;
        #10
        // eq t6, s1, t4
        ALUControl = 3'b100;
        #10

        $finish;
    end

endmodule