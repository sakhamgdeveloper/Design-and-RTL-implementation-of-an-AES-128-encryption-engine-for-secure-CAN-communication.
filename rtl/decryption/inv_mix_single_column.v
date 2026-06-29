module inv_mix_single_column (
    input  wire [31:0] col_in,
    output wire [31:0] col_out
);

//--------------------------------------------------
// Input bytes
//--------------------------------------------------

wire [7:0] a,b,c,d;

assign a = col_in[31:24];
assign b = col_in[23:16];
assign c = col_in[15:8];
assign d = col_in[7:0];

//--------------------------------------------------
// a -> 2a,4a,8a
//--------------------------------------------------

wire [7:0] a2,a4,a8;

xtime xt_a2 (.in(a),  .out(a2));
xtime xt_a4 (.in(a2), .out(a4));
xtime xt_a8 (.in(a4), .out(a8));

//--------------------------------------------------
// b -> 2b,4b,8b
//--------------------------------------------------

wire [7:0] b2,b4,b8;

xtime xt_b2 (.in(b),  .out(b2));
xtime xt_b4 (.in(b2), .out(b4));
xtime xt_b8 (.in(b4), .out(b8));

//--------------------------------------------------
// c -> 2c,4c,8c
//--------------------------------------------------

wire [7:0] c2,c4,c8;

xtime xt_c2 (.in(c),  .out(c2));
xtime xt_c4 (.in(c2), .out(c4));
xtime xt_c8 (.in(c4), .out(c8));

//--------------------------------------------------
// d -> 2d,4d,8d
//--------------------------------------------------

wire [7:0] d2,d4,d8;

xtime xt_d2 (.in(d),  .out(d2));
xtime xt_d4 (.in(d2), .out(d4));
xtime xt_d8 (.in(d4), .out(d8));

//--------------------------------------------------
// Multiply by 9,11,13,14
//--------------------------------------------------

// a
wire [7:0] a9, a11, a13, a14;

assign a9  = a8 ^ a;
assign a11 = a8 ^ a2 ^ a;
assign a13 = a8 ^ a4 ^ a;
assign a14 = a8 ^ a4 ^ a2;

// b
wire [7:0] b9, b11, b13, b14;

assign b9  = b8 ^ b;
assign b11 = b8 ^ b2 ^ b;
assign b13 = b8 ^ b4 ^ b;
assign b14 = b8 ^ b4 ^ b2;

// c
wire [7:0] c9, c11, c13, c14;

assign c9  = c8 ^ c;
assign c11 = c8 ^ c2 ^ c;
assign c13 = c8 ^ c4 ^ c;
assign c14 = c8 ^ c4 ^ c2;

// d
wire [7:0] d9, d11, d13, d14;

assign d9  = d8 ^ d;
assign d11 = d8 ^ d2 ^ d;
assign d13 = d8 ^ d4 ^ d;
assign d14 = d8 ^ d4 ^ d2;

//--------------------------------------------------
// Inverse MixColumns Equations
//--------------------------------------------------

wire [7:0] y0,y1,y2,y3;

assign y0 = a14 ^ b11 ^ c13 ^ d9;
assign y1 = a9  ^ b14 ^ c11 ^ d13;
assign y2 = a13 ^ b9  ^ c14 ^ d11;
assign y3 = a11 ^ b13 ^ c9  ^ d14;

//--------------------------------------------------

assign col_out = {y0,y1,y2,y3};

endmodule