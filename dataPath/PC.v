module PC (
    input wire clk,
    input wire [15:0] pcNext,
    output wire [15:0] pc
);

    reg [15:0] s_pc;

    initial begin
        s_pc = 0;
    end

    always @(posedge clk) begin
        s_pc <= pcNext;
    end

    assign pc = s_pc;

endmodule