//Parity Generator: 

module parity_generator(input [7:0] data_in, input parity_type, output reg parity_out); 
 
    always @(*) begin 
        if (parity_type) // If parity_type is 1, calculate even parity 
            parity_out = ^data_in; 
        else // If parity_type is 0, calculate odd parity 
            parity_out = ~^data_in; 
    end 
endmodule 
 

//Parity Checker: 

module parity_checker(input [7:0] data_in, input parity_in, input parity_type, output reg parity_ok); 
 
    reg calculated_parity; 
 
    always @(*) begin 
        if (parity_type) // If parity_type is 1, calculate even parity 
            calculated_parity = ^data_in; 
        else // If parity_type is 0, calculate odd parity 
            calculated_parity = ~^data_in; 
 
        // Compare received parity with calculated parity 
        parity_ok = (calculated_parity == parity_in); 
    end 
 
endmodule 
