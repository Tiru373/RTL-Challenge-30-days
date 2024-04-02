`timescale 1ns / 1ps

module Clock_Phase_Generator_TB;

    // Inputs
    reg clk;
    reg rst;
    
    // Outputs
    wire clk_0;
    wire clk_90;
    wire clk_180;
    wire clk_270;
    
    // Instantiate the module under test
    CLOCK_PHASING dut (
        .clk(clk),
        .rst(rst),
        .clk_0(clk_0),
        .clk_90(clk_90),
        .clk_180(clk_180),
        .clk_270(clk_270)
    );
    
    // Clock generation
    always #5 clk = ~clk; // Toggle clock every 5 time units
    
    // Initial values
    initial begin
        $dumpfile("Clock_Phase_Generator_TB.vcd");
        $dumpvars(0, Clock_Phase_Generator_TB);
        
        // Initialize clock
        clk = 0;
        rst = 1;
        #10 rst = 0;
        
        // Monitor clock signals
        $monitor($time, " - clk = %b, clk_0 = %b, clk_90 = %b, clk_180 = %b, clk_270 = %b", 
                 clk, clk_0, clk_90, clk_180, clk_270);
        
        // Run simulation for 200 time units
        #200;
        
        // End simulation
        $finish;
    end

endmodule
