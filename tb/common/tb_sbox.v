`timescale 1ns / 1ps

module tb_sbox;

reg  [7:0] in;
wire [7:0] out;

sbox DUT (
    .sbox_in(in),
    
    .sbox_out(out)
);

initial begin

    in = 8'h00;
    #10;
    if(out == 8'h63)
        $display("PASS : 00 -> 63");
    else
        $display("FAIL : 00 -> %h", out);

    in = 8'h53;
    #10;
    if(out == 8'hED)
        $display("PASS : 53 -> ED");
    else
        $display("FAIL : 53 -> %h", out);

    in = 8'hFF;
    #10;
    if(out == 8'h16)
        $display("PASS : FF -> 16");
    else
        $display("FAIL : FF -> %h", out);

    $finish;

end

endmodule
