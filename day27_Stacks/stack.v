// Code your design here
module Stack (
    input wire clk,
    input wire reset,
    input wire push,
    input wire pop,
    input wire [7:0] data_in,
    output reg [7:0] data_out,
    output reg stack_empty,
    output reg stack_full
);

    parameter STACK_DEPTH = 8; // Define stack depth

    reg [7:0] stack [0:STACK_DEPTH-1]; // Stack memory
    reg [2:0] top = 3'b000; // Stack pointer (initialized to 0)

    // Flags to indicate stack status
    reg [2:0] stack_size = 3'b000; // Current stack size
    reg [2:0] max_stack_size = 3'b111; // Maximum stack size

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            top <= 3'b000; // Reset stack pointer
            stack_size <= 3'b000; // Reset stack size
            stack_empty <= 1'b1; // Stack is initially empty
            stack_full <= 1'b0; // Stack is initially not full
        end else begin
            // Push operation
            if (push && stack_size < max_stack_size) begin
                stack[top] <= data_in;
                top <= top + 1;
                stack_size <= stack_size + 1;
                stack_empty <= 1'b0;
                stack_full <= (stack_size == max_stack_size) ? 1'b1 : 1'b0;
            end
            // Pop operation
            else if (pop && stack_size > 0) begin
                top <= top - 1;
                data_out <= stack[top];
                stack_size <= stack_size - 1;
                stack_full <= 1'b0;
                stack_empty <= (stack_size == 0) ? 1'b1 : 1'b0;
            end
        end
    end

endmodule
