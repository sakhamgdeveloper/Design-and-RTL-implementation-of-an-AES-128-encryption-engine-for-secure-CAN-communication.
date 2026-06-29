module aes_iterative_top_tb;

    reg clk;
    reg rst;
    reg start;

    reg  [127:0] plaintext;
    reg  [127:0] key;

    wire [127:0] ciphertext;
    wire done;

    aes_en_top_iterative DUT (
        .clk(clk),
        .rst(rst),
        .start(start),
        .plaintext(plaintext),
        .key(key),
        .ciphertext(ciphertext),
        .done(done)
    );

    // Clock

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus

    initial begin

        rst = 1;
        start = 0;

        plaintext = 128'h00112233445566778899AABBCCDDEEFF;
        key       = 128'h000102030405060708090A0B0C0D0E0F;

        #20;
        rst = 0;

        #10;
        start = 1;

        #10;
        start = 0;

        wait(done);

        $display("Ciphertext = %h", ciphertext);
        $display("Expected   = 69C4E0D86A7B0430D8CDB78070B4C55A");

        if(ciphertext == 128'h69C4E0D86A7B0430D8CDB78070B4C55A)
            $display("AES TEST PASSED");
        else
            $display("AES TEST FAILED");

        #20;
        $finish;

    end

endmodule