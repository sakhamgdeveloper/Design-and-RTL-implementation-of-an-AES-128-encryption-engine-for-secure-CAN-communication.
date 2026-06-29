`timescale 1ns/1ps

module rcon_tb;

    reg  [3:0]  round;
    wire [31:0] rcon_out;

    // DUT
    rcon dut (
        .round(round),
        .rcon_out(rcon_out)
    );

    initial begin

        $display("====================================");
        $display("         RCON TEST STARTED");
        $display("====================================");

        round = 4'd1;  #10;
        $display("Round=%0d Rcon=%h Expected=01000000",
                  round, rcon_out);

        round = 4'd2;  #10;
        $display("Round=%0d Rcon=%h Expected=02000000",
                  round, rcon_out);

        round = 4'd3;  #10;
        $display("Round=%0d Rcon=%h Expected=04000000",
                  round, rcon_out);

        round = 4'd4;  #10;
        $display("Round=%0d Rcon=%h Expected=08000000",
                  round, rcon_out);

        round = 4'd5;  #10;
        $display("Round=%0d Rcon=%h Expected=10000000",
                  round, rcon_out);

        round = 4'd6;  #10;
        $display("Round=%0d Rcon=%h Expected=20000000",
                  round, rcon_out);

        round = 4'd7;  #10;
        $display("Round=%0d Rcon=%h Expected=40000000",
                  round, rcon_out);

        round = 4'd8;  #10;
        $display("Round=%0d Rcon=%h Expected=80000000",
                  round, rcon_out);

        round = 4'd9;  #10;
        $display("Round=%0d Rcon=%h Expected=1B000000",
                  round, rcon_out);

        round = 4'd10; #10;
        $display("Round=%0d Rcon=%h Expected=36000000",
                  round, rcon_out);

        round = 4'd0; #10;
        $display("Round=%0d Rcon=%h Expected=00000000",
                  round, rcon_out);

        $display("====================================");
        $display("         RCON TEST FINISHED");
        $display("====================================");

        $finish;
    end

endmodule
