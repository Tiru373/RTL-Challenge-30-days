module d_ff_fsm(
    input D, CLK,
    output reg Q
);

// Define states
typedef enum logic [1:0] {
    S_IDLE,
    S_SAMPLE,
    S_HOLD
} states;

// Define signals
reg [1:0] state, next_state;

// FSM logic
always @(posedge CLK) begin
    state <= next_state;
end

always @* begin
    case(state)
        S_IDLE: begin
            next_state = (CLK) ? S_SAMPLE : S_IDLE;
        end
        S_SAMPLE: begin
            next_state = (CLK) ? S_HOLD : S_SAMPLE;
        end
        S_HOLD: begin
            next_state = (CLK) ? S_IDLE : S_HOLD;
            Q <= D;
        end
        default: next_state = S_IDLE;
    endcase
end

endmodule

module jk_ff_fsm(
    input J, K, CLK,
    output reg Q
);

// Define states
typedef enum logic [1:0] {
    S_IDLE,
    S_SAMPLE,
    S_HOLD
} states;

// Define signals
reg [1:0] state, next_state;
reg Q_next;

// FSM logic
always @(posedge CLK) begin
    state <= next_state;
    if (state == S_HOLD)
        Q <= Q_next;
end

always @* begin
    case(state)
        S_IDLE: begin
            next_state = (CLK) ? S_SAMPLE : S_IDLE;
        end
        S_SAMPLE: begin
            next_state = (CLK) ? S_HOLD : S_SAMPLE;
            if (J && K)
                Q_next = !Q; // Toggle Q if both J and K are asserted
            else if (J)
                Q_next = 1'b1;
            else if (K)
                Q_next = 1'b0;
            else
                Q_next = Q;
        end
        S_HOLD: begin
            next_state = (CLK) ? S_IDLE : S_HOLD;
        end
        default: next_state = S_IDLE;
    endcase
end

endmodule

module t_ff_fsm(
    input T, CLK,
    output reg Q
);

// Define states
typedef enum logic [1:0] {
    S_IDLE,
    S_SAMPLE,
    S_HOLD
} states;

// Define signals
reg [1:0] state, next_state;

// FSM logic
always @(posedge CLK) begin
    state <= next_state;
end

always @* begin
    case(state)
        S_IDLE: begin
            next_state = (CLK) ? S_SAMPLE : S_IDLE;
        end
        S_SAMPLE: begin
            next_state = (CLK) ? S_HOLD : S_SAMPLE;
            if (T)
                Q <= ~Q;
        end
        S_HOLD: begin
            next_state = (CLK) ? S_IDLE : S_HOLD;
        end
        default: next_state = S_IDLE;
    endcase
end

endmodule
module sr_latch_fsm(
    input S, R, CLK,
    output reg Q, Q_bar
);

// Define states
typedef enum logic [1:0] {
    S_IDLE,
    S_SAMPLE,
    S_HOLD
} states;

// Define signals
reg [1:0] state, next_state;

// FSM logic
always @(posedge CLK) begin
    state <= next_state;
end

always @* begin
    case(state)
        S_IDLE: begin
            next_state = (CLK) ? S_SAMPLE : S_IDLE;
        end
        S_SAMPLE: begin
            next_state = (CLK) ? S_HOLD : S_SAMPLE;
            if (S && !R) begin
                Q <= 1;
                Q_bar <= 0;
            end
            else if (!S && R) begin
                Q <= 0;
                Q_bar <= 1;
            end
        end
        S_HOLD: begin
            next_state = (CLK) ? S_IDLE : S_HOLD;
        end
        default: next_state = S_IDLE;
    endcase
end

endmodule
