module DM(
    input clk, we,
    input [15:0] addres,
    input [31:0] wd,
    output reg [31:0] rd
);

    reg [31:0] RAM [31:0];

    always @(addres or we or wd or posedge clk) begin
        if (we) begin
            RAM[addres] <= wd;
        end
        rd <= RAM[addres];
    end

endmodule