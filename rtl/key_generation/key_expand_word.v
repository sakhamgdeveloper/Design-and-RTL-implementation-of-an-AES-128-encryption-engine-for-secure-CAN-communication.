
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2026 18:57:47
// Design Name: 
// Module Name: key_expand_word
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


module key_expand_word (
    input  wire [31:0] word_in,
    input  wire [3:0]  round,
    output wire [31:0] word_out
);

    wire [31:0] rot_out;
    wire [31:0] sub_out;
    wire [31:0] rcon_out;

    // RotWord
    rot_word u_rot_word (
        .word_in (word_in),
        .word_out(rot_out)
    );

    // SubWord
    sub_word u_sub_word (
        .word_in (rot_out),
        .word_out(sub_out)
    );

    // Rcon
    rcon u_rcon (
        .round    (round),
        .rcon_out (rcon_out)
    );

    // g() = SubWord(RotWord(word)) XOR Rcon
    assign word_out = sub_out ^ rcon_out;

endmodule
