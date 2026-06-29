module mix_single_column (
    input  wire [31:0] col_in,
    output wire [31:0] col_out
);

wire [7:0] a,b,c,d;
wire [7:0] a2,b2,c2,d2;
wire [7:0] a3,b3,c3,d3;
wire [7:0] y0,y1,y2,y3;

assign a = col_in[31:24];
assign b = col_in[23:16];
assign c = col_in[15:8];
assign d = col_in[7:0];

xtime xt0 (.in(a), .out(a2));
xtime xt1 (.in(b), .out(b2));
xtime xt2 (.in(c), .out(c2));
xtime xt3 (.in(d), .out(d2));

assign a3 = a2 ^ a;
assign b3 = b2 ^ b;
assign c3 = c2 ^ c;
assign d3 = d2 ^ d;

assign y0 = a2 ^ b3 ^ c  ^ d;
assign y1 = a  ^ b2 ^ c3 ^ d;
assign y2 = a  ^ b  ^ c2 ^ d3;
assign y3 = a3 ^ b  ^ c  ^ d2;

assign col_out = {y0,y1,y2,y3};

endmodule