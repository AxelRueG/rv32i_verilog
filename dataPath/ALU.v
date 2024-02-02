module ALU (
    input [31:0] srcA,
    input [31:0] srcB,
    input [2:0] ALUControl,
    output reg [31:0] res
);

    always @* begin
        case (ALUControl)
            3'b000: res = srcA + srcB;
            3'b001: res = srcA - srcB;
            3'b010: res = srcA & srcB;
            3'b011: res = srcA | srcB;
            3'b101: res = (srcA < srcB) ? 32'h00000001 : 32'h00000000;
            default: res = 32'h00000000;
        endcase
    end

endmodule
