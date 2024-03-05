module four_bit_comparator(
    input [3:0] A,
    input [3:0] B,
    output equal,
    output A_greater_than_B,
    output B_greater_than_A
);


// Define signals for the two pairs of 2-bit inputs
wire [1:0] A_upper, A_lower, B_upper, B_lower;
assign A_upper = A[3:2];
assign A_lower = A[1:0];
assign B_upper = B[3:2];
assign B_lower = B[1:0];

// Instantiate two-bit comparator modules for upper and lower bits
two_bit_comparator comparator_upper(
    .A(A_upper),
    .B(B_upper),
    .equal(equal_upper),
    .A_greater_than_B(A_greater_than_B_upper),
    .B_greater_than_A(B_greater_than_A_upper)
);
two_bit_comparator comparator_lower(
    .A(A_lower),
    .B(B_lower),
    .equal(equal_lower),
    .A_greater_than_B(A_greater_than_B_lower),
    .B_greater_than_A(B_greater_than_A_lower)
);

// Combine results from the two-bit comparators to get 4-bit comparison results
assign equal = (equal_upper & equal_lower);
assign A_greater_than_B = (A_greater_than_B_upper | (equal_upper & A_greater_than_B_lower));
assign B_greater_than_A = (B_greater_than_A_upper | (equal_upper & B_greater_than_A_lower));

endmodule

// Define a two-bit comparator module
module two_bit_comparator(
    input [1:0] A,
    input [1:0] B,
    output equal,
    output A_greater_than_B,
    output B_greater_than_A
);

assign equal = (A == B);
assign A_greater_than_B = (A > B);
assign B_greater_than_A = (A < B);

endmodule
