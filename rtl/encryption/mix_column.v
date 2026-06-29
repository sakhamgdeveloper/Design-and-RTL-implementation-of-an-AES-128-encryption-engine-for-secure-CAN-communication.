module mix_columns (
    input  wire [127:0] state_in,
    output wire [127:0] state_out
);

wire [31:0] col0,col1,col2,col3;
wire [31:0] out0,out1,out2,out3;

assign col0 = state_in[127:96];
assign col1 = state_in[95:64];
assign col2 = state_in[63:32];
assign col3 = state_in[31:0];

mix_single_column mc0 (
    .col_in(col0),
    .col_out(out0)
);

mix_single_column mc1 (
    .col_in(col1),
    .col_out(out1)
);

mix_single_column mc2 (
    .col_in(col2),
    .col_out(out2)
);

mix_single_column mc3 (
    .col_in(col3),
    .col_out(out3)
);

assign state_out = {out0,out1,out2,out3};

endmodule