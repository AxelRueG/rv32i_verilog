`include "./rv32i.v"
`include "./mem.v"

module Top (
    input wire clk,
    output [31:0] instr
);

    wire [31:0] s_instr;
    wire [31:0] s_readData;
    wire [15:0] s_pc;
    wire [31:0] s_ALUResult;
    wire [31:0] s_writeData;
    wire s_memWrite;

    rv32i procesador (
        .clk(clk),
        .instr(s_instr),
        .readData(s_readData),
        .pc(s_pc),
        .ALUResult(s_ALUResult),    // direccion para datamemory
        .writeData(s_writeData),    // valor a guardar
        .memWrite(s_memWrite)
    );

    mem memoria(
        .clk(clk),
        .we(s_memWrite),
        .pc(s_pc),
        .addr(s_ALUResult[15:0]),
        .writeData(s_writeData),
        .instr(s_instr),
        .readData(s_readData)
    );

    assign instr = s_instr;

endmodule