module test_latches; 
    // Parameters 
    parameter CLK_PERIOD = 10; // Clock period in ns// Signals 
    reg S, R, D, EN, CLK; 
    wire Q_sr, Q_bar_sr, Q_d, Q_gated; 
     
    // Instantiate Latches 
    sr_latch sr_latch_inst( 
        .S(S), .R(R), 
        .Q(Q_sr), .Q_bar(Q_bar_sr) 
    ); 
     
    d_latch d_latch_inst( 
        .D(D), .EN(EN), 
        .Q(Q_d) 
    ); 
     
    gated_latch gated_latch_inst( 
        .D(D), .EN(EN), .CLK(CLK), 
        .Q(Q_gated) 
    ); 
     
    // Clock Generation 
    always #((CLK_PERIOD)/2) CLK = ~CLK; 
     
    // Test Stimulus 
    initial begin 
        // Test SR latch 
        S = 1; R = 0; #10; 
        S = 0; R = 1; #10; 
        S = 0; R = 0; #10; 
        // Test D latch 
        D = 1; EN = 1; #10; 
        D = 0; EN = 1; #10; 
        // Test Gated latch 
        D = 1; EN = 1; #10; 
        D = 0; EN = 0; #10; 
        D = 1; EN = 1; #10; 
        $finish; 
    end 
endmodule 
