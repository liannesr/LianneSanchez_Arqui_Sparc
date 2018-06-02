/* Module of Control Register for the Control Unit
   Programmed by: Lianne Sánchez Rodríguez
   Phase 3 
   Professor: Nestor Rodríguez 
*/
module controlRegister(output reg MOV, output reg [4:0]state_out, output reg RW, MARld, MDRld, IRld, PCld, nPCld, RFld, FRld, Cin, MA, MB0, MB1, MC, MD0, MD1, ME, MF, MG,MH,MI,OP5, 
				OP4, OP3, OP2, OP1, OP0, N2, N1, N0, Inv, S1, S0, CR4, CR3, CR2, CR1, CR0, input MOVIN, RWIN, MARldIN, MDRldIN, 
				IRldIN, PCldIN, nPCldIN, RFldIN, FRldIN, CinIN, MAIN, MB0IN, MB1IN, MCIN, MD0IN, MD1IN, MEIN, MFIN, MGIN,MHIN,MIIN, OP5IN, OP4IN,
				OP3IN, OP2IN, OP1IN, OP0IN, N2IN, N1IN, N0IN, InvIN, S1IN, S0IN, CR4IN, CR3IN, CR2IN, CR1IN, CR0IN, input[4:0] state, input clk); 
	always @(posedge clk)
		begin
			//	Control Signals for Data Path
			MOV <= MOVIN;
			RW <= RWIN;
			MARld <= MARldIN;
			MDRld <= MARldIN;
			IRld <= IRldIN;
			PCld <= PCldIN;
			nPCld <= nPCldIN;
			RFld <= RFldIN;
			FRld <= FRldIN;
			Cin <= CinIN;
			MA <= MAIN;
			MB0 <= MB0IN;
			MB1 <= MB1IN;
			MC <= MCIN;
			MD0 <= MD0IN;
			MD1 <= MD1IN;
			ME <= MEIN;
			MF <= MFIN;
			MG <= MGIN;
			MH <= MHIN;
			OP5 <= OP5IN;
			OP4 <= OP4IN;
			OP3 <= OP3IN;
			OP2 <= OP2IN;
			OP1 <= OP1IN;
			OP0 <= OP0IN;

			// 	Transition State Signals
			N2 <= N2IN;
			N1 <= N1IN;
			N0 <= N0IN;
			Inv <= InvIN;
			S1 <= S1IN;
			S0 <= S0IN;
			CR4 <= CR4IN;
			CR3 <= CR3IN;
			CR2 <= CR2IN;
			CR1 <= CR1IN;
			CR0 <= CR0IN;

			//state_out <= state;
		end
endmodule 