module PrimeNumberGenerator(
    input wire clk,
    input wire reset,
    input wire start_generation,
    input wire [31:0] limit,
    output reg [31:0] prime_number
);

    // Function to check if a number is prime
    function integer is_prime;
        input integer num;
        begin
            integer i;
            if (num <= 1)
                is_prime = 0;
            else if (num <= 3)
                is_prime = 1;
            else if (num % 2 == 0 || num % 3 == 0)
                is_prime = 0;
            else begin
                i = 5;
                while (i * i <= num) begin
                    if (num % i == 0 || num % (i + 2) == 0)
                        is_prime = 0;
                    i = i + 6;
                end
                is_prime = 1;
            end
        end
    endfunction

    // Internal signals
    reg [31:0] current_number;
    reg [31:0] next_candidate;

    // Prime number generation logic
    always @(posedge clk or posedge reset) begin
        if (reset || start_generation) begin
            current_number <= 1;
            prime_number <= 2; // 2 is the first prime number
        end else if (current_number <= limit) begin
            next_candidate <= current_number + 1;
            if (is_prime(next_candidate)) begin
                prime_number <= next_candidate;
            end
            current_number <= next_candidate;
        end
    end

endmodule
