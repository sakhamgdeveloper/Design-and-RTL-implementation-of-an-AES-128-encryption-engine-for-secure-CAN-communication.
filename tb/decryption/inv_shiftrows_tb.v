`timescale 1ns/1ps

module inv_shiftrows_tb;

reg  [127:0] original_state;

wire [127:0] shifted_state;
wire [127:0] recovered_state;

shiftrows u_shiftrows (
    .state_in(original_state),
    .state_out(shifted_state)
);

inv_shiftrows u_inv_shiftrows (
    .state_in(shifted_state),
    .state_out(recovered_state)
);

initial begin

    original_state = 128'h00112233445566778899AABBCCDDEEFF;

    #10;

    $display("Original  = %h", original_state);
    $display("Shifted   = %h", shifted_state);
    $display("Recovered = %h", recovered_state);

    if(recovered_state == original_state)
        $display("PASS");
    else
        $display("FAIL");

    $finish;
end

endmodule