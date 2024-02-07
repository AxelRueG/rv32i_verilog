`include "./controlUnit/aluDeco.v"
`timescale 100ns/10ns

module aludeco_tb ();
    
    reg op;
    reg f7;
    reg [2:0] f3;
    reg [1:0] aluOp;
    wire [2:0] aluControl;

    aluDeco uut(
        .op(op),
        .f7(f7),
        .f3(f3),
        .aluOp(aluOp),
        .aluControl(aluControl)
    );

    initial begin
        
        // caso de test
        $dumpfile("./waves/aludeco.vcd");
        $dumpvars(0, aludeco_tb);

        op = 1'b0; 
        f7 = 1'b0;
        f3 = 3'b000;
        aluOp = 2'b10;
        #5
        $display("f7 && op: %b",f7 && op);
        $display("aluControl: %b",aluControl);

    end

endmodule