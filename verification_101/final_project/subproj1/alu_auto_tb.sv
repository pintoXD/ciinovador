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
        A = 8'd15;
        B = 8'd10;
        ALU_Sel = 4'b0000;
        #10;
        // $display("Addition: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd25 && CarryOut == 1'b0) else $fatal(1,"Test Case 1 failed");

        A = 8'd100;
        B = 8'd55;
        ALU_Sel = 4'b0000;
        #10;
        // $display("Addition: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd155 && CarryOut == 1'b0) else $fatal(1,"Test Case 2 failed");

        A = 8'd200;
        B = 8'd55;
        ALU_Sel = 4'b0000;
        #10;
        $display("Addition: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd255 && CarryOut == 1'b0) else $fatal(1,"Test Case 3 failed");

        A = 8'd255;
        B = 8'd1;
        ALU_Sel = 4'b0000;
        #10;
        $display("Addition: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd0 && CarryOut == 1'b1) else $fatal(1,"Test Case 4 failed");

        A = 8'd255;
        B = 8'd50;
        ALU_Sel = 4'b0000;
        #10;
        $display("Addition: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd49 && CarryOut == 1'b1) else $fatal(1,"Test Case 5 failed");

        // Test Subtraction
        A = 8'd20;
        B = 8'd5;
        ALU_Sel = 4'b0001;
        #10;
        $display("Subtraction: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd15 && CarryOut == 1'b0) else $fatal(1,"Test Case 6 failed");
        
        A = 8'd50;
        B = 8'd25;
        ALU_Sel = 4'b0001;
        #10;
        $display("Subtraction: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd25 && CarryOut == 1'b0) else $fatal(1,"Test Case 7 failed");

        A = 8'd100;
        B = 8'd50;
        ALU_Sel = 4'b0001;
        #10;
        $display("Subtraction: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd50 && CarryOut == 1'b0) else $fatal(1,"Test Case 8 failed");

        A = 8'd200;
        B = 8'd100;
        ALU_Sel = 4'b0001;
        #10;
        $display("Subtraction: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd100 && CarryOut == 1'b1) else $fatal(1,"Test Case 9 failed");

        A = 8'd255;
        B = 8'd128;
        ALU_Sel = 4'b0001;
        #10;
        $display("Subtraction: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd127 && CarryOut == 1'b1) else $fatal(1,"Test Case 10 failed");

        // Test Multiplication
        A = 8'd3;
        B = 8'd4;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd12 && CarryOut == 1'b0) else $fatal(1,"Test Case 11 failed");

        A = 8'd10;
        B = 8'd10;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd100 && CarryOut == 1'b0) else $fatal(1,"Test Case 12 failed");

        A = 8'd15;
        B = 8'd15;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd225 && CarryOut == 1'b0) else $fatal(1,"Test Case 13 failed");

        A = 8'd20;
        B = 8'd5;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd100 && CarryOut == 1'b0) else $fatal(1,"Test Case 14 failed");

        A = 8'd25;
        B = 8'd4;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd100 && CarryOut == 1'b0) else $fatal(1,"Test Case 15 failed");

        A = 8'd30;
        B = 8'd3;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd90 && CarryOut == 1'b0) else $fatal(1,"Test Case 16 failed");

        // Test Division
        A = 8'd20;
        B = 8'd4;
        ALU_Sel = 4'b0011;
        #10;
        $display("Division: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd5 && CarryOut == 1'b0) else $fatal(1,"Test Case 17 failed");

        A = 8'd100;
        B = 8'd5;
        ALU_Sel = 4'b0011;
        #10;
        $display("Division: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd20 && CarryOut == 1'b0) else $fatal(1,"Test Case 18 failed");

        A = 8'd50;
        B = 8'd2;
        ALU_Sel = 4'b0011;
        #10;
        $display("Division: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd25 && CarryOut == 1'b0) else $fatal(1,"Test Case 19 failed");

        A = 8'd75;
        B = 8'd3;
        ALU_Sel = 4'b0011;
        #10;
        $display("Division: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd25 && CarryOut == 1'b0) else $fatal(1,"Test Case 20 failed");

        A = 8'd200;
        B = 8'd10;
        ALU_Sel = 4'b0011;
        #10;
        $display("Division: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'd20 && CarryOut == 1'b0) else $fatal(1,"Test Case 21 failed");

        // Test Default Case
        ALU_Sel = 4'b0100;
        #10;
        $display("Default: A = %d, B = %d, ALU_Out = %h, CarryOut = %b", A, B, ALU_Out, CarryOut);
        assert(ALU_Out == 8'hAC && CarryOut == 1'b0) else $fatal(1,"Test Case 22 failed");

        // Finish simulation
        $finish;
    end

endmodule


