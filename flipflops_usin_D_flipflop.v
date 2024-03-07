module sr_flipflop(
    input S, R, CLK,
    output reg Q, Q_bar
);
    wire S_ff, R_ff;
    
    assign S_ff = ~(Q_bar & S);
    assign R_ff = ~(Q & R);
    
    d_flipflop d_ff_inst1 (
        .D(S_ff), .CLK(CLK),
        .Q(Q)
    );
    
    d_flipflop d_ff_inst2 (
        .D(R_ff), .CLK(CLK),
        .Q(Q_bar)
    );
endmodule

module jk_flipflop(
    input J, K, CLK,
    output reg Q
);
    wire J_ff, K_ff;
    
    assign J_ff = ~(Q & K);
    assign K_ff = ~(Q_bar & J);
    
    d_flipflop d_ff_inst1 (
        .D(J_ff), .CLK(CLK),
        .Q(Q)
    );
    
    d_flipflop d_ff_inst2 (
        .D(K_ff), .CLK(CLK),
        .Q(Q_bar)
    );
endmodule

module t_flipflop(
    input T, CLK,
    output reg Q
);
    wire T_ff;
    
    assign T_ff = T ^ Q;
    
    d_flipflop d_ff_inst (
        .D(T_ff), .CLK(CLK),
        .Q(Q)
    );
endmodule
