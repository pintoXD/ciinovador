`timescale 1ns/1ps
module custom_ula_tb();

logic [7:0] mocked_SrcA, mocked_SrcB;
logic [2:0] mocked_ULAControl;
logic [7:0] dut_ULAResult;
logic dut_FlagZ;


custom_ula DUT(
    .SrcA(mocked_SrcA),
    .SrcB(mocked_SrcB),
    .ULAControl(mocked_ULAControl),
    .ULAResult(dut_ULAResult),
    .FlagZ(dut_FlagZ)
);


initial begin

    // Test Case 1: Addition of 0's
    mocked_SrcA = 8'b0;
    mocked_SrcB = 8'b0;
    mocked_ULAControl = 3'b000; // Adds
    #10;
    assert(dut_ULAResult == 8'b0 && dut_FlagZ == 1'b1) else $fatal("Test Case 1 failed");

    // Test Case 2: Addition of random integer numbers
    mocked_SrcA = 8'h50;
    mocked_SrcB = 8'h60;
    mocked_ULAControl = 3'b000; // Adds
    #10;
    assert(dut_ULAResult == 8'hB0 && dut_FlagZ == 1'b0) else $fatal("Test Case 2 failed");

    // Test Case 3: Addition of random integer numbers
    mocked_SrcA = 8'h7F;
    mocked_SrcB = 8'h2D;
    mocked_ULAControl = 3'b000; // Adds
    #10;
    assert(dut_ULAResult == 8'hAC && dut_FlagZ == 1'b0) else $fatal("Test Case 3 failed");

    // Test Case 4: Subtraction of SrcA > SrcB
    mocked_SrcA = 8'h60;
    mocked_SrcB = 8'h50;
    mocked_ULAControl = 3'b001; // Subtracts
    #10;
    assert(dut_ULAResult == 8'h10 && dut_FlagZ == 1'b0) else $fatal("Test Case 4 failed");

    // Test Case 5: Subtraction of SrcA == SrcB
    mocked_SrcA = 8'h60;
    mocked_SrcB = 8'h60;
    mocked_ULAControl = 3'b001; // Subtracts
    #10;
    assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal("Test Case 5 failed");

    // Test Case 6: Subtraction of SrcA < SrcB
    mocked_SrcA = 8'h50;
    mocked_SrcB = 8'h60;
    mocked_ULAControl = 3'b001; // Subtracts
    #10;
    assert(dut_ULAResult == 8'hF0 && dut_FlagZ == 1'b0) else $fatal("Test Case 6 failed");

    // Test Case 7: Subtraction of SrcA < SrcB
    mocked_SrcA = 8'h50;
    mocked_SrcB = 8'h60;
    mocked_ULAControl = 3'b001; // Subtracts
    #10;
    assert(dut_ULAResult == 8'hF0 && dut_FlagZ == 1'b0) else $fatal("Test Case 7 failed");

    // Test Case 8: ANDing SrcA and SrcB
    mocked_SrcA = 8'hAA;
    mocked_SrcB = 8'hBB;
    mocked_ULAControl = 3'b010; // ANDs
    #10;
    assert(dut_ULAResult == 8'hAA && dut_FlagZ == 1'b0) else $fatal("Test Case 8 failed");

    // Test Case 9: ANDing SrcA and SrcB with SrcB == 0
    mocked_SrcA = 8'hAA;
    mocked_SrcB = 8'h0;
    mocked_ULAControl = 3'b010; // ANDs
    #10;
    assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal("Test Case 9 failed");

    // Test Case 10: ORing SrcA and SrcB
    mocked_SrcA = 8'hAA;
    mocked_SrcB = 8'hBB;
    mocked_ULAControl = 3'b011; // ORs
    #10;
    assert(dut_ULAResult == 8'hBB && dut_FlagZ == 1'b0) else $fatal("Test Case 10 failed");

    // Test Case 11: ORing SrcA and SrcB with SrcB == 0
    mocked_SrcA = 8'hAA;
    mocked_SrcB = 8'h0;
    mocked_ULAControl = 3'b011; // ORs
    #10;
    assert(dut_ULAResult == 8'hAA && dut_FlagZ == 1'b0) else $fatal("Test Case 11 failed");

    // Test Case 12: Checks whether SrcA < SrcB
    mocked_SrcA = 8'hAA;
    mocked_SrcB = 8'hBB;
    mocked_ULAControl = 3'b101; // SLTs
    #10;
    assert(dut_ULAResult == 8'hFF && dut_FlagZ == 1'b0) else $fatal("Test Case 12 failed");

    // Test Case 13: Checks whether SrcA < SrcB
    mocked_SrcA = 8'hBB;
    mocked_SrcB = 8'hAA;
    mocked_ULAControl = 3'b101; // SLTs
    #10;
    assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal("Test Case 13 failed");
    
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