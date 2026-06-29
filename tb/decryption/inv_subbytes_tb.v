`timescale 1ns/1ps

module inv_subbytes_tb;

    reg  [127:0] state_in;
    wire [127:0] state_out;

    inv_subbytes dut (
        .state_in(state_in),
        .state_out(state_out)
    );

    initial begin

        $display("      INV SUBBYTES TEST");

        state_in = 128'h63CAB7040953D051CD60E0E7BA70E18C;
        #10;

        $display("Input  = %h", state_in);
        $display("Output = %h", state_out);

        #10;
        $finish;

    end

endmodule