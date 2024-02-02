module BR (
    input clk,
    input we,
    input [4:0] a1, a2, a3,
    input [31:0] wd3,
    output reg [31:0] rd1, rd2
);

  reg [31:0] mem [0:31];

  // three-ported register file, read two ports combinationally
  // write third port on rising edge of clock
  always @(posedge clk) begin
    if (we) begin
      mem[a3] <= wd3;
    end
  end

  // read ports combinationaly
  always @(a1,a2) begin
    rd1 = (a1 == 5'b00000) ? 32'h00000000 : mem[a1];
    rd2 = (a2 == 5'b00000) ? 32'h00000000 : mem[a2];
  end

endmodule
