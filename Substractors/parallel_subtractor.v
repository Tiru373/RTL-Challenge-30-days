module parallel_subtractor(
    input [3:0] A, B,
    output [3:0] Difference
);

assign Difference = A - B;

endmodule
