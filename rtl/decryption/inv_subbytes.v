module inv_subbytes (
    input  wire [127:0] state_in,
    output wire [127:0] state_out
);

    genvar i;

    generate
        for (i = 0; i < 16; i = i + 1) begin : gen_inv_sboxes

            inv_sbox inv_sb (
                .sbox_in (state_in [127-8*i -: 8]),
                .sbox_out(state_out[127-8*i -: 8])
            );

        end
    endgenerate

endmodule