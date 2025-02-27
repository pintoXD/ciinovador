module multiplier32FP_tb();
    logic clk, rst_n;
    logic [31:0] a_i;
    logic [31:0] b_i;
    logic start_i;
    logic done_o;
    logic nan_o;
    logic inifinit_o;
    logic overflow_o;
    logic underflow_o;
    logic [31:0] product_o;

    // logic [31:0] testvectors [0:199];
    logic [31:0] testvectors [0:99][0:2];

    int vectornum;
    int errors;
    int test;
    int file, r, i, j;

    shortreal mock_a;
    shortreal mock_b;
    shortreal expected_result;
    
    int a, b;


    multiplier32FP DUT (
        .clk(clk), 
        .rst_n(rst_n),
        .a_i(a_i),
        .b_i(b_i),
        .start_i(start_i),
        .done_o(done_o),
        .nan_o(nan_o),
        .inifinit_o(inifinit_o),
        .overflow_o(overflow_o),
        .underflow_o(underflow_o),
        .product_o(product_o)
    );

    // always_comb begin
    //     if ((check == 1) && compare(out1_tb, out_dut)) begin
    //     //if ((check == 1) && (out1_tb != out_dut)) begin
    //         $display("%t Not matching!! %g %g", $time, out1_tb, out_dut);
    //     end
    // end

    function bit compare_floats (shortreal r1, r2);
        shortreal diff;
        diff = (r1>=r2) ? r1-r2 : r2-r1; // Absolute value
        return (diff > 0.1) ? 1 : 0;
    endfunction



    always begin
        clk = 1; #5; clk = 0; #5;
    end

    initial begin
        // $dumpfile("alu_testvectors_tb.vcd");
        // $dumpvars(0, alu_testvectors_tb);
        #100;
        file = $fopen("vetor.txt", "r");
        if (file == 0) begin
            $display("Error: Could not open file.");
            $finish;
        end

        // Read the file and store the data in the array
        for (i = 0; i < 100; i = i + 1) begin
                r = $fscanf(file, "%h %h", testvectors[i][0], testvectors[i][1]);
        end
        // Close the file
        $fclose(file);

        #100;

        vectornum = 0;
      

        #10;
        rst_n = 0;
        start_i = 0;
        #10;
        rst_n = 1;
        // start_i = 1;
        #100;

        start_i = 1;
        for (vectornum = 0; vectornum < 100; vectornum = vectornum + 1) begin
            a_i = testvectors[vectornum][0];
            b_i = testvectors[vectornum][1];

            mock_a = $bitstoshortreal(testvectors[vectornum][0]);
            mock_b = $bitstoshortreal(testvectors[vectornum][1]);
            expected_result = mock_a * mock_b;
            
            @(posedge done_o);
            #10;
            if($bitstoshortreal(product_o) != expected_result) begin
                $display("Line %d Error: Expected %h, got %h", vectornum + 1, $shortrealtobits(expected_result), product_o);
                errors = errors + 1;
            end
        end
            // if(vectornum >= 100)
        $display("Finished testing all vectors. %d errors found.", errors);
        $finish;

    end

endmodule