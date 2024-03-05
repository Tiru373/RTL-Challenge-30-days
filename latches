//SR Latch: 

module sr_latch( 
    input S, R, 
    output reg Q, Q_bar 
); 
always @(S or R) 
    if (!S && R) 
        {Q, Q_bar} <= 2'b01; 
    else if (S && !R) 
        {Q, Q_bar} <= 2'b10; 
endmodule 
 

//D Latch: 

 

module d_latch( 
    input D, EN, 
    output reg Q 
); 
always @(EN) 
    if (EN) 
        Q <= D; 
endmodule 
 

//Gated Latch: 

module gated_latch( 
    input D, EN, CLK, 
    output reg Q 
); 
always @(posedge CLK) 
    if (EN) 
        Q <= D; 
endmodule 
