module full_adder (
    input A, B, Cin,
    output Sum, Cout
);

wire Sum1, Cout1, Cout2;

// First half adder
half_adder ha1(
    .A(A),
    .B(B),
    .Sum(Sum1),
    .Cout(Cout1)
);

// Second half adder
half_adder ha2(
    .A(Sum1),
    .B(Cin),
    .Sum(Sum),
    .Cout(Cout2)
);

// OR gate to combine carry outputs
assign Cout = Cout1 | Cout2;

endmodule

module half_adder (
    input A, B,
    output Sum, Cout
);

assign Sum = A ^ B; // XOR gate for sum
assign Cout = A & B; // AND gate for carry

endmodule
