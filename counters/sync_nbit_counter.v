module sync_nbit_counter(
    input wire clk, reset,
    output reg [N-1:0] count
);

parameter N = 4; // Define the number of bits

always @(posedge clk or posedge reset) begin
    if (reset)
        count <= {N{1'b0}}; // Reset to 0
    else
        count <= count + 1; // Increment on each clock cycle
end

endmodule
