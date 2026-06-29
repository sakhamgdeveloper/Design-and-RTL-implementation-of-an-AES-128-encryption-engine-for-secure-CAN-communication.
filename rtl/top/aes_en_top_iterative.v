module aes_en_top_iterative(
    input              clk,
    input              rst,
    input              start,

    input  [127:0]     plaintext,
    input  [127:0]     key,

    output reg [127:0] ciphertext,
    output reg         done
);

    //====================================================
    // FSM States
    //====================================================

    localparam IDLE  = 3'd0;
    localparam LOAD  = 3'd1;
    localparam ROUND = 3'd2;
    localparam FINAL = 3'd3;
    localparam DONE  = 3'd4;

    reg [2:0] state;

    //====================================================
    // Datapath Registers
    //====================================================

    reg [127:0] state_reg;
    reg [3:0]   round;

    //====================================================
    // Round Keys
    //====================================================

    wire [127:0] k0, k1, k2, k3, k4, k5;
    wire [127:0] k6, k7, k8, k9, k10;

    assign k0 = key;

    key_expansion KE1  (.key_in(k0),  .round(4'd1),  .key_out(k1));
    key_expansion KE2  (.key_in(k1),  .round(4'd2),  .key_out(k2));
    key_expansion KE3  (.key_in(k2),  .round(4'd3),  .key_out(k3));
    key_expansion KE4  (.key_in(k3),  .round(4'd4),  .key_out(k4));
    key_expansion KE5  (.key_in(k4),  .round(4'd5),  .key_out(k5));
    key_expansion KE6  (.key_in(k5),  .round(4'd6),  .key_out(k6));
    key_expansion KE7  (.key_in(k6),  .round(4'd7),  .key_out(k7));
    key_expansion KE8  (.key_in(k7),  .round(4'd8),  .key_out(k8));
    key_expansion KE9  (.key_in(k8),  .round(4'd9),  .key_out(k9));
    key_expansion KE10 (.key_in(k9),  .round(4'd10), .key_out(k10));

    //====================================================
    // Round Key MUX
    //====================================================

    reg [127:0] current_round_key;

    always @(*) begin
        case(round)
            4'd1: current_round_key = k1;
            4'd2: current_round_key = k2;
            4'd3: current_round_key = k3;
            4'd4: current_round_key = k4;
            4'd5: current_round_key = k5;
            4'd6: current_round_key = k6;
            4'd7: current_round_key = k7;
            4'd8: current_round_key = k8;
            4'd9: current_round_key = k9;
            default: current_round_key = 128'd0;
        endcase
    end

    //====================================================
    // AES Round Core
    //====================================================

    wire [127:0] round_out;

    aes_round ROUND_CORE(
        .state_in(state_reg),
        .round_key(current_round_key),
        .state_out(round_out)
    );

    //====================================================
    // Final Round Logic
    //====================================================

    wire [127:0] final_sb;
    wire [127:0] final_sr;
    wire [127:0] final_cipher;

    subbytes FINAL_SB(
        .state_in(state_reg),
        .state_out(final_sb)
    );

    shiftrows FINAL_SR(
        .state_in(final_sb),
        .state_out(final_sr)
    );

    add_round_key FINAL_ARK(
        .state_in(final_sr),
        .key(k10),
        .state_out(final_cipher)
    );

    //====================================================
    // FSM
    //====================================================

    always @(posedge clk) begin

        if(rst) begin

            state      <= IDLE;
            state_reg  <= 128'd0;
            round      <= 4'd0;
            ciphertext <= 128'd0;
            done       <= 1'b0;

        end
        else begin

            case(state)

                //--------------------------------------------------
                IDLE:
                //--------------------------------------------------
                begin
                    done <= 1'b0;

                    if(start)
                        state <= LOAD;
                end

                //--------------------------------------------------
                LOAD:
                //--------------------------------------------------
                begin
                    state_reg <= plaintext ^ k0;
                    round     <= 4'd1;
                    state     <= ROUND;
                end

                //--------------------------------------------------
                ROUND:
                //--------------------------------------------------
                begin

                    state_reg <= round_out;

                    if(round == 4'd9)
                        state <= FINAL;
                    else
                        round <= round + 1'b1;

                end

                //--------------------------------------------------
                FINAL:
                //--------------------------------------------------
                begin
                    ciphertext <= final_cipher;
                    state <= DONE;
                end

                //--------------------------------------------------
                DONE:
                //--------------------------------------------------
                begin
                    done  <= 1'b1;
                    state <= IDLE;
                end

            endcase

        end

    end

endmodule