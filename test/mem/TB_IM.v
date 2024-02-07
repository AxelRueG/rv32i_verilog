`include "./memory/IM.v"

module TB_IM;
    
    reg clk;
    reg [5:0] addres;
    wire [31:0] rd;
    integer i;

    IM uut(
        .clk(clk),
        .addres(addres),
        .rd(rd)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        
        for (i = 0; i < 54 ; i = i+1 ) begin
            addres = i;
            #10
            $display("[addres: %b] = %h", addres, rd);
        end

        $finish;
    end

endmodule