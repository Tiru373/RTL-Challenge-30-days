//Modified Booth Multiplier: 

module modified_booth_multiplier(input [3:0] A, input [3:0] B, output [7:0] P); 
    reg [3:0] B_ext; 
    wire [3:0] A_booth [0:3]; 
    wire [7:0] P_temp; 
    wire [7:0] P_final; 
 
    // Sign extension of B 
    assign B_ext = {B[3], B, 3'b0}; 
 
    // Generate Booth encoded partial products 
    assign A_booth[0] = A; 
    assign A_booth[1] = {A[3], A}; 
    assign A_booth[2] = {2'b0, A}; 
    assign A_booth[3] = {2'b0, A[3], A}; 
 
    // Booth multiplier 
    assign P_temp = A_booth[0] * B_ext + A_booth[1] * {~B[3], B_ext} + A_booth[2] * {B[3], B_ext} + A_booth[3] * {~B[3], ~B_ext}; 
 
    // Result alignment 
    assign P_final = {P_temp[6:0], P_temp[7]}; 
 
    // Output 
    assign P = P_final; 
endmodule 
