module barrel_shifter(
    input [3:0] data_in, // Input data
    input [1:0] shift_amount, // Amount to shift
    output reg [3:0] shifted_data // Shifted output data
);

    always @* begin
        case(shift_amount)
            2'b00: shifted_data = data_in; // No shift
            2'b01: shifted_data = data_in << 1; // Shift left by 1
            2'b10: shifted_data = data_in >> 1; // Shift right by 1
            2'b11: shifted_data = {data_in[0], data_in[3:1]}; // Rotate left by 1
            default: shifted_data = data_in; // Default case (no shift)
        endcase
    end

endmodule
