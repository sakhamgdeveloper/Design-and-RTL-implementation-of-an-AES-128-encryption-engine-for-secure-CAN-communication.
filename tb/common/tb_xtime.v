`timescale 1ns/1ps

module tb_xtime;

reg  [7:0] in;
wire [7:0] out;

xtime dut (
    .in(in),
    .out(out)
);

initial begin

    in = 8'h57;
    #10;
    if(out == 8'hAE)
        $display("PASS");
    else
        $display("FAIL");

    in = 8'hD4;
    #10;
    if(out == 8'hB3)
        $display("PASS");
    else
        $display("FAIL");

    in = 8'hBF;
    #10;
    if(out == 8'h65)
        $display("PASS");
    else
        $display("FAIL");

    $finish;

end

endmodule
