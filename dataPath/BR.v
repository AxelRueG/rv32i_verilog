module BR(
    input wire clk,
    input [4:0] a1,
    input [4:0] a2,
    input [4:0] a3,
    input [31:0] wd3,
    input wire we,
    output [31:0] rd1,
    output [31:0] rd2
);

  reg [31:0] regBank[31:0];
  integer i;

  initial begin
      for(i = 0;i<32;i=i+1) begin
          regBank[i] <= 32'h00000000;
      end
  end

  always @(posedge clk)
  begin
      if(we)
      begin
          regBank[a3] <= wd3;
          //que escriba
      end
      //bla
  end
  assign rd1 = regBank[a1];
  assign rd2 = regBank[a2];

endmodule
