`include "./dataPath.v"
`include "./UC.v"

module rv32i (
    // --------------------------------------------------------------
    //              INPUTS
    // --------------------------------------------------------------
    input wire clk,
    // desde la memoria
    input [31:0] instr,
    input [31:0] readData,

    // --------------------------------------------------------------
    //              OUTPUTS
    // --------------------------------------------------------------
    output [15:0] pc,
    output [31:0] ALUResult,    // direccion para datamemory
    output [31:0] writeData,    // valor a guardar
    output wire memWrite
);

    wire s_f7;
    wire [2:0] s_f3;
    wire [6:0] s_op;
    wire s_zero, s_branch, s_jump;
    wire [1:0] s_resSrc;
    wire [2:0] s_ALUControl;
    wire s_aluSrc, s_regWrite;
    wire [1:0] s_immSrc;
    
    UC uc(
        .f7(s_f7),
        .f3(s_f3),
        .op(s_op),
        .zero(s_zero),
        .branch(s_branch),
        .jump(s_jump),
        .memWrite(memWrite),
        .resSrc(s_resSrc),
        .ALUcontrol(s_ALUControl),
        .aluSrc(s_aluSrc),
        .immSrc(s_immSrc),
        .regWrite(s_regWrite)
    );

    dataPath dp(
        .clk(clk),
        .instr(instr),
        .readData(readData),
        .branch(s_branch),
        .jump(s_jump),
        .resultSrc(s_resSrc),
        .ALUControl(s_ALUControl),
        .ALUSrc(s_aluSrc),
        .inmSrc(s_immSrc),
        .regWrite(s_regWrite),
        .pc(pc),
        .ALUResult(ALUResult),
        .writeData(writeData),
        .zero(s_zero),
        .opecode(s_op),
        .f3(s_f3),
        .f7(s_f7)
    );

endmodule