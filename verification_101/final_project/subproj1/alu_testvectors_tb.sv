module test_alu;
  logic [7:0] A, B;
  logic [3:0] ALU_Sel;
  logic clock, reset;
  logic [7:0] ALU_Out;
  logic CarryOut;

  

  // Instantiate the ALU
  alu uut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .clock(clock),
    .reset(reset),
    .ALU_Out(ALU_Out),
    .CarryOut(CarryOut)
  );

  // Clock generation
  always #5 clock = ~clock;

  initial begin
    // Initialize signals
    clock = 0;
    reset = 1;
    #10 reset = 0;

    // Open the TV file
    $readmemb("data.tv", test_vectors);

    // Apply test vectors
    for (i = 0; i < num_vectors; i = i + 1) begin
      {A, B, ALU_Sel, expected_ALU_Out, expected_CarryOut} = test_vectors[i];
      #10;
      if (ALU_Out !== expected_ALU_Out || CarryOut !== expected_CarryOut) begin
        $display("Test failed for vector %0d: A=%0d, B=%0d, ALU_Sel=%0b", i, A, B, ALU_Sel);
      end
    end

    $finish;
  end



endmodule