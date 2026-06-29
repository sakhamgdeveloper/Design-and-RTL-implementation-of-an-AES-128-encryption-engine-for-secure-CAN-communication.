`timescale 1ns/1ps

module tb_sub_word;

    reg  [31:0] word_in;
    wire [31:0] word_out;

    sub_word dut (
        .word_in(word_in),
        .word_out(word_out)
    );

    initial begin

        $display("\n====================================");
        $display("      SubWord Test Started");
        $display("====================================");

        // Test Case 1
        // CF -> 8A
        // 4F -> 84
        // 3C -> EB
        // 09 -> 01
        word_in = 32'hCF4F3C09;
        #10;

        if(word_out == 32'h8A84EB01)
            $display("PASS : Input=%h Output=%h", word_in, word_out);
        else
            $display("FAIL : Input=%h Output=%h Expected=8A84EB01",
                     word_in, word_out);

        // Test Case 2
        // 00 -> 63
        word_in = 32'h00000000;
        #10;

        if(word_out == 32'h63636363)
            $display("PASS : Input=%h Output=%h", word_in, word_out);
        else
            $display("FAIL : Input=%h Output=%h Expected=63636363",
                     word_in, word_out);

        $display("====================================");
        $display("      SubWord Test Finished");
        $display("====================================");

        $finish;
    end

endmodule
