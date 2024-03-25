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
 


