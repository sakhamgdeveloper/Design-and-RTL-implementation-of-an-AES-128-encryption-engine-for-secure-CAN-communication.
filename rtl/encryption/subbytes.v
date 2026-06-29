`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2026 23:32:13
// Design Name: 
// Module Name: subbytes
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


// subbytes.v: 16-byte SubBytes using 16 S-Box instances
module subbytes (
    input  wire [127:0] state_in, 
    output wire [127:0] state_out
);
    genvar i;
    generate
        for (i = 0; i < 16; i = i+1) begin : gen_sboxes
            // Extract byte i (bits [127-8*i : 120-8*i])
            // Note: state_in[127:120] is byte 0, then [119:112] is byte1, etc.
            sbox sb (
                .sbox_in(state_in[127-8*i -: 8]),
                .sbox_out(state_out[127-8*i -: 8])
            );
        end
    endgenerate
endmodule

