`include "./dataPath/Adder.v"

module adder_tb;
    
    reg [31:0] op1;
    reg [31:0] op2;
    wire [31:0] sal;

    Adder uut(
        .op1(op1),
        .op2(op2),
        .sal( sal)
    );

    initial begin
        op1 = 10;
        op2 = 1;
        #5
        $display("result: %b", sal);

        op1 = 10;
        op2 = -1;
        #5
        $display("result: %b", sal);
    end

endmodule