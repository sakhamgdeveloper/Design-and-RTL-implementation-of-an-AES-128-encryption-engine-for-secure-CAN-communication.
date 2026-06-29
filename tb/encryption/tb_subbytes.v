`timescale 1ns/1ps
module tb_subbytes;
    reg  [127:0] state_in;
    wire [127:0] state_out;

    // Instantiate the DUT
    subbytes dut (
        .state_in(state_in),
        .state_out(state_out)
    );

    initial begin
        $display("Starting SubBytes test...");
        // Apply standard test vector
        state_in = 128'h000102030405060708090A0B0C0D0E0F;
        #1;  // wait a time unit for combinational logic to settle
        // Expected output: 63 7C 77 7B F2 6B 6F C5 30 01 67 2B FE D7 AB 76
        if (state_out === 128'h637C777BF26B6FC53001672BFED7AB76) begin
            $display("PASS: SubBytes produced expected output %h", state_out);
        end else begin
            $display("FAIL: got %h (expected 637C777BF26B6FC53001672BFED7AB76)", state_out);
        end
        $finish;
    end
endmodule

