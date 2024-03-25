module updown_counter(
    input wire clk, reset, up_down,
    output reg [3:0] count
);

reg [3:0] next_count;

always @(posedge clk or posedge reset) begin
    if (reset)
        count <= 4'b0000; // Reset to 0
    else
        count <= next_count;
end

always @* begin
    if (up_down)
        next_count = count + 1; // Increment when up_down is high
    else
        next_count = count - 1; // Decrement when up_down is low
end

endmodule
