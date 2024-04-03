module StringReverse(
    input wire [7:0] input_string, // Input string
    output reg [7:0] output_string // Output string
);

integer i;

always @* begin
    // Iterate over each character of the string
    for (i = 0; i < 8; i = i + 1) begin
        // Reverse the characters
        output_string[i] = input_string[7 - i];
    end
end

endmodule

`timescale 1ns / 1ps
module StringReverse_TB;
    reg [7:0] input_string; // Input string
    wire [7:0] output_string; // Output string

    // Instantiate the module
    StringReverse dut (
        .input_string(input_string),
        .output_string(output_string)
    );

    initial begin
        // Initialize input string
      $dumpfile("dump.vcd");$dumpvars;
        input_string = 8'b01100001; // 'a'
      	#10 input_string = 8'b01100101;
      #10 input_string = 8'b11010101;

        // Display input string
        $display("Input String: %c", input_string);

        // Display output string
        $display("Output String (Reversed): %c", output_string);

        // End simulation
        $finish;
    end
endmodule
