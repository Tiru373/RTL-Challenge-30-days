
//Tree Multiplier: 

module tree_multiplier(input [3:0] A, input [3:0] B, output [7:0] P); 
    wire [7:0] PP [0:3]; 
    wire [15:0] P_intermediate; 
    wire [7:0] P_final; 
 
    // Generate partial products 
    assign PP[0] = {A[0], B} << 0; 
    assign PP[1] = {A[1], B} << 1; 
    assign PP[2] = {A[2], B} << 2; 
    assign PP[3] = {A[3], B} << 3; 
 
    // Intermediate product calculation 
    assign P_intermediate = {PP[0], PP[1], PP[2], PP[3]}; 
 
    // Final product calculation 
    assign P_final = P_intermediate[7:0] + P_intermediate[15:8]; 
 
    // Output 
    assign P = P_final; 
endmodule 

 
