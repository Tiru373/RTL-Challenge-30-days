module miniproject (
    input wire clk,
    input wire [3:0] virtual_input,
    output reg [3:0] chipscope_output,
    output reg Data
);

    // Internal signals
    reg [1:0] sel;

    // Instantiations
    counter_inst counter_inst (
        .clk(clk),
        .counter_output(sel)
    );

    mux4to1_dataflow mux_inst (
        .virtual_input(virtual_input),
        .mux_select(sel),
        .mux_output(chipscope_output)
    );

    decoder_behavioral decoder_inst (
        .en(mux_inst.mux_output),
        .decoder_input(sel),
        .decoder_output(Data)
    );

    latch_behavioral latch_inst (
        .latch_input(virtual_input),
        .latch_enable(clk),
        .latch_output(chipscope_output)
    );

    // Assignments
    assign Data = mux_inst.mux_output;

endmodule

// Define Counter module
module counter_inst (
    input wire clk,
    output reg [1:0] counter_output
);
    reg [1:0] counter_value;
    
    always @(posedge clk) begin
        counter_value <= counter_value + 2'b01; // Increment by 1
    end
    
    assign counter_output = counter_value;
    
endmodule

// Define 4-to-1 Mux using dataflow
module mux4to1_dataflow (
    input wire [3:0] virtual_input,
    input wire [1:0] mux_select,
    output reg [3:0] mux_output
);
    always @* begin
        case(mux_select)
            2'b00: mux_output = virtual_input[0];
            2'b01: mux_output = virtual_input[1];
            2'b10: mux_output = virtual_input[2];
            2'b11: mux_output = virtual_input[3];
            default: mux_output = 4'b0000; // Default case
        endcase
    end
endmodule

// Define Decoder using behavioral modeling
module decoder_behavioral (
    input wire en,
    input wire [1:0] decoder_input,
    output reg [3:0] decoder_output
);
    always @* begin
        if(en) begin
            case(decoder_input)
                2'b00: decoder_output = 4'b0001;
                2'b01: decoder_output = 4'b0010;
                2'b10: decoder_output = 4'b0100;
                2'b11: decoder_output = 4'b1000;
                default: decoder_output = 4'b0000; // Default case
            endcase
        end
    end
endmodule

// Define Latch using behavioral modeling
module latch_behavioral (
    input wire [3:0] latch_input,
    input wire latch_enable,
    output reg [3:0] latch_output
);
    always @(posedge latch_enable) begin
        if (latch_enable)
            latch_output <= latch_input;
    end
endmodule
