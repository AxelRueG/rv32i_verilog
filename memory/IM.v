module IM(
    input [15:0] pc,
    output [31:0] instr
);

    parameter ROM_WIDTH = 32;
    parameter ROM_ADDR_BITS = 8;
    (* ROM_STYLE="{AUTO |DISTRIBUTED |BLOCK}" *)
    reg [ROM_WIDTH-1:0] ROM [(2**ROM_ADDR_BITS)-1:0];

    initial begin
        // ROM[0] = 32'h40000593;	//direccion de la uart: 2048=0x800
        // ROM[4] = 32'h40058593;
        // ROM[8] = 32'h0145a803;
        // ROM[12] = 32'hfe080ee3;
        // ROM[16] = 32'h0005a603;
        // ROM[20] = 32'h0045a683;
        // ROM[24] = 32'h00c5a703;
        // ROM[28] = 32'h0105a783;
        // ROM[32] = 32'hfd060613;
        // ROM[36] = 32'hfd068693;
        // ROM[40] = 32'hfd070713;
        // ROM[44] = 32'hfd078793;
        // ROM[48] = 32'h00060293;
        // ROM[52] = 32'h00070313;
        // ROM[56] = 32'h00900393;
        // ROM[60] = 32'h00038a63;
        // ROM[64] = 32'h00560633;
        // ROM[68] = 32'h00670733;
        // ROM[72] = 32'hfff38393;
        // ROM[76] = 32'hff1ff0ef;
        // ROM[80] = 32'h00d60633;
        // ROM[84] = 32'h00f70733;
        // ROM[88] = 32'h00c002b3;
        // ROM[92] = 32'hfff70713;
        // ROM[96] = 32'h00070863;
        // ROM[100] = 32'h00560633;
        // ROM[104] = 32'hfff70713;
        // ROM[108] = 32'hff5ff0ef;
        // ROM[112] = 32'h00a00393;
        // ROM[116] = 32'h00060ab3;
        // ROM[120] = 32'h00000b13;
        // ROM[124] = 32'h007ac863;
        // ROM[128] = 32'h407a8ab3;
        // ROM[132] = 32'h001b0b13;
        // ROM[136] = 32'hff5ff0ef;
        // ROM[140] = 32'h00000b93;
        // ROM[144] = 32'h007b4863;
        // ROM[148] = 32'h407b0b33;
        // ROM[152] = 32'h001b8b93;
        // ROM[156] = 32'hff5ff0ef;
        // ROM[160] = 32'h00000c13;
        // ROM[164] = 32'h007bc863;
        // ROM[168] = 32'h407b8bb3;
        // ROM[172] = 32'h001c0c13;
        // ROM[176] = 32'hff5ff0ef;

        // ROM[180] = 32'h0385a223;
        // ROM[184] = 32'h0375a023;
        // ROM[188] = 32'h0165ae23;
        // ROM[192] = 32'h0155ac23;

        // ROM[196] = 32'hf45ff0ef;

        ROM[0] = 32'h00300413;      // addi a0,zero,3
        ROM[4] = 32'h00100493;      // addi a1,zero,1
        ROM[8] = 32'h01000913;      // addi a2,zero,16
        ROM[12] = 32'h009462b3;     // or  t0, s0, s1   -> 3 || 1 = 3
        ROM[16] = 32'h00947333;     // and t1, s0, s1   -> 3 && 1 = 1
        ROM[20] = 32'h009403b3;     // odd t2, s0, s1   -> 3 +  1 = 4
        ROM[24] = 32'h40940e33;     // sub t3, s0, s1   -> 3 -  1 = 2
        ROM[28] = 32'h40848eb3;     // sub t4, s1, s0   -> 1 -  3 = -2
        ROM[32] = 32'h00942f33;     // slt t5, s0, s1   -> 3 <  1 = 0
        ROM[36] = 32'h0084afb3;     // slt t6, s1, s0   -> 1 <  3 = 1
        ROM[40] = 32'h01d4afb3;     // slt t6, s1, t4   -> 1 < -2 = 0
        ROM[44] = 32'h00100293;
        ROM[48] = 32'h00000313;
        ROM[52] = 32'h01228863;
        ROM[56] = 32'h005282b3;
        ROM[60] = 32'h00130313;
        ROM[64] = 32'hff5ff06f;
        ROM[68] = 32'h000004b3;
        ROM[72] = 32'h00000293;
        ROM[76] = 32'h00a00313;
        ROM[80] = 32'h00628863;
        ROM[84] = 32'h008484b3;
        ROM[88] = 32'h00128293;
        ROM[92] = 32'hff5ff06f;
        ROM[96] = 32'h00802023;
        ROM[100] = 32'h00902223;
        ROM[104] = 32'h01202423;
        ROM[108] = 32'h00002283;
        ROM[112] = 32'h00402303;
        ROM[116] = 32'h00802383;


    end

    assign instr = ROM[pc];

endmodule