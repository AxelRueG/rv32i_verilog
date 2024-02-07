`include "./dataPath/SE.v"

module SE_tb;


    reg clk;
    reg [31:0] instr;
    reg [1:0] src;
    wire [31:0] immExt;

    SE uut(
        .clk(clk),
        .instr(instr),
        .src(src),
        .immExt(immExt)
    );

    // configuro reloj
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // seniales de prueba
    initial begin

        // CLASE I
        // imm[11:0] rs1 func3 rd opcode
        // <1010 0111 0101> 0000 0000 0000 0000 0000 -> <a75>
        instr = 32'b10100111010100000000000000000000;
        src = 2'b00;
        #10
        $display("instr: %b", instr);
        $display("instr: %b, %h", immExt, immExt);

        // CLASE S
        // imm[11:5] rs2 rs1 func3 imm[4:0] opcode
        // <1010 011> 0 0000 0000 0000 <1010 1> 000 0000 -> <a75>
        instr = 32'b10100110000000000000101010000000;
        src = 2'b01;
        #10
        $display("instr: %b", instr);
        $display("instr: %b, %h", immExt, immExt);

        // CLASE B
        // imm[12] imm[10:5] rs2 rs1 func3 imm[4:1] imm[11] opcode
        // <1> <010 011> 0 0000 0000 0000 <1010> <1> 000 0000 -> 1 1010 0111 0100 -> <1a74>
        instr = 32'b10100110000000000000101010000000;
        src = 2'b10;
        #10
        $display("instr: %b", instr);
        $display("instr: %b, %h", immExt, immExt);

        // CLASE U
        // imm[31:12] rd opcode

        // CLASE J
        // imm[20] imm[10:1] imm[11] imm[19:12] rd opcode
        // <1> <010 0110 000> <0> <0000 0000> 1010 1000 0000 -> 1 0000 0000 0010 0110 0000 -> 100260
        instr = 32'b10100110000000000000101010000000;
        src = 2'b11;
        #10
        $display("instr: %b", instr);
        $display("instr: %b, %h", immExt, immExt);


        $finish;
    end

endmodule