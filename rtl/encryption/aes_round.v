module aes_round(
    input  [127:0] state_in,
    input  [127:0] round_key,
    output [127:0] state_out
);

    wire [127:0] sb_out;
    wire [127:0] sr_out;
    wire [127:0] mc_out;

    subbytes SB (
        .state_in(state_in),
        .state_out(sb_out)
    );

    shiftrows SR (
        .state_in(sb_out),
        .state_out(sr_out)
    );

    mix_columns MC (
        .state_in(sr_out),
        .state_out(mc_out)
    );

    add_round_key ARK (
        .state_in(mc_out),
        .key(round_key),
        .state_out(state_out)
    );

endmodule