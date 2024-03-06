//Verilog module for a BCD to Seven-Segment Converter: 

module bcd_to_seven_segment(input [3:0] bcd, output reg [6:0] seven_segment); 
 
    always @(*) begin 
        case(bcd) 
            4'b0000: seven_segment = 7'b1000000; // 0 
            4'b0001: seven_segment = 7'b1111001; // 1 
            4'b0010: seven_segment = 7'b0100100; // 2 
            4'b0011: seven_segment = 7'b0110000; // 3 
            4'b0100: seven_segment = 7'b0011001; // 4 
            4'b0101: seven_segment = 7'b0010010; // 5 
            4'b0110: seven_segment = 7'b0000010; // 6 
            4'b0111: seven_segment = 7'b1111000; // 7 
            4'b1000: seven_segment = 7'b0000000; // 8 
            4'b1001: seven_segment = 7'b0011000; // 9 
            default: seven_segment = 7'b1111111; // Display nothing if input is out of range 
        endcase 
    end 
 
endmodule 

 
