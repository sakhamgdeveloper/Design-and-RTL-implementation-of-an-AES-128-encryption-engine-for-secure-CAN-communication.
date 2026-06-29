module aes_inv_round(
    input  wire [127:0] state_in,
    input  wire [127:0] round_key,
    output wire [127:0] state_out
);

//--------------------------------------------------
// Intermediate signals
//--------------------------------------------------

wire [127:0] shift_out;
wire [127:0] sub_out;
wire [127:0] ark_out;

//--------------------------------------------------
// InvShiftRows
//--------------------------------------------------

inv_shiftrows u_inv_shiftrows (
    .state_in (state_in),
    .state_out(shift_out)
);

//--------------------------------------------------
// InvSubBytes
//--------------------------------------------------

inv_subbytes u_inv_subbytes (
    .state_in (shift_out),
    .state_out(sub_out)
);

//--------------------------------------------------
// AddRoundKey
//--------------------------------------------------

add_round_key u_add_round_key (
    .state_in (sub_out),
    .key      (round_key),
    .state_out(ark_out)
);

//--------------------------------------------------
// InvMixColumns
//--------------------------------------------------

inv_mixcolumns u_inv_mixcolumns (
    .state_in (ark_out),
    .state_out(state_out)
);

endmodule