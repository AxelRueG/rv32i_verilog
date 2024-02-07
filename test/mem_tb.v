`include "./mem.v"
`timescale 100ns/10ns

module mem_tb;
    
    reg clk;
    reg we;
    reg [15:0] pc;
    reg [15:0] addr;
    reg [31:0] writeData;
    wire [31:0] instr;
    wire [31:0] readData;

    mem uut(
        .clk(clk),
        .we(we),
        .pc(pc),
        .addr(addr),
        .writeData(writeData),
        .instr(instr),
        .readData(readData)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Guardamos el archivo de waves
        $dumpfile("./waves/mem_tb.vcd");
        $dumpvars(0, mem_tb);

        // genero seniales
        // caso 1: 
        // - tomo la primera instruccion
        // - en DM[0] guardo un valor 
        pc = 0;
        addr = 0;
        writeData = 32'h00000293;
        we = 1;
        #10
        $display("instr: %h", instr);
        $display("readData: %h", readData);
        
        // caso 2:
        // - tomo la siguiente instruccion
        pc = 4;
        addr = 1;
        writeData = 32'h00000295;
        we = 0;
        #10
        // addr = 0;
        $display("instr: %h", instr);
        $display("readData: %h", readData);
        
        $finish;
    end

endmodule