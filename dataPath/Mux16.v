module Mux16 (
    input [15:0] e1,
    input [15:0] e2,
    input sel,
    output [15:6] sal
);

assign sal = (sel)? e2:e1;

endmodule