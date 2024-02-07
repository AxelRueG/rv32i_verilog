`include "./dataPath/Mux2x1.v"

module Mux2x1_tb;
    
    reg [31:0] e1;
    reg [31:0] e2;
    reg sel;
    wire [31:0] sal;


    Mux2x1 uut(
        .e1(e1),
        .e2(e2),
        .sel(sel),
        .sal(sal)
    );

    initial begin
        // seniales de entrada
        e1 = 32'h0000abcd;
        e2 = 32'habcd0000;
        #10
        $display("sal: %h", sal);
        sel = 0;
        #10
        $display("sal: %h", sal);
        sel = 1;
        #10
        $display("sal: %h", sal);
        $finish;
    end
    

endmodule