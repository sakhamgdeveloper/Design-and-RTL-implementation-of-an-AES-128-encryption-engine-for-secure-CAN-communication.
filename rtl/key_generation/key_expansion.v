
module key_expansion (
    input  wire [127:0] key_in,
    input  wire [3:0]   round,
    output wire [127:0] key_out
);

    // Current key words
    wire [31:0] w0, w1, w2, w3;

    // Next key words
    wire [31:0] w4, w5, w6, w7;

    wire [31:0] g_out;

    assign w0 = key_in[127:96];
    assign w1 = key_in[95:64];
    assign w2 = key_in[63:32];
    assign w3 = key_in[31:0];

    // g(w3)
    key_expand_word u_g (
        .word_in (w3),
        .round   (round),
        .word_out(g_out)
    );

    // AES-128 key schedule
    assign w4 = w0 ^ g_out;
    assign w5 = w1 ^ w4;
    assign w6 = w2 ^ w5;
    assign w7 = w3 ^ w6;

    assign key_out = {w4, w5, w6, w7};

endmodule
