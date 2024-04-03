module FunctionTaskGenvarDemo_TB;

    // Inputs
    reg clk;
    reg [31:0] num;
  wire [31:0]result;

    // Instantiate the module under test
    FunctionTaskGenvarDemo dut (
        .clk(clk),
        .num(num)
    );
integer i;
    // Clock generation
    always #5 clk = ~clk; // Toggle clock every 5 time units

    // Initial values
    initial begin
      
      $dumpfile("dump.vcd"); $dumpvars;
        // Initialize inputs
        clk = 0;
      for (i = 1; i <= 7; i = i + 1) begin
                #10 num=i;
            end // Test with num = 10
        
        // Run simulation for 100 time units
        #100;
        
        // End simulation
        $finish;
    end

endmodule
