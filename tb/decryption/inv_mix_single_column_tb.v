`timescale 1ns/1ps

module inv_mix_single_column_tb;

reg  [31:0] original_col;

wire [31:0] mixed_col;
wire [31:0] recovered_col;

// Encryption block
mix_single_column uut_mix (
    .col_in(original_col),
    .col_out(mixed_col)
);

// Decryption block
inv_mix_single_column uut_inv_mix (
    .col_in(mixed_col),
    .col_out(recovered_col)
);

initial begin

    $display(" MixColumn <-> InvMixColumn Test ");

    original_col = 32'hDB135345;

    #20;

    $display("Original  = %h", original_col);
    $display("Mixed     = %h", mixed_col);
    $display("Recovered = %h", recovered_col);

    if(recovered_col == original_col)
        $display("PASS");
    else
        $display("FAIL");

    #10;
    $finish;

end

endmodule