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



 
