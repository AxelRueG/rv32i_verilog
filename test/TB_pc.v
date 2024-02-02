`include "dataPath/PC.v"

module TB_pc;

reg clk, reset;
reg [15:0] pcNext;
wire [15:0] pc;

PC uut(
    .clk(clk),
    .reset(reset),
    .pcNext(pcNext),
    .pc(pc)
);

// GENERACION DE RELOJ
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// SENIALES DE ENTRADA
initial begin
    $display("comenzando test");

    reset = 1;
    #20
    reset = 0;
    pcNext = 16'b0000000000000001;
    $display("pcNext: %b\npc: %b\n", pcNext, pc);

    #20
    pcNext = 16'b0000000000000011;
    $display("pcNext: %b\npc: %b\n", pcNext, pc);

    #20
    $display("pcNext: %b\npc: %b\n", pcNext, pc);
    reset = 1;
    
    #20
    $display("pcNext: %b\npc: %b\n", pcNext, pc);
    $display("terminando test");
    $finish;
end

endmodule