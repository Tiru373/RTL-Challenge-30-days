module ring_counter (
    input wire clk,
    input wire rst,
    output reg [3:0] ring_out
);

reg [3:0] count;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 4'b0001;
    end else begin
        count <= (count == 4'b1000) ? 4'b0001 : (count << 1);
    end
end

assign ring_out = count;

endmodule
