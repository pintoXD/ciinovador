`timescale 1us/1ns
module ADDRESS_INTERPRETER_TB ();

    logic clk, reset;
    logic [7:0] A, INTERPRETED_ADDR, F_BIT_LOCATOR;

    ADDRESS_INTERPRETER DUT(
        .A(A),
        .INTERPRETED_ADDR(INTERPRETED_ADDR),
        .F_BIT_LOCATOR(F_BIT_LOCATOR)
    );

    initial begin
        clk = 0;
        forever begin
            #165ns clk = ~clk; // 330ns CLK Period == 3MHz CLK Frequency
        end
    end

    initial begin
        $dumpfile("ADDRESS_INTERPRETER_TB.vcd");
        $dumpvars(0, ADDRESS_INTERPRETER_TB);

        @(posedge clk);
        reset = 0;


        @(posedge clk);
        A = 8'b101010zz;
        
        @(posedge clk);
        A = 8'bz1111z11;

        @(posedge clk);


        @(posedge clk);
        reset = 1;

        $finish;
    end





endmodule