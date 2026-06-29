
`timescale 1ns/1ps

module tb_mix_single_column;

reg  [31:0] col_in;
wire [31:0] col_out;

mix_single_column dut (
    .col_in(col_in),
    .col_out(col_out)
);

initial begin

    col_in = 32'hD4BF5D30;

    #10;

    if(col_out == 32'h046681E5)
        $display("PASS");
    else begin
        $display("FAIL");
        $display("Expected = 046681E5");
        $display("Got      = %h", col_out);
    end

    $finish;

end

endmodule
