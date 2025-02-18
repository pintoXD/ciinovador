module alu_simple_tb();

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
        $display("Addition: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'd100;
        B = 8'd55;
        ALU_Sel = 4'b0000;
        #10;
        $display("Addition: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'd200;
        B = 8'd55;
        ALU_Sel = 4'b0000;
        #10;
        $display("Addition: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'd255;
        B = 8'd1;
        ALU_Sel = 4'b0000;
        #10;
        $display("Addition: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'd255;
        B = 8'd50;
        ALU_Sel = 4'b0000;
        #10;
        $display("Addition: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        // Test Subtraction
        A = 8'd20;
        B = 8'd5;
        ALU_Sel = 4'b0001;
        #10;
        $display("Subtraction: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        
        A = 8'd50;
        B = 8'd25;
        ALU_Sel = 4'b0001;
        #10;
        $display("Subtraction: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'd100;
        B = 8'd50;
        ALU_Sel = 4'b0001;
        #10;
        $display("Subtraction: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'd200;
        B = 8'd100;
        ALU_Sel = 4'b0001;
        #10;
        $display("Subtraction: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'd255;
        B = 8'd128;
        ALU_Sel = 4'b0001;
        #10;
        $display("Subtraction: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        // Test Multiplication
        A = 8'd3;
        B = 8'd4;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'd10;
        B = 8'd10;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'd15;
        B = 8'd15;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'd20;
        B = 8'd5;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'd25;
        B = 8'd4;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'd30;
        B = 8'd3;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        // Test Division
        A = 8'd20;
        B = 8'd4;
        ALU_Sel = 4'b0011;
        #10;
        $display("Division: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'd100;
        B = 8'd5;
        ALU_Sel = 4'b0011;
        #10;
        $display("Division: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'd50;
        B = 8'd2;
        ALU_Sel = 4'b0011;
        #10;
        $display("Division: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'd75;
        B = 8'd3;
        ALU_Sel = 4'b0011;
        #10;
        $display("Division: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'd200;
        B = 8'd10;
        ALU_Sel = 4'b0011;
        #10;
        $display("Division: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        // Test Default Case
        ALU_Sel = 4'b0100;
        #10;
        $display("Default: A = %d, B = %d, ALU_Out = %h, CarryOut = %b", A, B, ALU_Out, CarryOut);

        // Finish simulation
        $finish;
    end

endmodule


