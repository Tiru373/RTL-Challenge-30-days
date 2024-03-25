module ClockDividerBy1p5 (
    input clock,
    input reset,
    output reg dividedClock
);

    wire invertedClock, dividedClockBy3;

    // Clock inverter
    Inverter inverter(
        .input(clock),
        .output(invertedClock)
    );

    // Clock divider by 3
    ClockDividerBy3 dividerBy3(
        .clock(invertedClock),
        .reset(reset),
        .dividedClock(dividedClockBy3)
    );

    // T flip-flop for generating the divided clock by 1.5
    TFlipFlop tFlipFlop(
        .output(dividedClock),
        .reset(reset),
        .clock(dividedClockBy3)
    );

endmodule

module Inverter (
    input input,
    output output
);

    assign output = ~input;

endmodule

module ClockDividerBy3 (
    input clock,
    input reset,
    output reg dividedClock
);

    wire toggleSignal, clockBar;
    reg [2:0] toggleFF;

    // Generate toggle signal
    assign toggleSignal = ~toggleFF[0] & ~toggleFF[1];

    // Clock inverter
    Inverter inverter(
        .input(clock),
        .output(clockBar)
    );

    // D flip-flops for divide by 3
    DFlipFlop dFF1(
        .output(toggleFF[0]),
        .reset(reset),
        .clock(clock),
        .data(toggleSignal)
    );

    DFlipFlop dFF2(
        .output(toggleFF[1]),
        .reset(reset),
        .clock(clock),
        .data(toggleFF[0])
    );

    DFlipFlop dFF3(
        .output(dividedClock),
        .reset(reset),
        .clock(clockBar),
        .data(toggleFF[1])
    );

endmodule

module DFlipFlop (
    output reg output,
    input reset,
    input clock,
    input data
);

    always @ (posedge clock) begin
        if (reset)
            output <= 1'b0;
        else
            output <= data;
    end

endmodule

module TFlipFlop (
    output reg output,
    input reset,
    input clock
);

    always @ (posedge clock) begin
        if (reset)
            output <= 1'b0;
        else
            output <= ~output;
    end

endmodule
