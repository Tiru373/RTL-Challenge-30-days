module FunctionDemo (
    input wire clk,
    input wire [31:0] num,
    output reg [31:0] result
);

    // Function to calculate factorial
    function integer factorial;
        input integer n;
        integer i, fact;
        begin
            fact = 1;
            for (i = 1; i <= n; i = i + 1) begin
                fact = fact * i;
            end
            factorial = fact;
        end
    endfunction
    
    // Always block to calculate factorial and assign it to result
    always @(posedge clk) begin
        result <= factorial(num);
    end

endmodule
