`timescale 1ns/1ps

module muxULAsrc_tb();

    logic select_src;
    logic [7:0] w_rd2, constante;
    logic [7:0] w_SrcB;

    muxULAsrc DUT(
        .select_src(select_src),
        .w_rd2(w_rd2),
        .constante(constante),
        .w_SrcB(w_SrcB)
    );

    initial begin

        // Test Case 1
        select_src = 0;
        w_rd2 = 8'hFF;
        constante = 8'h00;
        #10
        assert(w_SrcB == 8'hFF) else $error("Test Case 1");


        // Test Case 2
        select_src = 1;
        w_rd2 = 8'hFF;
        constante = 8'h00;
        #10
        assert(w_SrcB == 8'h00) else $error("Test Case 2");

        // Test Case 3
        select_src = 0;
        w_rd2 = 8'hA4;
        constante = 8'h00;
        #10
        assert(w_SrcB == 8'hA4) else $error("Test Case 3");


        // Test Case 4
        select_src = 1;
        w_rd2 = 8'hFF;
        constante = 8'hC0;
        #10
        assert(w_SrcB == 8'hC0) else $error("Test Case 4");

        #10
        $finish;    

    end


endmodule
