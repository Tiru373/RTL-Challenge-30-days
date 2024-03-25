module binary_to_bcd (
    input [5:0] binary,
    output reg [3:0] bcd_tens,
    output reg [3:0] bcd_ones
);

// Convert Binary to BCD
always @* begin
    // Extract tens and ones digits
    reg [3:0] tens = binary / 10;
    reg [3:0] ones = binary % 10;

    // Convert tens digit to BCD
    case(tens)
        4'b0000: bcd_tens = 4'b0000;
        4'b0001: bcd_tens = 4'b0001;
        4'b0010: bcd_tens = 4'b0010;
        4'b0011: bcd_tens = 4'b0011;
        4'b0100: bcd_tens = 4'b0100;
        4'b0101: bcd_tens = 4'b0101;
        4'b0110: bcd_tens = 4'b0110;
        4'b0111: bcd_tens = 4'b0111;
        4'b1000: bcd_tens = 4'b1000;
        default: bcd_tens = 4'bxxxx; // Handle invalid input
    endcase

    // Convert ones digit to BCD
    case(ones)
        4'b0000: bcd_ones = 4'b0000;
        4'b0001: bcd_ones = 4'b0001;
        4'b0010: bcd_ones = 4'b0010;
        4'b0011: bcd_ones = 4'b0011;
        4'b0100: bcd_ones = 4'b0100;
        4'b0101: bcd_ones = 4'b0101;
        4'b0110: bcd_ones = 4'b0110;
        4'b0111: bcd_ones = 4'b0111;
        4'b1000: bcd_ones = 4'b1000;
        default: bcd_ones = 4'bxxxx; // Handle invalid input
    endcase
end

endmodule

module seven_segment_display (
    input [3:0] bcd_digit, // 4-bit BCD input representing the digit to be displayed
    output reg [6:0] seg_output // Seven-segment display output
);

always @* begin
    case(bcd_digit)
        4'b0000: seg_output = 7'b1000000; // 0
        4'b0001: seg_output = 7'b1111001; // 1
        4'b0010: seg_output = 7'b0100100; // 2
        4'b0011: seg_output = 7'b0110000; // 3
        4'b0100: seg_output = 7'b0011001; // 4
        4'b0101: seg_output = 7'b0010010; // 5
        4'b0110: seg_output = 7'b0000010; // 6
        4'b0111: seg_output = 7'b1111000; // 7
        4'b1000: seg_output = 7'b0000000; // 8
        4'b1001: seg_output = 7'b0011000; // 9
        default: seg_output = 7'b1111111; // Display nothing for other values
    endcase
end

endmodule


module digital_clock(
    input wire clk, reset,
    output reg [6:0] seg_hours_1, seg_hours_2, seg_minutes_1, seg_minutes_2, seg_seconds_1, seg_seconds_2
);

reg [5:0] hours, minutes, seconds;
wire [3:0] hours_bcd_lower, hours_bcd_upper, minutes_bcd_lower, minutes_bcd_upper, seconds_bcd_lower, seconds_bcd_upper;

// Clock divider for time update frequency (e.g., every second)
reg [23:0] counter = 0;
localparam COUNT_MAX = 24000000; // Assuming a 24MHz clock, this counts for 1 second
reg update_time = 0;

// Clock divider
always @(posedge clk) begin
    if (counter == COUNT_MAX - 1) begin
        counter <= 0;
        update_time <= 1;
    end else begin
        counter <= counter + 1;
        update_time <= 0;
    end
end

// Update time on every clock cycle
always @(posedge clk or posedge reset) begin
    if (reset) begin
        hours <= 0;
        minutes <= 0;
        seconds <= 0;
    end else if (update_time) begin
        // Update time here (increment seconds, minutes, hours)
        seconds <= (seconds == 6'b5959) ? 0 : seconds + 1;
        minutes <= (seconds == 6'b5959) ? ((minutes == 6'b5959) ? 0 : minutes + 1) : minutes;
        hours <= (minutes == 6'b5959 && seconds == 6'b5959) ? ((hours == 6'b2359) ? 0 : hours + 1) : hours;
    end
end

// Convert values to BCD format
binary_to_bcd binary_to_bcd_hours_lower(
    .binary(hours[3:0]),
    .bcd_tens(hours_bcd_lower),
    .bcd_ones(hours_bcd_upper)
);
binary_to_bcd binary_to_bcd_hours_upper(
    .binary(hours[5:4]),
    .bcd_tens(hours_bcd_upper),
    .bcd_ones(hours_bcd_lower)
);
binary_to_bcd binary_to_bcd_minutes_lower(
    .binary(minutes[3:0]),
    .bcd_tens(minutes_bcd_lower),
    .bcd_ones(minutes_bcd_upper)
);
binary_to_bcd binary_to_bcd_minutes_upper(
    .binary(minutes[5:4]),
    .bcd_tens(minutes_bcd_upper),
    .bcd_ones(minutes_bcd_lower)
);
binary_to_bcd binary_to_bcd_seconds_lower(
    .binary(seconds[3:0]),
    .bcd_tens(seconds_bcd_lower),
    .bcd_ones(seconds_bcd_upper)
);
binary_to_bcd binary_to_bcd_seconds_upper(
    .binary(seconds[5:4]),
    .bcd_tens(seconds_bcd_upper),
    .bcd_ones(seconds_bcd_lower)
);

// Convert BCD to seven-segment display format
seven_segment_display bcd_to_seven_segment_hours_1(
    .bcd_digit(hours_bcd_lower),
    .seg_output(seg_hours_1)
);
seven_segment_display bcd_to_seven_segment_hours_2(
    .bcd_digit(hours_bcd_upper),
    .seg_output(seg_hours_2)
);
seven_segment_display bcd_to_seven_segment_minutes_1(
    .bcd_digit(minutes_bcd_lower),
    .seg_output(seg_minutes_1)
);
seven_segment_display bcd_to_seven_segment_minutes_2(
    .bcd_digit(minutes_bcd_upper),
    .seg_output(seg_minutes_2)
);
seven_segment_display bcd_to_seven_segment_seconds_1(
    .bcd_digit(seconds_bcd_lower),
    .seg_output(seg_seconds_1)
);
seven_segment_display bcd_to_seven_segment_seconds_2(
    .bcd_digit(seconds_bcd_upper),
    .seg_output(seg_seconds_2)
);

endmodule
