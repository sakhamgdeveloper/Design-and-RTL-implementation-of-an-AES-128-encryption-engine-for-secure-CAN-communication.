`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 14:15:15
// Design Name: 
// Module Name: xtime
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


module xtime (
    input  wire [7:0] in,
    output wire [7:0] out
);

assign out = in[7] ?
             ((in << 1) ^ 8'h1B) :
             (in << 1);

endmodule