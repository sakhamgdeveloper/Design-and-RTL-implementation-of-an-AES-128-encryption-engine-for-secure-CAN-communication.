`timescale 1ns/1ps

module tb_mix_columns;

reg  [127:0] state_in;
wire [127:0] state_out;

mix_columns dut (
    .state_in(state_in),
    .state_out(state_out)
);

initial begin

    state_in =
    128'hD4BF5D30D4BF5D30D4BF5D30D4BF5D30;

    #10;

    if(state_out ==
       128'h046681E5046681E5046681E5046681E5)
    begin
        $display("PASS");
    end
    else
    begin
        $display("FAIL");
        $display("Expected = 046681E5046681E5046681E5046681E5");
        $display("Got      = %032h", state_out);
    end

    $finish;

end

endmodule
