`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2026 23:35:47
// Design Name: 
// Module Name: add_round_key
// Project Name: RTL implementation of AES encryptor and decryptor engine
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


module add_round_key( input [127:0] state_in,
 input [127:0] key,
 output [127:0] state_out);
 
 assign state_out = state_in ^ key;
endmodule
