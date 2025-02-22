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
        $dumpfile("alu_simple_tb.vcd");
        $dumpvars(0, alu_simple_tb);


        // Initialize Inputs
        reset = 1;
        A = 0;
        B = 0;
        ALU_Sel = 0;

        // Wait for global reset
        #10;
        reset = 0;
        #10;

        // Test Addition
        A = 8'h9d;
        B = 8'h60;
        ALU_Sel = 4'b0000;
        #10;
        $display("Addition: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'hb1;
        B = 8'h9f;
        ALU_Sel = 4'b0000;
        #10;
        $display("Addition: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'h97;
        B = 8'h1b;
        ALU_Sel = 4'b0000;
        #10;
        $display("Addition: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'h27;
        B = 8'h18;
        ALU_Sel = 4'b0000;
        #10;
        $display("Addition: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'h89;
        B = 8'h38;
        ALU_Sel = 4'b0000;
        #10;
        $display("Addition: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        // Test Subtraction
        A = 8'h55;
        B = 8'h36;
        ALU_Sel = 4'b0001;
        #10;
        $display("Subtraction: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);
        
        A = 8'h38;
        B = 8'h10;
        ALU_Sel = 4'b0001;
        #10;
        $display("Subtraction: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'hea;
        B = 8'h3c;
        ALU_Sel = 4'b0001;
        #10;
        $display("Subtraction: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'hc4;
        B = 8'h7b;
        ALU_Sel = 4'b0001;
        #10;
        $display("Subtraction: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'h2b;
        B = 8'h6;
        ALU_Sel = 4'b0001;
        #10;
        $display("Subtraction: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        // Test Multiplication
        A = 8'he;
        B = 8'hb;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'hc;
        B = 8'h3;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'hc;
        B = 8'h3;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'hf;
        B = 8'ha;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'h0;
        B = 8'h0;
        ALU_Sel = 4'b0010;
        #10;
        $display("Multiplication: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        // Test Division
        A = 8'h24;
        B = 8'h22;
        ALU_Sel = 4'b0011;
        #10;
        $display("Division: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'h1d;
        B = 8'h4;
        ALU_Sel = 4'b0011;
        #10;
        $display("Division: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'h13;
        B = 8'h11;
        ALU_Sel = 4'b0011;
        #10;
        $display("Division: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'hf4;
        B = 8'h2f;
        ALU_Sel = 4'b0011;
        #10;
        $display("Division: A = %d, B = %d, ALU_Out = %d, CarryOut = %b", A, B, ALU_Out, CarryOut);

        A = 8'hb7;
        B = 8'h5a;
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


