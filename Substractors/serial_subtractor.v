module serial_subtractor (
    input clk,
    input rst,
    input [3:0] A,
    input [3:0] B,
    output reg [3:0] Diff
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            Diff <= 4'b0000;
        else
            Diff <= A - B; // Corrected subtraction operation
    end

endmodule
