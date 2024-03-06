//Half Subtractor: 

module half_subtractor(input A, input B, output Diff, output Borrow); 
    assign Diff = A ^ B; 
    assign Borrow = ~A & B; 
endmodule 
 

//Full Subtractor: 

module full_subtractor(input A, input B, input Bin, output Diff, output Borrow); 
    wire D1, D2, B1, B2; 
    half_subtractor HS1(.A(A), .B(B), .Diff(D1), .Borrow(B1)); 
    half_subtractor HS2(.A(D1), .B(Bin), .Diff(D2), .Borrow(B2)); 
    assign Diff = D2; 
    assign Borrow = B1 | B2; 
endmodule 
 

//Complement Subtractor: 

module complement_subtractor(input [3:0] A, input [3:0] B, output [3:0] Diff); 
    assign Diff = A + (~B) + 1; 
endmodule 

//Borrow Subtractor: 

module borrow_subtractor( 
    input [3:0] Minuend, Subtrahend, 
    output [3:0] Difference, Borrow 
); 
 
assign Difference = Minuend - Subtrahend; 
assign Borrow = (Minuend < Subtrahend); 
 
endmodule 
 

 

 

 

//Serial Subtractor: 

module serial_subtractor(input clk, input rst, input [3:0] A, input [3:0] B, output reg [3:0] Diff); 
    always @(posedge clk or posedge rst) begin 
        if (rst) 
            Diff <= 4'b0000; 
        else 
            Diff <= Diff - B; 
    end 
endmodule 

//Parallel Subtractor: 

module parallel_subtractor( 
    input [3:0] A, B, 
    output [3:0] Difference 
); 
 
assign Difference = A - B; 
 
endmodule 

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