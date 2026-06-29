`timescale 1ns/1ps

module rot_word_tb;

    reg  [31:0] word_in;
    wire [31:0] word_out;

    // DUT Instantiation
    rot_word dut (
        .word_in(word_in),
        .word_out(word_out)
    );

    initial begin

        $display("====================================");
        $display("       RotWord Test Started");
        $display("====================================");

        // Test Case 1
        word_in = 32'h09CF4F3C;
        #10;
        $display("Input  = %h | Output = %h | Expected = CF4F3C09",
                  word_in, word_out);

        // Test Case 2
        word_in = 32'hAABBCCDD;
        #10;
        $display("Input  = %h | Output = %h | Expected = BBCCDDAA",
                  word_in, word_out);

        // Test Case 3
        word_in = 32'h12345678;
        #10;
        $display("Input  = %h | Output = %h | Expected = 34567812",
                  word_in, word_out);

        // Test Case 4
        word_in = 32'hFFFFFFFF;
        #10;
        $display("Input  = %h | Output = %h | Expected = FFFFFFFF",
                  word_in, word_out);

        // Test Case 5
        word_in = 32'h00000000;
        #10;
        $display("Input  = %h | Output = %h | Expected = 00000000",
                  word_in, word_out);

        $display("====================================");
        $display("       RotWord Test Finished");
        $display("====================================");

        $finish;
    end

endmodule
