//Array Multiplier: 

module array_multiplier(input [7:0] A, input [7:0] B, output reg [15:0] P); 
    reg [15:0] partial_products [0:7]; 
 
    // Generate partial products 
    genvar i, j; 
    generate 
        for (i = 0; i < 8; i = i + 1) begin : gen_pp 
            for (j = 0; j < 8; j = j + 1) begin : gen_pp_inner 
                assign partial_products[i][j+i] = A[i] & B[j]; 
            end 
        end 
    endgenerate 
 
    // Accumulate partial products 
    always @* begin 
        P = 16'b0; 
        for (i = 0; i < 8; i = i + 1) begin 
            P = P + partial_products[i]; 
        end 
    end 
endmodule 

//Wallace Tree Multiplier: 

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

 
 
