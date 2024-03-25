module LFSR (
    input wire clk,     // Clock input
    input wire reset,   // Reset input
    output reg [N-1:0] lfsr_out // LFSR output
);

parameter N = 4; // Number of bits in the LFSR

reg [N-1:0] lfsr_reg; // Register to hold LFSR state

// LFSR update process
always @(posedge clk or posedge reset) begin
    if (reset) // Reset condition
        lfsr_reg <= {1'b1, (N-1){1'b0}}; // Initial seed value
    else
        lfsr_reg <= {lfsr_reg[N-2:0], lfsr_reg[N-1] ^ lfsr_reg[N-2]}; // Feedback function
end

assign lfsr_out = lfsr_reg; // Output is the current LFSR state

endmodule
