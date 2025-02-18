module test_alu;
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
  logic [15:0] vectornum, errors; // bookkeeping variables

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

    initial begin
        clock = 0;
        forever begin
            #5 clock = ~clock;
        end
    end


    initial begin
        $readmemh("data2.tv", testvectors);
    end
        
    initial begin
        #100;
        $display("Test vectors read from file:");
        for(i=0; i<120; i=i+5) begin
            // $display("A = %h, B = %h, ALU_Sel = %h", testvectors[i][7:0], testvectors[i][15:8], testvectors[i][31:16]);
            $display("A = %h, B = %h, ALU_Sel = %h, Expected_ALU_Out=%h, Expected_CarryOut=%h", testvectors[i], testvectors[i+1], testvectors[i+2], testvectors[i+3], testvectors[i+4]);
        end
    end



endmodule