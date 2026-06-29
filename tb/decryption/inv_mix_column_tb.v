`timescale 1ns/1ps

module inv_mixcolumns_tb;

reg  [127:0] original_state;

wire [127:0] mixed_state;
wire [127:0] recovered_state;

// Encryption
mix_columns uut_mix (
    .state_in(original_state),
    .state_out(mixed_state)
);

// Decryption
inv_mixcolumns uut_inv_mix (
    .state_in(mixed_state),
    .state_out(recovered_state)
);

initial begin

    $display(" MixColumns <-> InvMixColumns Test ");

    original_state =
    128'h00112233445566778899AABBCCDDEEFF;

    #20;

    $display("Original  = %h", original_state);
    $display("Mixed     = %h", mixed_state);
    $display("Recovered = %h", recovered_state);

    if(recovered_state == original_state)
        $display("PASS");
    else
        $display("FAIL");

    #10;
    $finish;

end

endmodule