`timescale 1ns/1ps
module ula8_tb();

logic [7:0] mocked_SrcA, mocked_SrcB;
logic [2:0] mocked_ULAControl;
logic mocked_IsLogic;
logic [7:0] dut_ULAResult;
logic dut_FlagZ;



ula8 DUT(
    .SrcA(mocked_SrcA),
    .SrcB(mocked_SrcB),
    .ULAControl(mocked_ULAControl),
    .IsLogic(mocked_IsLogic),
    .ULAResult(dut_ULAResult),
    .FlagZ(dut_FlagZ)
);


initial begin

    // Test Case 1: Addition of 0's
    mocked_SrcA = 8'b0;
    mocked_SrcB = 8'b0;
    mocked_IsLogic = 1'b0;
    mocked_ULAControl = 3'b000; // Adds
    #10;
    assert(dut_ULAResult == 8'b0 && dut_FlagZ == 1'b1) else $fatal(1,"Test Case 1 failed");

    // Test Case 2: Addition of random integer numbers
    mocked_SrcA = 8'h50;
    mocked_SrcB = 8'h60;
    mocked_IsLogic = 1'b0;
    mocked_ULAControl = 3'b000; // Adds
    #10;
    assert(dut_ULAResult == 8'hB0 && dut_FlagZ == 1'b0) else $fatal(1,"Test Case 2 failed");

    // Test Case 3: Addition of random integer numbers
    mocked_SrcA = 8'h7F;
    mocked_SrcB = 8'h2D;
    mocked_IsLogic = 1'b0;
    mocked_ULAControl = 3'b000; // Adds
    #10;
    assert(dut_ULAResult == 8'hAC && dut_FlagZ == 1'b0) else $fatal(1,"Test Case 3 failed");

    // Test Case 4: Subtraction of SrcA > SrcB
    mocked_SrcA = 8'h60;
    mocked_SrcB = 8'h50;
    mocked_IsLogic = 1'b0;
    mocked_ULAControl = 3'b001; // Subtracts
    #10;
    assert(dut_ULAResult == 8'h10 && dut_FlagZ == 1'b0) else $fatal(1,"Test Case 4 failed");

    // Test Case 5: Subtraction of SrcA == SrcB
    mocked_SrcA = 8'h60;
    mocked_SrcB = 8'h60;
    mocked_IsLogic = 1'b0;
    mocked_ULAControl = 3'b001; // Subtracts
    #10;
    assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal(1,"Test Case 5 failed");

    // Test Case 6: Subtraction of SrcA < SrcB
    mocked_SrcA = 8'h50;
    mocked_SrcB = 8'h60;
    mocked_IsLogic = 1'b0;
    mocked_ULAControl = 3'b001; // Subtracts
    #10;
    assert(dut_ULAResult == 8'hF0 && dut_FlagZ == 1'b0) else $fatal(1,"Test Case 6 failed");

    // Test Case 7: Multiplication of SrcA by SrcB
    mocked_SrcA = 8'hA;
    mocked_SrcB = 8'hB;
    mocked_IsLogic = 1'b0;
    mocked_ULAControl = 3'b010; // Multiplies
    #10;
    assert(dut_ULAResult == 8'h6E && dut_FlagZ == 1'b0) else $fatal(1,"Test Case 7 failed");

    // Test Case 8: Multiplication of SrcA by SrcB
    mocked_SrcA = 8'hF;
    mocked_SrcB = 8'h0;
    mocked_IsLogic = 1'b0;
    mocked_ULAControl = 3'b010; // Multiplies
    #10;
    assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal(1,"Test Case 8 failed");

    // Test Case 9: Division of SrcA by SrcB
    mocked_SrcA = 8'hFE;
    mocked_SrcB = 8'h2;
    mocked_IsLogic = 1'b0;
    mocked_ULAControl = 3'b011; // Divides
    #10;
    assert(dut_ULAResult == 8'h7F && dut_FlagZ == 1'b0) else $fatal(1,"Test Case 9 failed");

    // Test Case 10: Division of SrcA by SrcB
    mocked_SrcA = 8'h0;
    mocked_SrcB = 8'hF;
    mocked_IsLogic = 1'b0;
    mocked_ULAControl = 3'b011; // Divides
    #10;
    assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal(1,"Test Case 10 failed");

    // Test Case 11: Subtraction of SrcA - 1
    mocked_SrcA = 8'hAA;
    mocked_SrcB = 8'hF;
    mocked_IsLogic = 1'b0;
    mocked_ULAControl = 3'b100; // SrcA - 1
    #10;
    assert(dut_ULAResult == 8'hA9 && dut_FlagZ == 1'b0) else $fatal(1,"Test Case 11 failed");

    // Test Case 12: Subtraction of SrcA - 1
    mocked_SrcA = 8'h1;
    mocked_SrcB = 8'hF;
    mocked_IsLogic = 1'b0;
    mocked_ULAControl = 3'b100; // SrcA - 1
    #10;
    assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal(1,"Test Case 12 failed");

    // Test Case 13: Subtraction of SrcB - 1
    mocked_SrcA = 8'hAA;
    mocked_SrcB = 8'hFF;
    mocked_IsLogic = 1'b0;
    mocked_ULAControl = 3'b101; // SrcB - 1
    #10;
    assert(dut_ULAResult == 8'hFE && dut_FlagZ == 1'b0) else $fatal(1,"Test Case 13 failed");

    // Test Case 14: Subtraction of SrcB - 1
    mocked_SrcA = 8'hAA;
    mocked_SrcB = 8'h00;
    mocked_IsLogic = 1'b0;
    mocked_ULAControl = 3'b101; // SrcB - 1
    #10;
    assert(dut_ULAResult == 8'hFF && dut_FlagZ == 1'b0) else $fatal(1,"Test Case 14 failed");

    // Test Case 15: Sum of SrcA + ~SrcB
    mocked_SrcA = 8'hA0;
    mocked_SrcB = 8'hF0;
    mocked_IsLogic = 1'b0;
    mocked_ULAControl = 3'b110; // SrcA + ~SrcB
    #10;
    assert(dut_ULAResult == 8'hAF && dut_FlagZ == 1'b0) else $fatal(1,"Test Case 15 failed");

    // Test Case 16: Sum of ~SrcA + SrcB
    mocked_SrcA = 8'hF0;
    mocked_SrcB = 8'hB0;
    mocked_IsLogic = 1'b0;
    mocked_ULAControl = 3'b111; // ~SrcA + SrcB
    #10;
    assert(dut_ULAResult == 8'hBF && dut_FlagZ == 1'b0) else $fatal(1,"Test Case 16 failed");


    // ####################### LOGIC OPERATIONS #######################

    
    // Test 17: NOTing SrcA
    mocked_SrcA = 8'hFF;
    mocked_SrcB = 8'hBB;
    mocked_IsLogic = 1'b1;
    mocked_ULAControl = 3'b000; // NOTs
    #10;
    assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal(1,"Test 17 failed");

    // Test 18: NORing SrcA and SrcB
    mocked_SrcA = 8'hAA;
    mocked_SrcB = 8'hEE;
    mocked_IsLogic = 1'b1;
    mocked_ULAControl = 3'b001; // NORs
    #10;
    assert(dut_ULAResult == 8'h11 && dut_FlagZ == 1'b0) else $fatal(1,"Test 18 failed");

    // Test 19: NORing SrcA and SrcB
    mocked_SrcA = 8'h00;
    mocked_SrcB = 8'h00;
    mocked_IsLogic = 1'b1;
    mocked_ULAControl = 3'b001; // NORs
    #10;
    assert(dut_ULAResult == 8'hFF && dut_FlagZ == 1'b0) else $fatal(1,"Test 19 failed");

    // Test 20: NANDing SrcA and SrcB
    mocked_SrcA = 8'hAA;
    mocked_SrcB = 8'hEE;
    mocked_IsLogic = 1'b1;
    mocked_ULAControl = 3'b010; // NANDs
    #10;
    assert(dut_ULAResult == 8'h55 && dut_FlagZ == 1'b0) else $fatal(1,"Test 20 failed");

    // Test 21: NANDing SrcA and SrcB
    mocked_SrcA = 8'hFF;
    mocked_SrcB = 8'hFF;
    mocked_IsLogic = 1'b1;
    mocked_ULAControl = 3'b010; // NANDs
    #10;
    assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal(1,"Test 21 failed");

    // Test 22: XNORing SrcA and SrcB
    mocked_SrcA = 8'hAA;
    mocked_SrcB = 8'h55;
    mocked_IsLogic = 1'b1;
    mocked_ULAControl = 3'b011; // XNORs
    #10;
    assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal(1,"Test 22 failed");

    // Test 23: XNORing SrcA and SrcB
    mocked_SrcA = 8'hFE;
    mocked_SrcB = 8'h15;
    mocked_IsLogic = 1'b1;
    mocked_ULAControl = 3'b011; // XNORs
    #10;
    assert(dut_ULAResult == 8'h14 && dut_FlagZ == 1'b0) else $fatal(1,"Test 23 failed");

    // Test Case 24: ANDing SrcA and SrcB with SrcB == 0
    mocked_SrcA = 8'hAA;
    mocked_SrcB = 8'h0;
    mocked_IsLogic = 1'b1;
    mocked_ULAControl = 3'b100; // ANDs
    #10;
    assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal(1,"Test Case 24 failed");

    // Test Case 25: ANDing SrcA and SrcB
    mocked_SrcA = 8'hAA;
    mocked_SrcB = 8'hBB;
    mocked_IsLogic = 1'b1;
    mocked_ULAControl = 3'b100; // ANDs
    #10;
    assert(dut_ULAResult == 8'hAA && dut_FlagZ == 1'b0) else $fatal(1,"Test Case 25 failed");

    // Test Case 26: ORing SrcA and SrcB
    mocked_SrcA = 8'hAA;
    mocked_SrcB = 8'hBB;
    mocked_IsLogic = 1'b1;
    mocked_ULAControl = 3'b101; // ORs
    #10;
    assert(dut_ULAResult == 8'hBB && dut_FlagZ == 1'b0) else $fatal(1,"Test Case 26 failed");

    // Test Case 27: ORing SrcA and SrcB with SrcB == 0
    mocked_SrcA = 8'hAA;
    mocked_SrcB = 8'h0;
    mocked_IsLogic = 1'b1;
    mocked_ULAControl = 3'b101; // ORs
    #10;
    assert(dut_ULAResult == 8'hAA && dut_FlagZ == 1'b0) else $fatal(1,"Test Case 27 failed");

    // Test 28: XORing SrcA and SrcB
    mocked_SrcA = 8'hAA;
    mocked_SrcB = 8'h55;
    mocked_IsLogic = 1'b1;
    mocked_ULAControl = 3'b110; // XORs
    #10;
    assert(dut_ULAResult == 8'hFF && dut_FlagZ == 1'b0) else $fatal(1,"Test 28 failed");

    // Test 29: XORing SrcA and SrcB
    mocked_SrcA = 8'hFE;
    mocked_SrcB = 8'h15;
    mocked_IsLogic = 1'b1;
    mocked_ULAControl = 3'b110; // XORs
    #10;
    assert(dut_ULAResult == 8'hEB && dut_FlagZ == 1'b0) else $fatal(1,"Test 29 failed");

    // Test 30: NOTin SrcB
    mocked_SrcA = 8'hFE;
    mocked_SrcB = 8'hAA;
    mocked_IsLogic = 1'b1;
    mocked_ULAControl = 3'b111; // NOTs SrcB
    #10;
    assert(dut_ULAResult == 8'h55 && dut_FlagZ == 1'b0) else $fatal(1,"Test 30 failed");


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