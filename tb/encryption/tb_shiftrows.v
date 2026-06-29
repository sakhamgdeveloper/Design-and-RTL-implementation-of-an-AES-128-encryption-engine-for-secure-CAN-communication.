`timescale 1ns / 1ps

module tb_shiftrows;

reg  [127:0] state_in;
wire [127:0] state_out;

shiftrows DUT (
    .state_in(state_in),
    .state_out(state_out)
);

initial begin

    // Test Vector
    state_in = 128'h000102030405060708090A0B0C0D0E0F;

    #10;

    $display("Input  = %h", state_in);
    $display("Output = %h", state_out);

    // Expected Output
    $display("Expected = 00050A0F04090E03080D02070C01060B");

    if(state_out == 128'h00050A0F04090E03080D02070C01060B)
        $display("TEST PASSED");
    else
        $display("TEST FAILED");

    #10;
    $finish;

end

endmodule