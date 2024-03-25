module mod_counter (
    input wire clk,
    input wire rst,
    output reg [3:0] mod_out
);

reg [3:0] count;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 4'b0000;
    end else begin
        count <= count + 1;
    end
end

assign mod_out = count;

endmodule
