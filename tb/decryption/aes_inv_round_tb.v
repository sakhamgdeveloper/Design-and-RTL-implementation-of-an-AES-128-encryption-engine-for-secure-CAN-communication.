`timescale 1ns/1ps

module aes_inv_round_tb;

reg  [127:0] state_in;
reg  [127:0] round_key;

wire [127:0] enc_round_out;
wire [127:0] recovered_state;

// Encryption Round
aes_round uut_round (
    .state_in(state_in),
    .round_key(round_key),
    .state_out(enc_round_out)
);

// Decryption Round
aes_inv_round uut_inv_round (
    .state_in(enc_round_out),
    .round_key(round_key),
    .state_out(recovered_state)
);

initial begin

    $display("      AES ROUND / INV ROUND TEST");

    // Test Vector 1

    state_in  = 128'h00112233445566778899AABBCCDDEEFF;
    round_key = 128'h000102030405060708090A0B0C0D0E0F;

    #20;

    $display("Original  = %h", state_in);
    $display("Encrypted = %h", enc_round_out);
    $display("Recovered = %h", recovered_state);

    if(recovered_state == state_in)
        $display("TEST1 PASS");
    else
        $display("TEST1 FAIL");

    // Test Vector 2

    state_in  = 128'h0123456789ABCDEFFEDCBA9876543210;
    round_key = 128'h2B7E151628AED2A6ABF7158809CF4F3C;

    #20;

    if(recovered_state == state_in)
        $display("TEST2 PASS");
    else
        $display("TEST2 FAIL");

    // Test Vector 3

    state_in  = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    round_key = 128'h00000000000000000000000000000000;

    #20;

    if(recovered_state == state_in)
        $display("TEST3 PASS");
    else
        $display("TEST3 FAIL");

    // Test Vector 4

    state_in  = 128'h00000000000000000000000000000000;
    round_key = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;

    #20;

    if(recovered_state == state_in)
        $display("TEST4 PASS");
    else
        $display("TEST4 FAIL");

    $finish;

end

endmodule