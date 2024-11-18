`timescale 1ns/1ns
module arbitro_tb();
    logic [3:0] req_in, grant_out;
    logic [1:0] grant_num_out;
    logic available_out;
  
    arbitro dut_arbitro(.req(req_in), .grant(grant_out), .grant_num(grant_num_out), .available(available_out));

    initial
        begin
            $dumpfile("arbitro_tb.vcd");
            $dumpvars(0, dut_arbitro);
            #10;
            req_in = 4'b0000;
            assert (grant_out == 4'b0000 && grant_num_out == 2'b00 && available_out == 1'b1) 
            else $error("Test 1 failed");
            
            req_in = 4'b0001; //Trying to set device 0001 with no device set.
            #10;
            assert (grant_out == 4'b0001 && grant_num_out == 2'b00 && available_out == 1'b0) 
            else $error("Test 2 failed");
            
            req_in = 4'b0010;//Trying to set device 0010 when device 0001 already set. 0010 has lower priority than 0001.
            #10;
            assert (grant_out == 4'b0001 && grant_num_out == 2'b00 && available_out == 1'b0) 
            else $error("Test 3 failed");

            req_in = 4'b0000; //Unsetting any devices set.
            #10;
            assert (grant_out == 4'b0000 && grant_num_out == 2'b00 && available_out == 1'b1) 
            else $error("Test 4 failed");

            req_in = 4'b0010; //Trying to set device 0010 with no device set.
            #10;
            assert (grant_out == 4'b0010 && grant_num_out == 2'b01 && available_out == 1'b0) 
            else $error("Test 5 failed");

            req_in = 4'b0100;//Trying to set device 0100 when device 0010 already set. 0100 has lower priority than 0010.
            #10;
            assert (grant_out == 4'b0010 && grant_num_out == 2'b01 && available_out == 1'b0) 
            else $error("Test 6 failed");

            req_in = 4'b0000; //Unsetting any devices set.
            #10;
            assert (grant_out == 4'b0000 && grant_num_out == 2'b00 && available_out == 1'b1) 
            else $error("Test 7 failed");

            req_in = 4'b0100; //Trying to set device 0010 with no device set.
            #10;
            assert (grant_out == 4'b0100 && grant_num_out == 2'b10 && available_out == 1'b0) 
            else $error("Test 8 failed");


            req_in = 4'b1000;//Trying to set device 1000 when device 0100 already set. 1000 has lower priority than 0100.
            #10;
            assert (grant_out == 4'b0100 && grant_num_out == 2'b10 && available_out == 1'b0) 
            else $error("Test 9 failed");

            req_in = 4'b0000; //Unsetting any devices set.
            #10;
            assert (grant_out == 4'b0000 && grant_num_out == 2'b00 && available_out == 1'b1) 
            else $error("Test 10 failed");

            req_in = 4'b1000; //Trying to set device 1000 with no device set.
            #10;
            assert (grant_out == 4'b1000 && grant_num_out == 2'b11 && available_out == 1'b0) 
            else $error("Test 11 failed");

            req_in = 4'b0001;//Trying to set device 0001 when device 1000 already set. 0001 has higher priority over 1000.
            #10;
            assert (grant_out == 4'b0001 & grant_num_out == 2'b00 & available_out == 1'b0) 
            else $error("Test 12 failed");


            $finish;
        
        end
  
    initial
        begin
            $display("                Tempo   Entrada Arbitro                  Saídas");
            $display("                            req_in       grant_out   grant_num_out  available_out");
            $display("                ====      ==========   ===========================================");
            // $monitor($time,"        %b              %b   %b   %b", req_in, grant_out, grant_num_out, available_out);
        
        end
    always @(req_in or grant_out or grant_num_out or available_out) 
        begin
            $display("%t        %b             %b           %b          %b", $time, req_in, grant_out, grant_num_out, available_out);
        end
  
endmodule
