module StringReverse (
    input wire clk,
    input wire start_reverse,
    input wire [7:0] str_in [0:15],
    output reg [7:0] str_out [0:15],
    output reg reverse_done
);

    // Task to reverse a string
    task reverse_string;
        input [7:0] str_in [0:15];
        output [7:0] str_out [0:15];
        integer i, j;
        begin
            for (i = 0, j = 15; i < 16; i = i + 1, j = j - 1) begin
                str_out[j] = str_in[i];
            end
        end
    endtask

    // Internal signal to store reverse result
    reg [7:0] str_result [0:15];

    // Reverse string logic
    always @(posedge clk) begin
        if (start_reverse) begin
            reverse_string(str_in, str_result);
            str_out <= str_result;
            reverse_done <= 1;
        end else begin
            reverse_done <= 0;
        end
    end

endmodule
