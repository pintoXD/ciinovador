`timescale 1ns/1ps
module ula32_tb();

logic [31:0] mocked_SrcA, mocked_SrcB;
logic [3:0] mocked_ULAControl;
logic [31:0] dut_ULAResult;
logic dut_FlagZ;


ula32 DUT(
    .SrcA(mocked_SrcA),
    .SrcB(mocked_SrcB),
    .ALUControl(mocked_ULAControl),
    .ALUResult(dut_ULAResult),
    .FlagZ(dut_FlagZ)
);


initial begin
    // Test Case 1: Addition of 0's
    mocked_SrcA = 32'h0;
    mocked_SrcB = 32'h0;
    mocked_ULAControl = 4'b0000; // Adds
    #10;
    assert(dut_ULAResult == 32'b0 && dut_FlagZ == 1'b1) else $fatal(1, "Test Case 1 failed");

    // Test Case 2: Addition of random integer numbers
    mocked_SrcA = 32'h50;
    mocked_SrcB = 32'h60;
    mocked_ULAControl = 4'b0000; // Adds
    #10;
    assert(dut_ULAResult == 32'hB0 && dut_FlagZ == 1'b0) else $fatal(1, "Test Case 2 failed");

    // Test Case 3: Addition of random integer numbers
    mocked_SrcA = 32'h7F;
    mocked_SrcB = 32'h2D;
    mocked_ULAControl = 4'b0000; // Adds
    #10;
    assert(dut_ULAResult == 32'hAC && dut_FlagZ == 1'b0) else $fatal(1, "Test Case 3 failed");

    // Test Case 4: Subtraction of SrcA > SrcB
    mocked_SrcA = 32'h60;
    mocked_SrcB = 32'h50;
    mocked_ULAControl = 4'b0001; // Subtracts
    #10;
    assert(dut_ULAResult == 32'h10 && dut_FlagZ == 1'b0) else $fatal(1, "Test Case 4 failed");

    // Test Case 5: Subtraction of SrcA == SrcB
    mocked_SrcA = 32'h60;
    mocked_SrcB = 32'h60;
    mocked_ULAControl = 4'b0001; // Subtracts
    #10;
    assert(dut_ULAResult == 32'h00 && dut_FlagZ == 1'b1) else $fatal(1, "Test Case 5 failed");

    // Test Case 6: Subtraction of SrcA < SrcB
    mocked_SrcA = 32'h50;
    mocked_SrcB = 32'h60;
    mocked_ULAControl = 4'b0001; // Subtracts
    #10;
    assert(dut_ULAResult == 32'hFFFFFFF0 && dut_FlagZ == 1'b0) else $fatal(1, "Test Case 6 failed");

    // Test Case 7: Subtraction of SrcA < SrcB
    mocked_SrcA = 32'h50;
    mocked_SrcB = 32'h60;
    mocked_ULAControl = 4'b0001; // Subtracts
    #10;
    assert(dut_ULAResult == 32'hFFFFFFF0 && dut_FlagZ == 1'b0) else $fatal(1, "Test Case 7 failed");

    // Test Case 8: ANDing SrcA and SrcB
    mocked_SrcA = 32'hAA;
    mocked_SrcB = 32'hBB;
    mocked_ULAControl = 4'b0010; // ANDs
    #10;
    assert(dut_ULAResult == 32'hAA && dut_FlagZ == 1'b0) else $fatal(1, "Test Case 8 failed");

    // Test Case 9: ANDing SrcA and SrcB with SrcB == 0
    mocked_SrcA = 32'hAA;
    mocked_SrcB = 32'h0;
    mocked_ULAControl = 4'b0010; // ANDs
    #10;
    assert(dut_ULAResult == 32'h00 && dut_FlagZ == 1'b1) else $fatal(1, "Test Case 9 failed");

    // Test Case 10: ORing SrcA and SrcB
    mocked_SrcA = 32'hAA;
    mocked_SrcB = 32'hBB;
    mocked_ULAControl = 4'b0011; // ORs
    #10;
    assert(dut_ULAResult == 32'hBB && dut_FlagZ == 1'b0) else $fatal(1, "Test Case 10 failed");

    // Test Case 11: ORing SrcA and SrcB with SrcB == 0
    mocked_SrcA = 32'hAA;
    mocked_SrcB = 32'h0;
    mocked_ULAControl = 4'b0011; // ORs
    #10;
    assert(dut_ULAResult == 32'hAA && dut_FlagZ == 1'b0) else $fatal(1, "Test Case 11 failed");

    // Test Case 12: Checks whether SrcA < SrcB
    mocked_SrcA = 32'hAA;
    mocked_SrcB = 32'hBB;
    mocked_ULAControl = 4'b0101; // SLTs
    #10;
    assert(dut_ULAResult == 32'hFF && dut_FlagZ == 1'b0) else $fatal(1, "Test Case 12 failed");

    // Test Case 13: Checks whether SrcA < SrcB
    mocked_SrcA = 32'hBB;
    mocked_SrcB = 32'hAA;
    mocked_ULAControl = 4'b0101; // SLTs
    #10;
    assert(dut_ULAResult == 32'h00 && dut_FlagZ == 1'b1) else $fatal(1, "Test Case 13 failed");

    // Test Case 14: XORing SrcA and SrcB
    mocked_SrcA = 32'hBB;
    mocked_SrcB = 32'hAA;
    mocked_ULAControl = 4'b0100; // XOR
    #10;
    assert(dut_ULAResult == 32'h11 && dut_FlagZ == 1'b0) else $fatal(1, "Test Case 14 failed");

    // Test Case 15: XORing SrcA and SrcB
    mocked_SrcA = 32'hAAAAAAAA;
    mocked_SrcB = 32'hAAAAAAAA;
    mocked_ULAControl = 4'b0100; // XOR
    #10;
    assert(dut_ULAResult == 32'h00 && dut_FlagZ == 1'b1) else $fatal(1, "Test Case 15 failed");

    // Test Case 16: XORing SrcA and SrcB
    mocked_SrcA = 32'hAAAAAAAA;
    mocked_SrcB = 32'h55555555;
    mocked_ULAControl = 4'b0100; // XOR
    #10;
    assert(dut_ULAResult == 32'hFFFFFFFF && dut_FlagZ == 1'b0) else $fatal(1, "Test Case 16 failed");
    
    // Test Case 17: Logical Shift Left
    mocked_SrcA = 32'hAABBCCDD;
    mocked_SrcB = 32'h4;
    mocked_ULAControl = 4'b0110; // LSL
    #10;
    assert(dut_ULAResult == 32'hABBCCDD0 && dut_FlagZ == 1'b0) else $fatal(1, "Test Case 17 failed");

    // Test Case 17: Logical Shift Left
    mocked_SrcA = 32'hAABBCCDD;
    mocked_SrcB = 32'h8;
    mocked_ULAControl = 4'b0110; // LSL
    #10;
    assert(dut_ULAResult == 32'hBBCCDD00 && dut_FlagZ == 1'b0) else $fatal(1, "Test Case 17 failed");

    // Test Case 18: Arithmetic Shift Right
    mocked_SrcA = 32'h2;
    mocked_SrcB = 32'h1;
    mocked_ULAControl = 4'b0111; // ASR
    #10;
    assert(dut_ULAResult == 32'h1 && dut_FlagZ == 1'b0) else $fatal(1, "Test Case 18 failed");
    
    // Test Case 19: Arithmetic Shift Right
    mocked_SrcA = 32'h81;
    mocked_SrcB = 32'h1;
    mocked_ULAControl = 4'b0111; // ASR
    #10;
    assert(dut_ULAResult == 32'h40 && dut_FlagZ == 1'b0) else $fatal(1, "Test Case 19 failed");

    // Test Case 20: Arithmetic Shift Right
    mocked_SrcA = 32'hF0000001;
    mocked_SrcB = 32'h4;
    mocked_ULAControl = 4'b0111; // ASR
    #10;
    assert(dut_ULAResult == 32'hFF000000 && dut_FlagZ == 1'b0) else $fatal(1, "Test Case 20 failed");

    // Test Case 21: Logical Shift Right
    mocked_SrcA = 32'hAABBCCDD;
    mocked_SrcB = 32'h4;
    mocked_ULAControl = 4'b1000; // LSR
    #10;
    assert(dut_ULAResult == 32'h0AABBCCD && dut_FlagZ == 1'b0) else $fatal(1, "Test Case 21 failed");

    // Test Case 22: Logical Shift Right
    mocked_SrcA = 32'hAABBCCDD;
    mocked_SrcB = 32'h8;
    mocked_ULAControl = 4'b1000; // LSR
    #10;
    assert(dut_ULAResult == 32'h00AABBCC && dut_FlagZ == 1'b0) else $fatal(1, "Test Case 22 failed");





    #10;
    $finish;
  
end


    initial
    begin
      $display("                Tempo               Entradas ULA                                              Saídas");
      $display("                         mocked_SrcA    mocked_SrcB     mocked_ULAControl       dut_ULAResult      dut_FlagZ");
      $display("                ====   ===================================================     ===============================");
      $monitor($time,"          %h             %h            %b                        %h              %b", mocked_SrcA, mocked_SrcB, mocked_ULAControl, dut_ULAResult, dut_FlagZ);
    end




endmodule
/*

module ula32_tb();

    logic [3:0] A, B;
    logic [3:0] C;

    initial begin
        A = 4'd4;
        B = 4'd4;
        $display("Signed A: %d", signed'(A));
        $display("Unsigned A: %d", A);
        $display("Signed B: %d", signed'(B));
        $display("Unsigned B: %d", B);

        #10;
        C = signed'(A) + signed'(B);
        $display("Signed SUM: %b | %d ", C, signed'(A) + signed'(B));
        C = unsigned'(A) + unsigned'(B);
        $display("Signed SUM: %b | %d ", C, unsigned'(A) + unsigned'(B));

        #10;
        A = 4'd3;
        B = 4'd4;
        C = signed'(A) - signed'(B);
        $display("Signed SUB: %b | %d ", C, signed'(A) - signed'(B));
        C = unsigned'(A) - unsigned'(B);
        $display("Signed SUB: %b | %d ", C, unsigned'(A) - unsigned'(B));
        
        $finish;
    end


endmodule




module tb;
  byte    			s_byte;   // By default byte is signed
  byte unsigned  	u_byte;   // Byte is set to unsigned

  initial begin
    $display ("Size s_byte=%0d, u_byte=%0d", $bits(s_byte), $bits(u_byte));

    // Assign the "assumed" maximum value to both variables
    #1 s_byte = 'h7F;
       u_byte = 'h7F;

    // Increment by 1, and see that s_byte rolled over to negative because
    // byte is signed by default. u_byte keeps increasing because it is
    // unsigned and can go upto 255
    #1 s_byte += 1;
       u_byte += 1;

    // Assign 255 (8'hFF) to u_byte -> this is the max value it can hold
    #1 u_byte = 'hFF;

    // Add 1 and see that it rolls over to 0
    #1 u_byte += 1;
  end

  initial begin
    $monitor ("[%0t ns] s_byte=%0d u_byte=%0d", $time, s_byte, u_byte);
  end
endmodule



*/