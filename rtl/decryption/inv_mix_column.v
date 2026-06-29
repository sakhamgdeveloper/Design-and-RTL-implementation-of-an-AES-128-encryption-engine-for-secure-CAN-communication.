module inv_mixcolumns (
    input  wire [127:0] state_in,
    output wire [127:0] state_out
);

//--------------------------------------------------
// Split state into 4 columns
//--------------------------------------------------

wire [31:0] col0_in;
wire [31:0] col1_in;
wire [31:0] col2_in;
wire [31:0] col3_in;

assign col0_in = state_in[127:96];
assign col1_in = state_in[95:64];
assign col2_in = state_in[63:32];
assign col3_in = state_in[31:0];

//--------------------------------------------------
// Output columns
//--------------------------------------------------

wire [31:0] col0_out;
wire [31:0] col1_out;
wire [31:0] col2_out;
wire [31:0] col3_out;

//--------------------------------------------------
// 4 × InvMixSingleColumn
//--------------------------------------------------

inv_mix_single_column imc0 (
    .col_in(col0_in),
    .col_out(col0_out)
);

inv_mix_single_column imc1 (
    .col_in(col1_in),
    .col_out(col1_out)
);

inv_mix_single_column imc2 (
    .col_in(col2_in),
    .col_out(col2_out)
);

inv_mix_single_column imc3 (
    .col_in(col3_in),
    .col_out(col3_out)
);

//--------------------------------------------------
// Reassemble state
//--------------------------------------------------

assign state_out = {
    col0_out,
    col1_out,
    col2_out,
    col3_out
};

endmodule