module RAM(
    input wire clk,            // Clock signal
    input wire [7:0] address, // Address bus (8-bit)
    input wire [7:0] data_in, // Data input bus (8-bit)
    input wire write_enable,  // Write enable signal
    output reg [7:0] data_out // Data output bus (8-bit)
);

    reg [7:0] memory [255:0]; // 256x8 RAM memory

    // Read operation
    always @ (posedge clk) begin
        if (!write_enable)
            data_out <= memory[address];
    end

    // Write operation
    always @ (posedge clk) begin
        if (write_enable)
            memory[address] <= data_in;
    end

endmodule
