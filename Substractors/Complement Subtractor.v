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
