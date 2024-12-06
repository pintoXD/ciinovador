/* verilator lint_off IMPLICIT */
/* verilator lint_off DECLFILENAME */
`resetall
`celldefine
`suppress_faults
`enable_portfaults
`expand_vectornets
`timescale 1ns/10ps

module SPRAM256X8_tmax (QI, D, ADR, CLK, possRead, cleanWrite, Q_OK);

output [7:0]	QI;
input  [7:0]	D;
input  [7:0]	ADR;
input		CLK, possRead, cleanWrite, Q_OK;

parameter ram_init_file = "";

reg [7:0]  QR; // Data Output Latch

// -- RAM Storage Declaration --
reg [7:0]  RAM_matrix [0:255];

integer i;
//always @(posedge CLK) 
/*initial	// inicializar com zeros é um comportamento não físico
begin
    for(i=0; i<=255; i=i+1)
      RAM_matrix[i] <= 1'b0;
end*/

bufif1	g0 (QI[0], QR[0], Q_OK),	g1 (QI[1], QR[1], Q_OK),	g2 (QI[2], QR[2], Q_OK),
	g3 (QI[3], QR[3], Q_OK),	g4 (QI[4], QR[4], Q_OK),	g5 (QI[5], QR[5], Q_OK),
	g6 (QI[6], QR[6], Q_OK),	g7 (QI[7], QR[7], Q_OK);

`ifdef     ATPG_RUN
`else
reg [7:0]  D_X;		// unititialized data
integer addr_cnt;
initial
begin
	if(ram_init_file !== "") $readmemh(ram_init_file, RAM_matrix); // readmemb 
end
`endif //  ATPG_RUN

always @(posedge CLK) if (possRead) 
begin
	QR[7:0] = RAM_matrix[ADR];
end
`ifdef     ATPG_RUN
always @(posedge CLK) if (cleanWrite)
begin
	RAM_matrix[ADR] = D[7:0];
end
`else
else if (cleanWrite)
begin
	RAM_matrix[ADR] = D[7:0];
// inconsistent address:
	if (^ADR === 1'bx)
	begin
		$display ("\n%t: ERROR: %m : RAM write with inconsistent address", $realtime);
      		for (addr_cnt = 0; addr_cnt < 256; addr_cnt = addr_cnt +1)
        	begin
			RAM_matrix[addr_cnt] = D_X[7:0];
		end	
      	end 
  	if (ADR >= 256)
      	begin
      		$display ("\n%t: WARNING: %m : RAM write to non-existent address(hex) %h", $realtime, ADR);
      	end 
end
else if (cleanWrite === 1'bx) RAM_matrix[ADR] = 8'hX;
`endif //  ATPG_RUN



endmodule // SPRAM256X8_tmax

primitive SPRAM256X8_DFF  (Q, D, C, RN, SN, NOTIFY);

    output Q;
    input  D, C, RN, SN, NOTIFY;
    reg    Q;

// FUNCTION : POSITIVE EDGE TRIGGERED D FLIP-FLOP WITH 
//            ASYNCHRONOUS ACTIVE LOW SET AND CLEAR.

    table

//  D    C    RN    SN   NTFY : Qt  : Qt+1
// ---- ---- ----- ----- ---- : --- : ----
// data clk  rst_n set_n ntfy : Qi  : Q_out           
// ---- ---- ----- ----- ---- : --- : ----

    *	 b    1     1	  ?   :  ?  :  -  ; // data changes, clk stable
    ?	 0    1     1	  ?   :  ?  :  -  ; // clocks off


    1  (0x)   1     ?	  ?   :  1  :  1  ; // possible clk of D=1, but Q=1
    0  (0x)   ?     1	  ?   :  0  :  0  ; // possible clk of D=0, but Q=0

    ?	 ?    1     0	  ?   :  ?  :  1  ; // async set
    ?	 ?    0     1	  ?   :  ?  :  0  ; // async reset

    0  (01)   ?     1	  ?   :  ?  :  0  ; // clocking D=0
    1  (01)   1     ?	  ?   :  ?  :  1  ; // clocking D=1

   					    // reduced pessimism: 
    ?    ?  (?1)    1     ?   :  ?  :  -  ; // ignore the edges on rst_n
    ?    ?    1   (?1)    ?   :  ?  :  -  ; // ignore the edges on set_n

    1  (x1)   1     ?     ?   :  1  :  1  ; // potential pos_edge clk, potential set_n, but D=1 && Qi=1
    0  (x1)   ?     1     ?   :  0  :  0  ; // potential pos_edge clk, potential rst_n, but D=0 && Qi=0

    1  (1x)   1     ?     ?   :  1  :  1  ; // to_x_edge clk, but D=1 && Qi=1
    0  (1x)   ?     1     ?   :  0  :  0  ; // to_x_edge clk, but D=0 && Qi=0

`ifdef    ATPG_RUN

    ?	 *    1     0	  ?   :  ?  :  1  ; // clk while async set	      // ATPG_RUN
    ?	 *    0     1	  ?   :  ?  :  0  ; // clk while async reset	      // ATPG_RUN
    ?	 ?    1     x	  ?   :  1  :  1  ; //   set=X, but Q=1		      // ATPG_RUN
    ?    ?    x     1	  ?   :  0  :  0  ; // reset=X, but Q=0		      // ATPG_RUN

`else
   					    // reduced pessimism: 
    1	 ?    1     x	  ?   :  1  :  1  ; //   set=X, but Q=1    	      // Vlg
    0	 b    1   (0x)	  ?   :  1  :  1  ; //   set=X, D=0, but Q=1   	      // Vlg
    0	 b    1   (1x)	  ?   :  1  :  1  ; //   set=X, D=0, but Q=1   	      // Vlg
   (??)	 b    1     ?	  ?   :  1  :  1  ; //   set=X, D=egdes, but Q=1      // Vlg
    ?  (?0)   1     x	  ?   :  1  :  1  ; //   set=X, neg_edge clk, but Q=1 // Vlg

    0    ?    x     1	  ?   :  0  :  0  ; // reset=X, but Q=0    	      // Vlg
    1    b  (0x)    1	  ?   :  0  :  0  ; // reset=X, D=1, but Q=0   	      // Vlg
    1    b  (1x)    1	  ?   :  0  :  0  ; // reset=X, D=1, but Q=0   	      // Vlg
   (??)  b    ?     1	  ?   :  0  :  0  ; // reset=X, D=egdes, but Q=0      // Vlg
    ?  (?0)   x     1	  ?   :  0  :  0  ; // reset=X, neg_edge clk, but Q=0 // Vlg
 
`endif // ATPG_RUN

    endtable

endprimitive

module SPRAM256X8 (Q, D, ADR, CLK, ENB, WEB, OEB, RTEST, ramvdd, ramgnd);

output [7:0]	Q;		// RAM data output
output		RTEST;		// RAM reset test output

input  [7:0]	D;		// RAM data input bus
input  [7:0]	ADR;		// RAM address bus
input		CLK; 		// RAM clock
input		ENB;		// RAM enable
input		WEB;		// RAM  write enable, 0-active
input		OEB;		// RAM  output enable, 0-active
input 		ramvdd, 	// RAM power
		ramgnd;		// RAM ground

parameter ram_init_file = "";

wire   [7:0]   QI;
wire   [7:0]   D_;
wire   [7:0]	ADR_;

reg NOTIFY_REG, NOTIFY_ADR, NOTIFY_WEB;

// -- specify buffers: --
buf	g0 (CLK_, CLK),
	g1 (ENB_, ENB),
	g2 (WEB_, WEB),
	g3 (OEB_, OEB);
buf	g4 (ADR_[0], ADR[0]),	g5 (ADR_[1], ADR[1]),	g6 (ADR_[2], ADR[2]),
	g7 (ADR_[3], ADR[3]),	g8 (ADR_[4], ADR[4]),	g9 (ADR_[5], ADR[5]),
	g10 (ADR_[6], ADR[6]),	g11 (ADR_[7], ADR[7]),
	g12 (D_[0], D[0]),	g13 (D_[1], D[1]),	g14 (D_[2], D[2]),
	g15 (D_[3], D[3]),	g16 (D_[4], D[4]),	g17 (D_[5], D[5]),
	g18 (D_[6], D[6]),	g19 (D_[7], D[7]);
bufif0	g20 (Q[0], QI[0], OEB_),	g21 (Q[1], QI[1], OEB_),	g22 (Q[2], QI[2], OEB_),
	g23 (Q[3], QI[3], OEB_),	g24 (Q[4], QI[4], OEB_),	g25 (Q[5], QI[5], OEB_),
	g26 (Q[6], QI[6], OEB_),	g27 (Q[7], QI[7], OEB_);
// logic:
not	g28 (ramgndi, ramgnd);
and	g29 (supply_OK, ramvdd, ramgndi);
`ifdef ATPG_RUN
buf	g30 (RTEST, supply_OK);
`else
	reg RTEST_, rt;
and	g30 (RTEST, supply_OK, RTEST_);
`endif
nor     g31  (cleanWrite_, ENB_, WEB_);
`ifdef ATPG_RUN 
buf	g32 (cleanWrite, cleanWrite_);
`else
and	g32 (cleanWrite, cleanWrite_, rt);
`endif
not     g33  (enableMem, ENB_);
and     g34  (possRead, enableMem, WEB_);
not	g35 (cleanWriteN, cleanWrite);
and	g36 (RW, possRead, cleanWriteN);
// -- Behavioral model: --

SPRAM256X8_tmax #(ram_init_file) sub1 (.QI(QI[7:0]), .D(D_[7:0]), .ADR(ADR_[7:0]), .CLK(CLK_), .possRead(possRead), .cleanWrite(cleanWrite), .Q_OK(T_OK_Q));

// consistency checks:
SPRAM256X8_DFF CHK_ADR (T_OK_ADR, supply_OK, CLK_, 1'b1, 1'b1, NOTIFY_ADR);

SPRAM256X8_DFF CHK_Q (T_OK_QI, supply_OK, CLK_, 1'b1, 1'b1, NOTIFY_REG);

SPRAM256X8_DFF CHK_WEB (RWL, RW, CLK_, 1'b1, 1'b1, NOTIFY_WEB);
and g37 (TOK, T_OK_QI, T_OK_ADR, RWL);
not g38 (NRWL, RWL);
or g39 (T_OK_Q, NRWL, TOK);

// -- timing section: --

specify
      specparam 
		size	    = 146775.965,
		MaxDrive$Q  = 0.4,	MaxDrive$RTEST = 0.2,
		DrainCap$Q  = 0.001,	DrainCap$RTEST = 0.001,
		GateCap$D   = 0.015,	GateCap$CLK    = 0.189,
		GateCap$ADR = 0.021,	GateCap$WEB    = 0.009,
		GateCap$ENB = 0.07,	GateCap$OEB    = 0.018,
		GateCap$Q   = 0.12,	CellPower      = 324.3;

      specparam
		ADR_SETUP_TIME	= 1.032,
                ADR_HOLD_TIME	= 0.282,
		ENB_SETUP_TIME	= 1.032,
                ENB_HOLD_TIME	= 0.405,
		WEB_SETUP_TIME	= 0.538,
                WEB_HOLD_TIME	= 0.271,
		CLK_LOW_TIME	= 1.117,
		CLK_HIGH_TIME	= 1.049,
		CYCLE_TIME	= 3.051,
		D_HOLD_TIME	= 0.463,
                ACCESS_TIME	= 3.932,
		D_SETUP_TIME	= 0.34,
                LOW_Z_TIME	= 0.748,
                HIGH_Z_TIME	= 0.813;
		
// path delays:
	(posedge CLK => (Q[0] : 1'b0)) = (ACCESS_TIME, ACCESS_TIME);
	(posedge CLK => (Q[1] : 1'b0)) = (ACCESS_TIME, ACCESS_TIME);
	(posedge CLK => (Q[2] : 1'b0)) = (ACCESS_TIME, ACCESS_TIME);
	(posedge CLK => (Q[3] : 1'b0)) = (ACCESS_TIME, ACCESS_TIME);
	(posedge CLK => (Q[4] : 1'b0)) = (ACCESS_TIME, ACCESS_TIME);
	(posedge CLK => (Q[5] : 1'b0)) = (ACCESS_TIME, ACCESS_TIME);
	(posedge CLK => (Q[6] : 1'b0)) = (ACCESS_TIME, ACCESS_TIME);
	(posedge CLK => (Q[7] : 1'b0)) = (ACCESS_TIME, ACCESS_TIME);

	(OEB => Q[0]) = (LOW_Z_TIME, LOW_Z_TIME, HIGH_Z_TIME);
	(OEB => Q[1]) = (LOW_Z_TIME, LOW_Z_TIME, HIGH_Z_TIME);
	(OEB => Q[2]) = (LOW_Z_TIME, LOW_Z_TIME, HIGH_Z_TIME);
	(OEB => Q[3]) = (LOW_Z_TIME, LOW_Z_TIME, HIGH_Z_TIME);
	(OEB => Q[4]) = (LOW_Z_TIME, LOW_Z_TIME, HIGH_Z_TIME);
	(OEB => Q[5]) = (LOW_Z_TIME, LOW_Z_TIME, HIGH_Z_TIME);
	(OEB => Q[6]) = (LOW_Z_TIME, LOW_Z_TIME, HIGH_Z_TIME);
	(OEB => Q[7]) = (LOW_Z_TIME, LOW_Z_TIME, HIGH_Z_TIME);

	$setup (posedge ADR[0], posedge CLK &&& enableMem, ADR_SETUP_TIME, NOTIFY_ADR);
	$setup (negedge ADR[0], posedge CLK &&& enableMem, ADR_SETUP_TIME, NOTIFY_ADR);
	$setup (posedge ADR[1], posedge CLK &&& enableMem, ADR_SETUP_TIME, NOTIFY_ADR);
	$setup (negedge ADR[1], posedge CLK &&& enableMem, ADR_SETUP_TIME, NOTIFY_ADR);
	$setup (posedge ADR[2], posedge CLK &&& enableMem, ADR_SETUP_TIME, NOTIFY_ADR);
	$setup (negedge ADR[2], posedge CLK &&& enableMem, ADR_SETUP_TIME, NOTIFY_ADR);
	$setup (posedge ADR[3], posedge CLK &&& enableMem, ADR_SETUP_TIME, NOTIFY_ADR);
	$setup (negedge ADR[3], posedge CLK &&& enableMem, ADR_SETUP_TIME, NOTIFY_ADR);
	$setup (posedge ADR[4], posedge CLK &&& enableMem, ADR_SETUP_TIME, NOTIFY_ADR);
	$setup (negedge ADR[4], posedge CLK &&& enableMem, ADR_SETUP_TIME, NOTIFY_ADR);
	$setup (posedge ADR[5], posedge CLK &&& enableMem, ADR_SETUP_TIME, NOTIFY_ADR);
	$setup (negedge ADR[5], posedge CLK &&& enableMem, ADR_SETUP_TIME, NOTIFY_ADR);
	$setup (posedge ADR[6], posedge CLK &&& enableMem, ADR_SETUP_TIME, NOTIFY_ADR);
	$setup (negedge ADR[6], posedge CLK &&& enableMem, ADR_SETUP_TIME, NOTIFY_ADR);
	$setup (posedge ADR[7], posedge CLK &&& enableMem, ADR_SETUP_TIME, NOTIFY_ADR);
	$setup (negedge ADR[7], posedge CLK &&& enableMem, ADR_SETUP_TIME, NOTIFY_ADR);

	$hold  (posedge CLK &&& enableMem, posedge ADR[0], ADR_HOLD_TIME, NOTIFY_ADR);
	$hold  (posedge CLK &&& enableMem, negedge ADR[0], ADR_HOLD_TIME, NOTIFY_ADR);
	$hold  (posedge CLK &&& enableMem, posedge ADR[1], ADR_HOLD_TIME, NOTIFY_ADR);
	$hold  (posedge CLK &&& enableMem, negedge ADR[1], ADR_HOLD_TIME, NOTIFY_ADR);
	$hold  (posedge CLK &&& enableMem, posedge ADR[2], ADR_HOLD_TIME, NOTIFY_ADR);
	$hold  (posedge CLK &&& enableMem, negedge ADR[2], ADR_HOLD_TIME, NOTIFY_ADR);
	$hold  (posedge CLK &&& enableMem, posedge ADR[3], ADR_HOLD_TIME, NOTIFY_ADR);
	$hold  (posedge CLK &&& enableMem, negedge ADR[3], ADR_HOLD_TIME, NOTIFY_ADR);
	$hold  (posedge CLK &&& enableMem, posedge ADR[4], ADR_HOLD_TIME, NOTIFY_ADR);
	$hold  (posedge CLK &&& enableMem, negedge ADR[4], ADR_HOLD_TIME, NOTIFY_ADR);
	$hold  (posedge CLK &&& enableMem, posedge ADR[5], ADR_HOLD_TIME, NOTIFY_ADR);
	$hold  (posedge CLK &&& enableMem, negedge ADR[5], ADR_HOLD_TIME, NOTIFY_ADR);
	$hold  (posedge CLK &&& enableMem, posedge ADR[6], ADR_HOLD_TIME, NOTIFY_ADR);
	$hold  (posedge CLK &&& enableMem, negedge ADR[6], ADR_HOLD_TIME, NOTIFY_ADR);
	$hold  (posedge CLK &&& enableMem, posedge ADR[7], ADR_HOLD_TIME, NOTIFY_ADR);
	$hold  (posedge CLK &&& enableMem, negedge ADR[7], ADR_HOLD_TIME, NOTIFY_ADR);

	$setup (posedge D[0], posedge CLK &&& cleanWrite_, D_SETUP_TIME);
	$setup (negedge D[0], posedge CLK &&& cleanWrite_, D_SETUP_TIME);
	$setup (posedge D[1], posedge CLK &&& cleanWrite_, D_SETUP_TIME);
	$setup (negedge D[1], posedge CLK &&& cleanWrite_, D_SETUP_TIME);
	$setup (posedge D[2], posedge CLK &&& cleanWrite_, D_SETUP_TIME);
	$setup (negedge D[2], posedge CLK &&& cleanWrite_, D_SETUP_TIME);
	$setup (posedge D[3], posedge CLK &&& cleanWrite_, D_SETUP_TIME);
	$setup (negedge D[3], posedge CLK &&& cleanWrite_, D_SETUP_TIME);
	$setup (posedge D[4], posedge CLK &&& cleanWrite_, D_SETUP_TIME);
	$setup (negedge D[4], posedge CLK &&& cleanWrite_, D_SETUP_TIME);
	$setup (posedge D[5], posedge CLK &&& cleanWrite_, D_SETUP_TIME);
	$setup (negedge D[5], posedge CLK &&& cleanWrite_, D_SETUP_TIME);
	$setup (posedge D[6], posedge CLK &&& cleanWrite_, D_SETUP_TIME);
	$setup (negedge D[6], posedge CLK &&& cleanWrite_, D_SETUP_TIME);
	$setup (posedge D[7], posedge CLK &&& cleanWrite_, D_SETUP_TIME);
	$setup (negedge D[7], posedge CLK &&& cleanWrite_, D_SETUP_TIME);

	$hold  (posedge CLK &&& cleanWrite_, posedge D[0], D_HOLD_TIME);
	$hold  (posedge CLK &&& cleanWrite_, negedge D[0], D_HOLD_TIME);
	$hold  (posedge CLK &&& cleanWrite_, posedge D[1], D_HOLD_TIME);
	$hold  (posedge CLK &&& cleanWrite_, negedge D[1], D_HOLD_TIME);
	$hold  (posedge CLK &&& cleanWrite_, posedge D[2], D_HOLD_TIME);
	$hold  (posedge CLK &&& cleanWrite_, negedge D[2], D_HOLD_TIME);
	$hold  (posedge CLK &&& cleanWrite_, posedge D[3], D_HOLD_TIME);
	$hold  (posedge CLK &&& cleanWrite_, negedge D[3], D_HOLD_TIME);
	$hold  (posedge CLK &&& cleanWrite_, posedge D[4], D_HOLD_TIME);
	$hold  (posedge CLK &&& cleanWrite_, negedge D[4], D_HOLD_TIME);
	$hold  (posedge CLK &&& cleanWrite_, posedge D[5], D_HOLD_TIME);
	$hold  (posedge CLK &&& cleanWrite_, negedge D[5], D_HOLD_TIME);
	$hold  (posedge CLK &&& cleanWrite_, posedge D[6], D_HOLD_TIME);
	$hold  (posedge CLK &&& cleanWrite_, negedge D[6], D_HOLD_TIME);
	$hold  (posedge CLK &&& cleanWrite_, posedge D[7], D_HOLD_TIME);
	$hold  (posedge CLK &&& cleanWrite_, negedge D[7], D_HOLD_TIME);

	$setup (posedge ENB, posedge CLK, ENB_SETUP_TIME, NOTIFY_REG);
	$setup (negedge ENB, posedge CLK, ENB_SETUP_TIME, NOTIFY_REG);

	$hold  (posedge CLK, posedge ENB, ENB_HOLD_TIME, NOTIFY_REG);
	$hold  (posedge CLK, negedge ENB, ENB_HOLD_TIME, NOTIFY_REG);
	
	$setup (posedge WEB, posedge CLK &&& enableMem, WEB_SETUP_TIME, NOTIFY_WEB);
	$setup (negedge WEB, posedge CLK &&& enableMem, WEB_SETUP_TIME, NOTIFY_WEB);

	$hold  (posedge CLK &&& enableMem, posedge WEB, WEB_HOLD_TIME, NOTIFY_WEB);
	$hold  (posedge CLK &&& enableMem, negedge WEB, WEB_HOLD_TIME, NOTIFY_WEB);

	$width (posedge CLK &&& enableMem, CLK_HIGH_TIME, 0, NOTIFY_REG);
	$width (negedge CLK &&& enableMem, CLK_LOW_TIME, 0, NOTIFY_REG);
	$period (posedge CLK &&& enableMem, CYCLE_TIME, NOTIFY_REG);
	$period (negedge CLK &&& enableMem, CYCLE_TIME, NOTIFY_REG);

endspecify
	
`ifdef ATPG_RUN
`else
reg last_CLK_;
initial begin
	$timeformat (-9, 2, " ns", 0);
	RTEST_ = 1'b0;
	rt = 1'b0;
	#1e3 ;		// no RAM activity permitted for first 1usec. of sim.
	rt = 1'b1;
	@(posedge CLK_);
	begin
	end
	forever
	fork
	    begin: autoReset		// autoReset retriggerable mono
		#1e2 RTEST_ = 1'bx;
		#9e3 RTEST_ = 1'b0;
	    end
	    @(posedge CLK_)  disable autoReset;	// restart autoReset timer
	join	
	end
always @(CLK_) 	last_CLK_ <= CLK_;
always @(posedge CLK_)
	begin
	if (rt === 1'b1)
	begin
	  RTEST_ = 1'b1;
	  if (ENB_ === 1'bx)  $display
		    ("\n%t: ERROR: %m : ENB is at %b at CLK rising edge:\n", $realtime, ENB);
		if (enableMem === 1'b1)
			begin
				if (WEB_ === 1'bx) $display
		    			("\n%t: ERROR: %m : WEB is at %b at CLK rising edge:\n", $realtime, WEB);
				if (cleanWrite  &&  (^D_) === 1'bx)  $display
				    	("\n%t: WARNING: %m : Write to RAM whilst D contains 'x's:\n\t\t\t\t D: %b:\n", $realtime, D);
				if((CLK_ == 1'b1 && last_CLK_ === 1'bx) || (CLK_ === 1'bx && last_CLK_ == 1'b0))
					if ($realtime>0.00) $display ("\n%t: ERROR: %m : bad CLK rising edge:\n", $realtime);
			end
	 end
	else	
	 begin
          if (ENB_ === 1'b0 ) $display ("\n%t: ERROR: %m: RAM enabled during initial 1000ns: RAM content UNDEFINED\n", $realtime); 
	 end
	end
`endif
endmodule // SPRAM256X8

`nosuppress_faults
`disable_portfaults

`endcelldefine
