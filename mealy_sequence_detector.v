module mealy_sequence_detector(
    input wire clk, reset, input_bit,
    output reg detected
);

// Parameters
parameter SEQUENCE = 4'b1011;
parameter SEQ_LENGTH = 4;

// Define states
typedef enum logic [1:0] {
    S_IDLE,
    S_DETECT
} states;

// Define signals
reg [1:0] state, next_state;
reg [3:0] shift_register;

// Mealy state transition and output logic
always @(posedge clk or posedge reset) begin
    if (reset)
        state <= S_IDLE;
    else
        state <= next_state;

    case(state)
        S_IDLE: begin
            next_state = (input_bit) ? S_DETECT : S_IDLE;
            shift_register <= {shift_register[SEQ_LENGTH-2:0], input_bit};
            detected = 0;
        end
        S_DETECT: begin
            next_state = (shift_register == SEQUENCE) ? S_IDLE : S_DETECT;
            detected = (shift_register == SEQUENCE);
        end
        default: next_state = S_IDLE;
    endcase
end

endmodule
