`timescale 1ns/1ps

module aes_decrypt_top_tb;

    reg clk;
    reg rst;
    reg start;

    reg  [127:0] plaintext;
    reg  [127:0] key;

    wire [127:0] ciphertext;
    wire enc_done;

    wire [127:0] recovered_plaintext;
    wire dec_done;

    // Clock Generation

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Encryption DUT

    aes_en_top_iterative ENC_DUT (
        .clk(clk),
        .rst(rst),
        .start(start),
        .plaintext(plaintext),
        .key(key),
        .ciphertext(ciphertext),
        .done(enc_done)
    );

    // Decryption DUT

    aes_decrypt_top DEC_DUT (
        .clk(clk),
        .rst(rst),
        .start(enc_done),
        .ciphertext(ciphertext),
        .key(key),
        .plaintext(recovered_plaintext),
        .done(dec_done)
    );

    // Test

    initial begin

        rst   = 1'b1;
        start = 1'b0;

        plaintext =
        128'h00112233445566778899AABBCCDDEEFF;

        key =
        128'h000102030405060708090A0B0C0D0E0F;

        #20;
        rst = 1'b0;

        #10;
        start = 1'b1;

        #10;
        start = 1'b0;

        // Wait for decryption to finish

        wait(dec_done);

        #20;

        $display("AES ENCRYPTION + DECRYPTION TEST");

        $display("Original Plaintext  = %h", plaintext);
        $display("Ciphertext          = %h", ciphertext);
        $display("Recovered Plaintext = %h", recovered_plaintext);

        if(recovered_plaintext == plaintext)
            $display("PASS");
        else
            $display("FAIL");

      
        $finish;

    end

endmodule