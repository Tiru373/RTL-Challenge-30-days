module wallace_tree_multiplier(input [3:0] A, input [3:0] B, output [7:0] P); 
    wire [3:0] PP0, PP1, PP2, PP3; 
    wire [6:0] PP_sum1, PP_sum2; 
    wire [7:0] PP_final; 
 
    // Generate partial products 
    assign PP0 = {A[0], 3'b0} & B; 
    assign PP1 = {A[1], 3'b0} & B; 
    assign PP2 = {A[2], 3'b0} & B; 
    assign PP3 = {A[3], 3'b0} & B; 
 
    // Generate partial product sums 
    assign PP_sum1 = PP0 + {PP1[3:1], 2'b0} + {PP2[3:2], 1'b0} + {PP3[3], 2'b0}; 
    assign PP_sum2 = {PP1[0], 1'b0} + {PP2[1:0], 2'b0} + {PP3[2:0], 3'b0}; 
 
    // Generate final product 
    assign PP_final = {PP_sum1, PP_sum2[6:1]}; 
 
    // Output 
    assign P = PP_final; 
endmodule 
