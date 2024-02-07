`include "./memory/DM.v"
`include "./memory/IM.v"

module mem(
    input wire clk,
    input wire we,
    input [15:0] pc,
    input [15:0] addr,
    input [31:0] writeData,
    output [31:0] instr,
    output [31:0] readData
);

    DM dataMemory(
        .clk(clk), 
        .we(we),
        .addres(addr),
        .wd(writeData),
        .rd(readData)
    );

    IM instructionMemory(
        .addres(pc),
        .rd(instr)
    );

endmodule