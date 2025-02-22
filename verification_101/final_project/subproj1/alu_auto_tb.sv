module alu_auto_tb();

    logic clock;
    logic reset;
    logic [7:0] A,B;  // ALU 8-bit Inputs                 
    logic [3:0] ALU_Sel;// ALU Selection
    logic [7:0] ALU_Out; // ALU 8-bit Output
    logic CarryOut; // Carry Out Flag

    alu alu_inst(
        .clock(clock),
        .reset(reset),
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .CarryOut(CarryOut)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    // Test vectors
    initial begin
        // Initialize Inputs
        reset = 1;
        A = 0;
        B = 0;
        ALU_Sel = 0;

        // Wait for global reset
        #10;
        reset = 0;

        // Test Addition
        A = 8'h9d;
        B = 8'h60;
        ALU_Sel = 4'b0000;
        #10;
        // $display("Addition: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'hfd && CarryOut == 1'b0) else $fatal(1,"Test Case 1 failed");

        A = 8'hb1;
        B = 8'h9f;
        ALU_Sel = 4'b0000;
        #10;
        // $display("Addition: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'h50 && CarryOut == 1'b1) else $fatal(1,"Test Case 2 failed");

        A = 8'h97;
        B = 8'h1b;
        ALU_Sel = 4'b0000;
        #10;
        $display("Addition: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'hb2 && CarryOut == 1'b0) else $fatal(1,"Test Case 3 failed");

        A = 8'h27;
        B = 8'h18;
        ALU_Sel = 4'b0000;
        #10;
        $display("Addition: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'h3f && CarryOut == 1'b0) else $fatal(1,"Test Case 4 failed");

        A = 8'h89;
        B = 8'h38;
        ALU_Sel = 4'b0000;
        #10;
        $display("Addition: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'hc1 && CarryOut == 1'b0) else $fatal(1,"Test Case 5 failed");

        // Test Subtraction
        A = 8'h55;
        B = 8'h36;
        ALU_Sel = 4'b0001;
        #10;
        $display("Subtraction: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'h1f && CarryOut == 1'b0) else $fatal(1,"Test Case 6 failed");
        
        A = 8'h38;
        B = 8'h10;
        ALU_Sel = 4'b0001;
        #10;
        $display("Subtraction: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'h28 && CarryOut == 1'b0) else $fatal(1,"Test Case 7 failed");

        A = 8'hea;
        B = 8'h3c;
        ALU_Sel = 4'b0001;
        #10;
        $display("Subtraction: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'hae && CarryOut == 1'b1) else $fatal(1,"Test Case 8 failed");

        A = 8'hc4;
        B = 8'h7b;
        ALU_Sel = 4'b0001;
        #10;
        $display("Subtraction: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'h49 && CarryOut == 1'b1) else $fatal(1,"Test Case 9 failed");

        A = 8'h2b;
        B = 8'h6;
        ALU_Sel = 4'b0001;
        #10;
        $display("Subtraction: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'h25 && CarryOut == 1'b0) else $fatal(1,"Test Case 10 failed");

        // Test Multiplication
        A = 8'he;
        B = 8'hb;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'h9a && CarryOut == 1'b0) else $fatal(1,"Test Case 11 failed");

        A = 8'hc;
        B = 8'h3;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'h24 && CarryOut == 1'b0) else $fatal(1,"Test Case 12 failed");

        A = 8'hc;
        B = 8'h3;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'h24 && CarryOut == 1'b0) else $fatal(1,"Test Case 13 failed");

        A = 8'hf;
        B = 8'ha;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'h96 && CarryOut == 1'b0) else $fatal(1,"Test Case 14 failed");

        A = 8'h0;
        B = 8'h0;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'h0 && CarryOut == 1'b0) else $fatal(1,"Test Case 15 failed");

        // Test Division
        A = 8'h24;
        B = 8'h22;
        ALU_Sel = 4'b0011;
        #10;
        $display("Division: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'h1) else $fatal(1,"Test Case 17 failed");

        A = 8'h1d;
        B = 8'h4;
        ALU_Sel = 4'b0011;
        #10;
        $display("Division: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'h7) else $fatal(1,"Test Case 18 failed");

        A = 8'h13;
        B = 8'h11;
        ALU_Sel = 4'b0011;
        #10;
        $display("Division: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'h1) else $fatal(1,"Test Case 19 failed");

        A = 8'hf4;
        B = 8'h2f;
        ALU_Sel = 4'b0011;
        #10;
        $display("Division: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'h5) else $fatal(1,"Test Case 20 failed");

        A = 8'hb7;
        B = 8'h5a;
        ALU_Sel = 4'b0011;
        #10;
        $display("Division: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'h2) else $fatal(1,"Test Case 21 failed");

        // Test Default Case
        ALU_Sel = 4'b0100;
        #10;
        $display("Default: A = %d, B = %d, ALU_Out = %h, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'hAC) else $fatal(1,"Test Case 22 failed");

        // Finish simulation
        $finish;
    end

endmodule


