`include "memory/DM.v"

module TB_DM;
    
    reg clk, we;
    reg [4:0] addres;
    reg [31:0] wd;
    wire [31:0] rd;

    integer i;

    DM uut(
        .clk(clk),
        .we(we),
        .addres(addres),
        .wd(wd),
        .rd(rd)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;   
    end

    initial begin

        // cambiamos un valor de memoria
        we = 1;
        addres = 10;
        wd = 32'h00000019;
        #10
        $display("\n>> [10]: %h ", rd);
        addres = 15;
        wd = 32'h00000021;
        #10
        $display("\n>> [15]: %h \n", rd);
        we = 0;
        #10

        // valores finales
        for (i = 0; i<32; i = i+1) begin
            addres = i;
            #10
            $display("[%b] = %h", addres, rd);
        end

        $finish;
    end

endmodule