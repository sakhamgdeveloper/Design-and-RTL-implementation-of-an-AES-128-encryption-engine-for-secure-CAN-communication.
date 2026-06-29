`timescale 1ns/1ps

module key_expansion_tb;

    reg  [127:0] key_in;
    reg  [3:0]   round;
    wire [127:0] key_out;

    key_expansion dut (
        .key_in (key_in),
        .round  (round),
        .key_out(key_out)
    );

    initial begin

        $display("==========================================");
        $display("      KEY EXPANSION TEST STARTED");
        $display("==========================================");

        // AES-128 Standard Test Vector
        key_in = 128'h2B7E151628AED2A6ABF7158809CF4F3C;
        round  = 4'd1;

        #20;

        if(key_out ==
           128'hA0FAFE1788542CB123A339392A6C7605)
        begin
            $display("PASS");
            $display("Generated Key = %h", key_out);
        end
        else
        begin
            $display("FAIL");
            $display("Generated Key = %h", key_out);
            $display("Expected Key  = A0FAFE1788542CB123A339392A6C7605");
        end

        $display("==========================================");
        $display("      KEY EXPANSION TEST FINISHED");
        $display("==========================================");

        $finish;
    end

endmodule
