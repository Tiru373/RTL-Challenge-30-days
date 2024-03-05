module alu_16bit ( 
    input wire [15:0] operand1, 
    input wire [15:0] operand2, 
    input wire [3:0] operation, 
    output reg [15:0] result, 
    output reg [3:0] flags 
); 
 
    // Internal signals 
    reg [15:0] temp_result; 
 
 
    always_comb begin 
        case(operation) 
            // Addition 
            4'b0000: temp_result = operand1 + operand2; 
            // Subtraction 
            4'b0001: temp_result = operand1 - operand2; 
            // Bitwise AND 
            4'b0010: temp_result = operand1 & operand2; 
            // Bitwise OR 
            4'b0011: temp_result = operand1 | operand2; 
            // Bitwise XOR 
            4'b0100: temp_result = operand1 ^ operand2; 
            // Left shift 
            4'b0101: temp_result = operand1 << operand2[3:0]; 
            // Right shift 
            4'b0110: temp_result = operand1 >> operand2[3:0]; 
            // Arithmetic shift right (sign extension) 
            4'b0111: temp_result = (operand1[15] == 1) ? {{8{operand1[15]}}, operand1[15:8]} : (operand1 >> operand2[3:0]); 
            // Rotate left 
            4'b1000: temp_result = {operand1[operand2[3:0]], operand1} >> 1; 
            // Rotate right 
            4'b1001: temp_result = {operand1, operand1[15:operand2[3:0]]} << 1; 
            // Compare 
            4'b1010: temp_result = operand1 - operand2; 
            // Increment 
            4'b1011: temp_result = operand1 + 1; 
            // Decrement 
            4'b1100: temp_result = operand1 - 1; 
            // Logical NOT 
            4'b1101: temp_result = ~operand1; 
            // Arithmetic NOT (two's complement) 
            4'b1110: temp_result = -operand1; 
            // Zero extension (zero-pad to 16 bits) 
            4'b1111: temp_result = {8'b0, operand1[7:0]}; 
            default: temp_result = 16'h0000; 
        endcase 
         
        // Set flags 
        flags = 4'b0000; 
        flags[1] = (temp_result == 16'h0000); // Zero flag 
        flags[2] = temp_result[15]; // Sign flag 
 
        // Carry and Overflow flags 
        if (operation == 4'b0000 || operation == 4'b1011 || operation == 4'b1100 || operation == 4'b1000 || operation == 4'b1001) begin 
            flags[0] = (temp_result[16] == 1); // Carry flag 
            flags[3] = ((operand1[15] == operand2[15]) && (temp_result[15] != operand1[15])); // Overflow flag for addition, increment, decrement, rotate left, and rotate right 
        end else if (operation == 4'b0001) begin 
            flags[0] = (operand1[15] < operand2[15]); // Carry flag for subtraction 
            flags[3] = ((operand1[15] != operand2[15]) && (temp_result[15] != operand1[15])); // Overflow flag for subtraction 
        end else if (operation == 4'b1010) begin 
            flags[0] = (operand1 == operand2); // Carry flag for compare 
        end else if (operation == 4'b0111) begin 
            flags[3] = (operand1[15] == 1); // Overflow flag for arithmetic shift right 
        end else if (operation == 4'b1110) begin 
            flags[3] = (operand1 == 16'h8000); // Overflow flag for arithmetic NOT 
        end 
    end 
 
    // Assign final result 
    always @* begin 
        result = temp_result; 
    end 
 
endmodule
