// Verilog code for Carry Look-Ahead Adder (4-bit): 

module carry_lookahead_adder( 
    input [3:0] A, 
    input [3:0] B, 
    output [3:0] Sum, 
    output Cout 
); 
 
// Generate and propagate signals 
wire [3:0] G, P; 
assign G = A & B; 
assign P = A ^ B; 
// Carry look-ahead logic 
wire [3:0] c; 
assign c[0] = P[0]; 
assign c[1] = G[0] | (P[0] & P[1]); 
assign c[2] = G[1] | (P[0] & G[1]) | (P[1] & P[2]); 
assign c[3] = G[2] | (P[0] & G[2]) | (P[1] & G[2]) | (P[2] & P[3]); 
 
// Full adder instances for each bit 
full_adder fa0(.A(A[0]), .B(B[0]), .Cin(1'b0), .S(Sum[0]), .Cout(c[0])); 
full_adder fa1(.A(A[1]), .B(B[1]), .Cin(c[0]), .S(Sum[1]), .Cout(c[1])); 
full_adder fa2(.A(A[2]), .B(B[2]), .Cin(c[1]), .S(Sum[2]), .Cout(c[2])); 
full_adder fa3(.A(A[3]), .B(B[3]), .Cin(c[2]), .S(Sum[3]), .Cout(Cout)); 
endmodule
