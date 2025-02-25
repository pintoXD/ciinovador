module alu_testvectors_tb();
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
        // $readmemh("vetor.txt", testvectors);
        #100;
        file = $fopen("vetor2.txt", "r");
        if (file == 0) begin
            $display("Error: Could not open file.");
            $finish;
        end

        // Read the file and store the data in the array
        for (i = 0; i < 100; i = i + 1) begin
                r = $fscanf(file, "%h %h %h", testvectors[i][0], testvectors[i][1], testvectors[i][2]);
        end
        // Close the file
        $fclose(file);

        #100;

        // // Display the contents of the array using foreach
        
        //Display the contents of the array
        for (i = 0; i < 10; i = i + 1) begin
                $display("testvectors[%0d][0] = %h", i, testvectors[i][0]);
                $display("testvectors[%0d][1] = %h", i, testvectors[i][1]);
                $display("testvectors[%0d][2] = %h", i, testvectors[i][2]);
        end
        $finish;
        vectornum = 0;
        // errors = 0;
    // end

    // initial begin
        // // Display the contents of the array
        // for (i = 0; i < 100; i = i + 1) begin
        //         $display("testvectors[%0d][0] = %h", i, testvectors[i][0]);
        //         $display("testvectors[%0d][1] = %h", i, testvectors[i][1]);
        // end

        

        #10;
        rst_n = 0;
        start_i = 0;
        #10;
        rst_n = 1;
        // start_i = 1;
        #100;

        start_i = 1;
        for (vectornum = 0; vectornum < 15; vectornum = vectornum + 1) begin
            a_i = testvectors[vectornum][0];
            b_i = testvectors[vectornum][1];

            mock_a = $bitstoshortreal(testvectors[vectornum][0]);
            mock_b = $bitstoshortreal(testvectors[vectornum][1]);
            expected_result = mock_a * mock_b;
            
            // $display("Multiplying %h * %h = %h", mock_a, mock_b, expected_result);
            // expected_result = $bitstoreal(testvectors[vectornum][0]) * $bitstoreal(testvectors[vectornum][1]);

            @(posedge done_o);
            #10;
            if($bitstoshortreal(product_o) != expected_result) begin
                $display("Line %d Error: Expected %h, got %h", vectornum + 1, $shortrealtobits(expected_result), product_o);
                $display("Multiplying %f * %f = %f", mock_a, mock_b, expected_result);
                $display("Expected %h, got %h", expected_result, product_o);
                $display("Expected %f, got %f", expected_result, $bitstoshortreal(product_o));
            // if(compare_floats($bitstoshortreal(product_o), expected_result)) begin
                errors = errors + 1;
            end
        end
            // if(vectornum >= 100)
        $display("Finished testing all vectors. %d errors found.", errors);
        $finish;

    end



/*
    always @(posedge clk)
    begin

        if(!done_o)begin
            #10;
            a_i = testvectors[vectornum][0];
            b_i = testvectors[vectornum][1];
            expected_result = testvectors[vectornum][0] * testvectors[vectornum][1];
        end else begin
            if(product_o !== expected_result) begin
                $display("Error: Expected %h, got %h", expected_result, product_o);
                errors = errors + 1;
            end

            vectornum = vectornum + 1;

            if(vectornum >= 100)
                $finish;
        end



        #10; 
        // if (testvectors[vectornum] === 8'bxx || testvectors[vectornum + 1] === 8'bxx || testvectors[vectornum + 2] === 8'bxx) begin
        //     $display("Finished testing all vectors. %d errors found.", errors);
        //     $finish;
        // end
    end
*/  /*
    always @(negedge clk) begin
        #10;
        
        // expected_ALU_Out = testvectors[vectornum+3];
        // expected_CarryOut = testvectors[vectornum+4];

        // if (ALU_Out == 8'bx || CarryOut == 1'bx) begin
        //     $display("Finished testing all vectors. %d errors found.", errors);
        //     $finish;
        // end
        
        // if ((ALU_Out !== expected_ALU_Out || CarryOut !== expected_CarryOut) && ALU_Sel != 4'b0011) begin
        //     errors = errors + 1;
        // end
        
        // for(i = 0; i < 2; i = i + 1) begin
        //     $display("testvector[%d ] : %b", i, testvectors[0][i]);
        //     $display("WAIT");
        //     $display("testvector[%d ] : %b", i, testvectors[1][i]);
        //     $finish;
        // end
        // $display("testvector[%d ] : %h", vectornum, testvectors[vectornum]);


        // $display("testvector[%d ] : %h", vectornum, testvectors[vectornum][0]);

        // vectornum = vectornum + 1;
        
        // if(vectornum >= 4)
        //     $finish;

    end

    */

endmodule