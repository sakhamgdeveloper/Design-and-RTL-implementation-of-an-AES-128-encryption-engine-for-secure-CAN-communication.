`timescale 1ns/1ps

module key_expand_word_tb;

    reg  [31:0] word_in;
    reg  [3:0]  round;
    wire [31:0] word_out;

    // DUT
    key_expand_word dut (
        .word_in (word_in),
        .round   (round),
        .word_out(word_out)
    );

    initial begin

        $display("========================================");
        $display("     KEY EXPAND WORD TEST STARTED");
        $display("========================================");

        // AES Standard Example
        word_in = 32'h09CF4F3C;
        round   = 4'd1;
        #10;

        if(word_out == 32'h8B84EB01)
            $display("PASS : Input=%h Round=%0d Output=%h",
                     word_in, round, word_out);
        else
            $display("FAIL : Input=%h Round=%0d Output=%h Expected=8B84EB01",
                     word_in, round, word_out);

        $display("========================================");
        $display("     KEY EXPAND WORD TEST FINISHED");
        $display("========================================");

        $finish;
    end

endmodule