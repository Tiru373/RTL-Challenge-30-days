module tb_Stack;
    reg clk, reset, push, pop;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire stack_empty, stack_full;

    Stack stack_inst (
        .clk(clk),
        .reset(reset),
        .push(push),
        .pop(pop),
        .data_in(data_in),
        .data_out(data_out),
        .stack_empty(stack_empty),
        .stack_full(stack_full)
    );

    initial begin
        clk = 0;
        reset = 1;
        push = 0;
        pop = 0;
        data_in = 8'b0;

        // Dump VCD file
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_Stack);

        // Reset sequence
        #10 reset = 0;

        // Push data onto the stack
        #20 push = 1; data_in = 8'b10101010;
        #30 push = 0;
        // Push more data
        #40 push = 1; data_in = 8'b11001100;
        #50 push = 0;

        // Pop data from the stack
        #60 pop = 1;
        #70 pop = 0;

        // Simulate more clock cycles
        #80;
        
        // End simulation
        #100 $finish;
    end

    always #5 clk = ~clk;
endmodule
