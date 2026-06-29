`timescale 1ns/1ps

module inv_sbox_tb;

    reg  [7:0] test_in;
    wire [7:0] sbox_out;
    wire [7:0] recovered_out;

    integer i;
    integer error_count;

    // Encryption S-Box
    sbox u_sbox (
        .sbox_in(test_in),
        .sbox_out(sbox_out)
    );

    // Inverse S-Box
    inv_sbox u_inv_sbox (
        .sbox_in(sbox_out),
        .sbox_out(recovered_out)
    );

    initial begin

        error_count = 0;

        $display("  AES SBOX <-> INV_SBOX VERIFICATION");

        for(i = 0; i < 256; i = i + 1)
        begin
            test_in = i[7:0];
            #10;

            if(recovered_out !== test_in)
            begin
                $display("ERROR : Input=%h  SBOX=%h  INV=%h",
                         test_in, sbox_out, recovered_out);
                error_count = error_count + 1;
            end
        end

        if(error_count == 0)
        begin
            $display("PASS : All 256 values verified");
        end
        else
        begin
            $display("FAIL : %0d errors found", error_count);
        end

        $finish;
    end

endmodule