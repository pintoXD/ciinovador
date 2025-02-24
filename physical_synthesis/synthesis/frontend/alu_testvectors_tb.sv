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

    always begin
        clk = 1; #5; clk = 0; #5;
    end

    initial begin
        // $dumpfile("alu_testvectors_tb.vcd");
        // $dumpvars(0, alu_testvectors_tb);
        $readmemh("vetor.txt", testvectors);
        #10000;
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

        // Display the contents of the array using foreach
        
        // Display the contents of the array
        for (i = 0; i < 100; i = i + 1) begin
                $display("testvectors[%0d][0] = %h", i, testvectors[i][0]);
                $display("testvectors[%0d][1] = %h", i, testvectors[i][1]);
        end
        $finish;
        vectornum = 0;
        // errors = 0;
        #10;
        // reset = 1;
        #10;
        // reset = 0;
        #10;
    end

    always @(posedge clk)
    begin
        #1;
        // A = testvectors[vectornum];
        // B = testvectors[vectornum+1];
        // ALU_Sel = testvectors[vectornum+2];
        #10; 
        // if (testvectors[vectornum] === 8'bxx || testvectors[vectornum + 1] === 8'bxx || testvectors[vectornum + 2] === 8'bxx) begin
        //     $display("Finished testing all vectors. %d errors found.", errors);
        //     $finish;
        // end
    end

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



endmodule