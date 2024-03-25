
//module Bidirectional Subtractor: 

module bidirectional_subtractor( 
    input direction, 
    input [3:0] A, B, 
    output [3:0] Difference, Borrow 
); 
 
wire [3:0] temp_diff; 
wire temp_borrow; 
 
assign Borrow = direction ? (B < A) : (A < B); 
assign temp_diff = direction ? (A - B) : (B - A); 
assign Difference = direction ? temp_diff : (~temp_diff + 1); 
 
endmodule 
