// Componenetes del Datapath
`include "./dataPath/Adder16.v"
`include "./dataPath/PC.v"
`include "./dataPath/BR.v"
`include "./dataPath/SE.v"
`include "./dataPath/ALU.v"
`include "./dataPath/Mux2x1.v"
`include "./dataPath/Mux4x1.v"
`include "./dataPath/Mux16.v"

module dataPath (
    // ---------------------------------------------------------------------------------------------
    //                                      Entradas 
    // ---------------------------------------------------------------------------------------------
    input wire clk,         // desde TOP
    input [31:0] instr,     // desde MEM
    input [31:0] readData,  // desde MEM

    // entradas de UC
    input wire branch,      // senial para el deco
    input wire jump,        // senial para el deco
    input [1:0] resultSrc,  // dato que se guarda en registro
    input [2:0] ALUControl, // especifica la operacion de la ALU
    input wire ALUSrc,      // si usamos el imm o rd2 en la ALU
    input [1:0] inmSrc,     // para Extension de signo
    input wire regWrite,    // enable save in BR

    // ---------------------------------------------------------------------------------------------
    //                                      Salidas
    // ---------------------------------------------------------------------------------------------
    output [15:0] pc,
    output [31:0] ALUResult,
    output [31:0] writeData,
    output wire zero,
    output [6:0] opecode,
    output [2:0] f3,
    output wire f7
);
    // CONSTANTES
    reg [15:0] cuatro = 4;

    // Seniales internas
    wire [15:0] s_pcNext;
    wire [15:0] s_pc;
    wire [15:0] s_pcTarget;
    wire [15:0] s_pcPlus;
    wire [15:0] s_pcJump;
    wire [15:0] s_PCK1;

    wire [31:0] s_InmExt;
    wire [31:0] s_srcA;
    wire [31:0] s_srcB;
    wire [31:0] s_src2;
    wire [31:0] s_ALUResult;
    wire [31:0] s_result;

    // ---------------------------------------------------------------------------------------------
    //                                      Componentes
    // ---------------------------------------------------------------------------------------------
    Mux16 muxPcNext(
        .e1(cuatro),
        .e2(s_InmExt[15:0]),
        .sel(branch),    
        .sal(s_pcPlus)
    );

    Adder16 addPC4(
        .op1(s_pcPlus),
        .op2(s_pc),
        .res(s_pcNext)
    );

    Adder16 addPCJump(
        .op1(s_InmExt[15:0]),
        .op2(s_pc),
        .res(s_pcJump)
    );

    Mux16 muxJump(
        .e1(s_pcNext),
        .e2(s_pcJump),
        .sel(jump),
        .sal(s_PCK1)
    );

    PC pcReg (
        .clk(clk),
        .pcNext(s_PCK1),
        .pc(s_pc)
    );

    BR bancoDeRegistros(
        .clk(clk),
        .a1(instr[19:15]),
        .a2(instr[24:20]),
        .a3(instr[11:7]),
        .wd3(s_result),
        .we(regWrite),
        .rd1(s_srcA),
        .rd2(s_src2)
    );

    SE extensionDeSigno(
        .instr(instr),
        .src(inmSrc),
        .immExt(s_InmExt)
    );

    ALU alu(
        .srcA(s_srcA),
        .srcB(s_srcB),
        .ALUControl(ALUControl),
        .res(s_ALUResult),
        .zero(zero)
    );

    Mux2x1 muxSrcB(
        .e1(s_src2),
        .e2(s_InmExt),
        .sel(ALUSrc),
        .sal(s_srcB)
    );

    Mux4x1 muxResult(
        .e1(s_ALUResult),
        .e2(readData),
        .e3(s_InmExt),
        .e4({16'b0, s_pcNext}),
        .sel(resultSrc),
        .sal(s_result)
    );


    assign pc = s_pc;
    assign ALUResult = s_ALUResult;
    assign writeData = s_src2;

    assign f7 = instr[30];
    assign f3 = instr[14:12];
    assign op = instr[6:0];


endmodule