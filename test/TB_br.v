`include "dataPath/BR.v"

module TB_br;

reg clk, we3;
reg [4:0] ra1, ra2, wa3;
reg [31:0] wd3;
wire [31:0] rd1, rd2;
integer i;

BR uut(
    .clk(clk),
    .we3(we3),
    .ra1(ra1),
    .ra2(ra2),
    .wa3(wa3),
    .wd3(wd3),
    .rd1(rd1),
    .rd2(rd2)
);

// GENERAR RELOJ
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// SENIALES DE ENTRADA
initial begin
    // Inicialización de señales
    we3 = 0;
    ra1 = 0;
    ra2 = 0;
    wa3 = 0;
    wd3 = 0;

    // Cargar valores incrementales en la memoria
    $display("Inicialización de la memoria:");
    for (i = 0; i < 32; i = i + 1) begin
        we3 = 1;
        wa3 = i;
        wd3 = i;
        #10;
        we3 = 0;
        #10;
    end

    // Mostrar todos los registros de memoria
    $display("Registros de Memoria:");
    for (i = 1; i < 32; i = i + 2) begin
        ra1 = i-1;
        ra2 = i;
        #10;
        $display("mem[%0d] = %d", i-1, rd1);
        $display("mem[%0d] = %d", i, rd2);
    end

    // Cambiar un par de registros
    $display("Modificación de registros:");
    we3 = 1;
    wa3 = 5; // Cambia el registro en la posición 5
    wd3 = 42; // Nuevo valor
    #10;
    wa3 = 10; // Cambia el registro en la posición 10
    wd3 = 99; // Nuevo valor
    #10;
    we3 = 0;
    #10;

    // Mostrar todos los registros de memoria después de la modificación
    $display("Registros de Memoria:");
    for (i = 1; i < 32; i = i + 2) begin
        ra1 = i-1;
        ra2 = i;
        #10;
        $display("mem[%0d] = %d", i-1, rd1);
        $display("mem[%0d] = %d", i, rd2);
    end

    // Terminar la simulación
    $finish;
end

endmodule