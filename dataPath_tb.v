`include "./dataPath.v"
`timescale 100 ns / 10 ns

module dataPath_tb;
    // --- INPUTS ---
    reg clk;
    // datos de mem
    reg [31:0] instr;
    reg [31:0] readData;
    // entradas de UC
    reg branch;       
    reg jump;         
    reg [1:0] resultSrc;
    reg [2:0] ALUControl;
    reg ALUSrc;       
    reg [1:0] inmSrc;
    reg regWrite;     

    // --- OUTPUTS ---
    wire [15:0] pc;
    wire [31:0] ALUResult;
    wire [31:0] writeData;
    wire zero;
    wire [6:0] opecode;
    wire [2:0] f3;
    wire f7;

    dataPath uut(
        .clk(clk),
        .instr(instr),
        .readData(readData),
        .inmSrc(inmSrc),
        .regWrite(regWrite),
        .ALUControl(ALUControl),
        .pc(pc),
        .ALUResult(ALUResult),
        .writeData(writeData)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("dataPath.vcd");
        $dumpvars(0, dataPath_tb);

        // simulamos un addi
        instr = 32'b00000000000100001000000100000000;
        readData = 32'bx;
        
        branch = 0;
        jump = 0;
        resultSrc = 0; 
        ALUControl = 3'b000;
        ALUSrc = 1;
        inmSrc = 2'b00;
        regWrite = 1;
         
        $display("--- Entradas ---");
        $display("instr: %b", instr);
        $display("readData: %b", readData);
        $display("regWrite: %b", regWrite);
        $display("aluControl: %b", ALUControl);
        $display("--- Salidas ---");
        $display("pc: %b", pc);
        $display("alu result: %b", ALUResult);
        #10

        $display("");
        $display("--- Entradas ---");
        $display("instr: %b", instr);
        $display("readData: %b", readData);
        $display("regWrite: %b", regWrite);
        $display("aluControl: %b", ALUControl);
        $display("--- Salidas ---");
        $display("pc: %b", pc);
        $display("alu result: %b", ALUResult);
        #10
        
        $finish;
    end


endmodule