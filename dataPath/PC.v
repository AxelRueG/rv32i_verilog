module PC (
    input wire clk, reset,
    input wire [15:0] pcNext,
    output reg [15:0] pc
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        pc <=16'b0;
    end else if (clk) begin
        pc <= pcNext;
    end
end

endmodule