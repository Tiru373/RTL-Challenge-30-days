//Dadda Multiplier: 

module dadda_multiplier(input [3:0] A, input [3:0] B, output [7:0] P); 
    wire [7:0] PP [0:2]; 
    wire [6:0] PP_sum [0:1]; 
    wire [7:0] PP_final; 
 
    // Generate partial products 
    assign PP[0] = {A[0], 2'b0} & B; 
    assign PP[1] = {A[1], 2'b0} & B; 
    assign PP[2] = {A[2], 2'b0} & B; 
 
    // Generate partial product sums 
    assign PP_sum[0] = PP[0] + PP[1]; 
    assign PP_sum[1] = PP[1] + PP[2]; 
 
    // Generate final product 
    assign PP_final = {PP_sum[0], PP_sum[1][6:1]}; 
 
    // Output 
    assign P = PP_final; 
endmodule 
