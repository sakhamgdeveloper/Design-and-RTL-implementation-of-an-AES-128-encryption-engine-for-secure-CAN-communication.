`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2026 00:08:48
// Design Name: 
// Module Name: tb_add_roundkey
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

module tb_add_round_key;

reg  [127:0] state;
reg  [127:0] round_key;
wire [127:0] out;

// Instantiate DUT
add_round_key DUT (
    .state_in(state),
    .key(round_key),
    .state_out(out)
);

initial begin

    // Test Vector 1
    state     = 128'h00112233445566778899AABBCCDDEEFF;
    round_key = 128'h000102030405060708090A0B0C0D0E0F;

    #10;

    $display("State     = %h", state);
    $display("Round Key = %h", round_key);
    $display("Output    = %h", out);

    #10;

    $finish;

end

endmodule
