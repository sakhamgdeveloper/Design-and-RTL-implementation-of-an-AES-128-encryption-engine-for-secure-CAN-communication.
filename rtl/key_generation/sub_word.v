`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2026 00:00:38
// Design Name: 
// Module Name: sub_word
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


module sub_word (
    input  wire [31:0] word_in,
    output wire [31:0] word_out
);

    // Input bytes
    wire [7:0] b0, b1, b2, b3;

    // S-Box outputs
    wire [7:0] sb0, sb1, sb2, sb3;

    assign b0 = word_in[31:24];
    assign b1 = word_in[23:16];
    assign b2 = word_in[15:8];
    assign b3 = word_in[7:0];

    // Four parallel S-Boxes
    sbox sbox0 (
        .sbox_in (b0),
        .sbox_out(sb0)
    );

    sbox sbox1 (
        .sbox_in (b1),
        .sbox_out(sb1)
    );

    sbox sbox2 (
        .sbox_in (b2),
        .sbox_out(sb2)
    );

    sbox sbox3 (
        .sbox_in (b3),
        .sbox_out(sb3)
    );

    assign word_out = {sb0, sb1, sb2, sb3};

endmodule
