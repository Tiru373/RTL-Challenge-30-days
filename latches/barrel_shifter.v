module barrel_shifter(
    input [3:0] data_in,
    input [1:0] shift_amount,
    input shift_right,
    output [3:0] data_out
);

wire [3:0] shifted_data;

// Generate the shifted data
assign shifted_data = (shift_right) ? (data_in >> shift_amount) : (data_in << shift_amount);

// Output the shifted data
assign data_out = shifted_data;

endmodule
