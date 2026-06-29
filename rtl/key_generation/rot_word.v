`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 23:19:06
// Design Name: 
// Module Name: rot_word
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


module rot_word (
    input  wire [31:0] word_in,
    output wire [31:0] word_out
);

    // RotWord: [B0 B1 B2 B3] -> [B1 B2 B3 B0]
    assign word_out = {word_in[23:0], word_in[31:24]};

endmodule
