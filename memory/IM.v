module IM (
    input clk,
    input [5:0] addres,
    output reg [31:0] rd
);
    // Definición del tipo de la memoria ROM
    reg [31:0] ROM [0:63];
    
    initial begin
        ROM[0]  = 32'h00300413;
        ROM[1]  = 32'h00100493;
        ROM[2]  = 32'h01000913;
        ROM[3]  = 32'h009462b3;
        ROM[4]  = 32'h00947333;
        ROM[5]  = 32'h009403b3;
        ROM[6]  = 32'h40940e33;
        ROM[7]  = 32'h40848eb3;
        ROM[8]  = 32'h00942f33;
        ROM[9]  = 32'h0084afb3;
        ROM[10] = 32'h009ea8b3;
        ROM[11] = 32'h00100293;
        ROM[12] = 32'h00000313;
        ROM[13] = 32'h01228463;
        ROM[14] = 32'h005282b3;
        ROM[15] = 32'h00130313;
        ROM[16] = 32'hffbff06f;
        ROM[17] = 32'h000004b3;
        ROM[18] = 32'h00000293;
        ROM[19] = 32'h00a00313;
        ROM[20] = 32'h00628463;
        ROM[21] = 32'h008484b3;
        ROM[22] = 32'h00128293;
        ROM[23] = 32'hffbff06f;
        ROM[24] = 32'h00802023;
        ROM[25] = 32'h00902223;
        ROM[26] = 32'h01202423;
        ROM[27] = 32'h00002583;
        ROM[28] = 32'h00402603;
        ROM[29] = 32'h00802683;
        // Posiciones no usadas
        ROM[30] = 32'h00000000;
        ROM[31] = 32'h00000000;
        ROM[32] = 32'h00000000;
        ROM[33] = 32'h00000000;
        ROM[34] = 32'h00000000;
        ROM[35] = 32'h00000000;
        ROM[36] = 32'h00000000;
        ROM[37] = 32'h00000000;
        ROM[38] = 32'h00000000;
        ROM[39] = 32'h00000000;
        ROM[40] = 32'h00000000;
        ROM[41] = 32'h00000000;
        ROM[42] = 32'h00000000;
        ROM[43] = 32'h00000000;
        ROM[44] = 32'h00000000;
        ROM[45] = 32'h00000000;
        ROM[46] = 32'h00000000;
        ROM[47] = 32'h00000000;
        ROM[48] = 32'h00000000;
        ROM[49] = 32'h00000000;
        ROM[50] = 32'h00000000;
        ROM[51] = 32'h00000000;
        ROM[52] = 32'h00000000;
        ROM[53] = 32'h00000000;
        ROM[54] = 32'h00000000;
        ROM[55] = 32'h00000000;
        ROM[56] = 32'h00000000;
        ROM[57] = 32'h00000000;
        ROM[58] = 32'h00000000;
        ROM[59] = 32'h00000000;
        ROM[60] = 32'h00000000;
        ROM[61] = 32'h00000000;
        ROM[62] = 32'h00000000;
        ROM[63] = 32'h00000000;
    end

    // Lógica para acceder a la memoria ROM
    always @(posedge clk) begin
        rd <= ROM[addres];
    end

endmodule
