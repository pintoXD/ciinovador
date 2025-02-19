module alu_testvectors_tb;
  logic [7:0] A, B;
  logic [3:0] ALU_Sel;
  logic clock, reset;
  logic [7:0] ALU_Out;
  logic CarryOut;


  logic [7:0] mock_A, mock_B;
  logic mock_ALU_Sel;
  logic [7:0]expected_ALU_Out; 
  logic expected_CarryOut;
  int num_vectors, i;
  logic [7:0] testvectors [0:119];
  logic [31:0] vectornum, errors; // bookkeeping variables

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

    always begin
        clock = 1; #5; clock = 0; #5;
    end

    initial begin
        $readmemh("data2.tv", testvectors);
        vectornum = 0;
        errors = 0;
        reset = 1;
        #30;
        reset = 0;
    end

    always @(posedge clock)
    begin
        #1;
        A = testvectors[vectornum];
        B = testvectors[vectornum+1];
        ALU_Sel = testvectors[vectornum+2];
        
        #10; 
        if (testvectors[vectornum] === 8'bxx || testvectors[vectornum + 1] === 8'bxx || testvectors[vectornum + 2] === 8'bxx) begin
            $display("Finished testing all vectors. %d errors found.", errors);
            $finish;
        end
    end


    always @(negedge clock) begin
        #100;
        
        expected_ALU_Out = testvectors[vectornum+3];
        expected_CarryOut = testvectors[vectornum+4];

        if (ALU_Out == 8'bx || CarryOut == 1'bx) begin
            $display("Finished testing all vectors. %d errors found.", errors);
            $finish;
        end
        
        if (ALU_Out !== expected_ALU_Out || CarryOut !== expected_CarryOut) begin
            errors = errors + 1;
            $display("Error in vector %d: A = %h, B = %h, ALU_Sel = %h, Expected_ALU_Out=%h, Expected_CarryOut=%h, ALU_Out=%h, CarryOut=%h", i/5, A, B, ALU_Sel, expected_ALU_Out, expected_CarryOut, ALU_Out, CarryOut);
        end

        vectornum = vectornum + 5;
    end



endmodule