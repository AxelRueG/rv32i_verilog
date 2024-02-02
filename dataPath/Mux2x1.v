module Mux2x1 (
    input [31:0] e1,
    input [31:0] e2,
    input sel,
    output [31:0] sal
);

assign sal = (sel)? e2:e1;
    
endmodule