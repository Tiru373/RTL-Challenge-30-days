module rom_with_decoder (
    input wire [m-1:0] address, // Address input
    output reg [n-1:0] data_out // Data output
);

parameter m = 4; // Number of address bits
parameter n = 8; // Data width

// Define ROM data
reg [n-1:0] rom_data [0:(2**m)-1]; // Declare ROM array

// Initialize ROM data (Example initialization)
initial begin
    // Fill ROM data with desired values
    // Example: Initializing with sequential data
    for (int i = 0; i < 2**m; i = i + 1) begin
        rom_data[i] = i;
    end
end

// Decoder to select ROM data
decoder_behavioral decoder_inst (
    .decoder_input(address),
    .decoder_output(decoder_output)
);

// Output data based on the selected address
always @* begin
    case(decoder_output)
        // Select data from ROM based on address
        for (int i = 0; i < (2**m); i = i + 1) begin
            m'b{i}: data_out = rom_data[i];
        end
        default: data_out = n'b0; // Default case
    endcase
end

endmodule

// Define Decoder using behavioral modeling
module decoder_behavioral (
    input wire [m-1:0] decoder_input, // Address input
    output reg [2**m-1:0] decoder_output // Decoder output
);
    // Decoder behavioral logic goes here
    always @* begin
        case(decoder_input)
            for (int i = 0; i < (2**m); i = i + 1) begin
                m'b{i}: decoder_output[i] = 1'b1;
            end
            default: decoder_output = {2**m{1'b0}}; // Default case
        endcase
    end
endmodule
