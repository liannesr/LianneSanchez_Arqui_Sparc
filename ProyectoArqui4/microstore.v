/* Module of Microstore for the Control Unit
   Programmed by: Lianne Sánchez Rodríguez
   Phase 3 
   Professor: Nestor Rodríguez 
*/
module microstore(output reg MOV, RW, MARld, MDRld, IRld, PCld, nPCld, RFld, FRld, Cin, MA, MB0, MB1, MC, MD0, MD1, ME, MF, MG, MH, MI, OP5, 
				OP4, OP3, OP2, OP1, OP0, N2, N1, N0, Inv, S1, S0, CR4, CR3, CR2, CR1, CR0, input [4:0] state, input clk, clr);
	initial
		begin
			//	Control Signals for Data Path
			MOV <= 0;
			RW <= 0;
			MARld <= 0;
			MDRld <= 0;
			IRld <= 0;
			PCld <= 0;
			nPCld <= 0;
			RFld <= 0;
			FRld <= 0;
			MA <= 0;
			MB0 <= 0;
			MB1 <= 0;
			MC <= 0;
			MD0 <= 0;
			MD1 <= 0;
			ME <= 0;
			MF <= 0;
			MG <= 0;
			OP0 <= 0;
			OP1 <= 0;
			OP2 <= 0;
			OP3 <= 0;
			OP4 <= 0;
			OP5 <= 0;
			Cin <= 0;
			// 	Transition State Signals
			N2 <= 0;
			N1 <= 1;
			N0 <= 0;
			Inv <= 0;
			S1 <= 0;
			S0 <= 0;
			CR4 <= 0;
			CR3 <= 0;
			CR2 <= 0;
			CR1 <= 0;
			CR0 <= 0;
		end
	always @(posedge clk)
		begin
			if(clr)
				begin
					//	Control Signals for Data Path
					MOV <= 0;
					RW <= 0;
					MARld <= 0;
					MDRld <= 0;
					IRld <= 0;
					PCld <= 0;
					nPCld <= 0;
					RFld <= 0;
					FRld <= 0;
					MA <= 0;
					MB0 <= 0;
					MB1 <= 0;
					MC <= 0;
					MD0 <= 0;
					MD1 <= 0;
					ME <= 0;
					MF <= 0;
					MG <= 0;
					OP0 <= 0;
					OP1 <= 0;
					OP2 <= 0;
					OP3 <= 0;
					OP4 <= 0;
					OP5 <= 0;
					Cin <= 0;
					// 	Transition State Signals
					N2 <= 0;
					N1 <= 1;
					N0 <= 1;
					Inv <= 0;
					S1 <= 0;
					S0 <= 0;
					CR4 <= 0;
					CR3 <= 0;
					CR2 <= 0;
					CR1 <= 0;
					CR0 <= 0;
				end
		end
	always @(state)
		begin
			//#5;
			MH <= 0;
			MI <= 0;
			case(state)
				5'b00000:
					begin
						//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 1;
						nPCld <= 1;
						RFld <= 0;
						FRld <= 1;
						MA <= 0;
						MB0 <= 0;
						MB1 <= 0;
						MC <= 0;
						MD0 <= 0;
						MD1 <= 1;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 1;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 1;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 0;
					end
				5'b00001:
					begin
						//	Control Signals for Data Path
						MOV <= 0;
						RW <= 1;
						MARld <= 1;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 1;// change
						nPCld <= 0;
						RFld <= 0;
						FRld <= 0;
						MA <= 0;
						MB0 <= 1;
						MB1 <= 1;
						MC <= 0;
						MD0 <= 1;
						MD1 <= 0;
						ME <= 1;
						MF <= 0;
						MG <= 0;
						MH <=1;
						
						OP0 <= 0;//changed op code
						OP1 <= 1;
						OP2 <= 0;
						OP3 <= 1;
						OP4 <= 1;
						OP5 <= 1;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 1;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 1;
					end
				5'b00010:
					begin
												//	Control Signals for Data Path
						MOV <= 1;
						RW <= 1;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;/// 
						nPCld <= 1;
						RFld <= 0;
						FRld <= 0;
						MA <= 0;
						MB0 <= 1;
						MB1 <= 1;
						MC <= 0;
						MD0 <= 1;// cambie eso a 0
						MD1 <= 0;
						ME <= 1;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 1;
						OP2 <= 0;
						OP3 <= 1;
						OP4 <= 1;
						OP5 <= 1;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 1;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 0;
					end
				5'b00011:
					begin
						//#5;						//	Control Signals for Data Path
						MOV <= 1;
						RW <= 1;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 1;
						PCld <= 0;
						nPCld <= 0;
						RFld <= 0;
						FRld <= 0;
						MA <= 0;
						MB0 <= 1;
						MB1 <= 1;
						MC <= 0;
						MD0 <= 1;
						MD1 <= 0;
						ME <= 1;
						MF <= 0;
						MG <= 0;
						MI <=1;
						OP0 <= 0;
						OP1 <= 1;
						OP2 <= 0;
						OP3 <= 1;
						OP4 <= 1;
						OP5 <= 1;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 1;
						N1 <= 0;
						N0 <= 1;
						Inv <= 1;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 1;
						CR0 <= 1;
					end
					
				5'b00100:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 1;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 0;
						RFld <= 0;
						FRld <= 0;
						MA <= 0;
						MB0 <= 0;
						MB1 <= 0;
						MC <= 0;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 0;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 1;
						N1 <= 0;
						N0 <= 0;
						Inv <= 0;
						S1 <= 0;
						S0 <= 1;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 1;
					end
				5'b00101:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 1;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 0;
						RFld <= 1;
						FRld <= 0;
						MA <= 0;
						MB0 <= 0;
						MB1 <= 0;
						MC <= 1;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 0;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 0;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 1;
					end 
				5'b00110:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 0;
						RFld <= 1;
						FRld <= 1;
						MA <= 0;
						MB0 <= 0;
						MB1 <= 0;
						MC <= 1;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 0;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 0;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 1;
					end
				5'b00111:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 0;
						RFld <= 1;
						FRld <= 0;
						MA <= 0;
						MB0 <= 1;
						MB1 <= 0;
						MC <= 1;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 0;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 0;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 1;
					end
				5'b01000:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 0;
						RFld <= 1;
						FRld <= 1;
						MA <= 0;
						MB0 <= 1;
						MB1 <= 0;
						MC <= 1;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 0;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 0;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 1;
					end
				5'b01001:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 0;
						RFld <= 1;
						FRld <= 0;
						MA <= 0;
						MB0 <= 0;
						MB1 <= 0;
						MC <= 0;
						MD0 <= 1;
						MD1 <= 1;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 1;
						OP1 <= 0;
						OP2 <= 1;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 1;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 0;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 1;
					end
				5'b01010:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 1;
						nPCld <= 0;
						RFld <= 1;
						FRld <= 0;
						MA <= 0;
						MB0 <= 1;
						MB1 <= 1;
						MC <= 0;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 1;
						MF <= 0;
						MG <= 1;
						OP0 <= 0;
						OP1 <= 1;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 1;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 0;
					end
				5'b01011:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 1;
						RFld <= 0;
						FRld <= 0;
						MA <= 0;
						MB0 <= 1;
						MB1 <= 1;
						MC <= 0;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 0;
						OP2 <= 0;
						OP3 <= 1;
						OP4 <= 1;
						OP5 <= 1;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 0;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 1;
					end
				5'b01100:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 0;
						RFld <= 1;
						FRld <= 0;
						MA <= 0;
						MB0 <= 1;
						MB1 <= 1;
						MC <= 0;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 1;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 1;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 0;
					end
				5'b01101:
					begin 
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 1;
						nPCld <= 0;
						RFld <= 0;
						FRld <= 0;
						MA <= 0;
						MB0 <= 0;
						MB1 <= 0;
						MC <= 0;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 1;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 0;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 1;
						N1 <= 0;
						N0 <= 1;
						Inv <= 0;
						S1 <= 1;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 1;
						CR2 <= 1;
						CR1 <= 1;
						CR0 <= 1;
					end
				5'b01110:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 1;
						RFld <= 0;
						FRld <= 0;
						MA <= 0;
						MB0 <= 0;
						MB1 <= 0;
						MC <= 1;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 0;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 0;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 1;
					end
				5'b01111:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 1;
						RFld <= 0;
						FRld <= 0;
						MA <= 0;
						MB0 <= 1;
						MB1 <= 0;
						MC <= 1;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 0;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 0;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 1;
					end
				5'b10000:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 1;
						MARld <= 1;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 0;
						RFld <= 0;
						FRld <= 0;
						MA <= 0;
						MB0 <= 0;
						MB1 <= 0;
						MC <= 0;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 0;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 1;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 0;
					end
				5'b10001:
					begin
												//	Control Signals for Data Path
						MOV <= 1;
						RW <= 1;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 0;
						RFld <= 0;
						FRld <= 0;
						MA <= 0;
						MB0 <= 0;
						MB1 <= 1;
						MC <= 0;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 0;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 1;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 1;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 1;
					end
				5'b10010:
					begin
												//	Control Signals for Data Path
						MOV <= 1;
						RW <= 1;
						MARld <= 0;
						MDRld <= 1;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 0;
						RFld <= 0;
						FRld <= 0;
						MA <= 0;
						MB0 <= 0;
						MB1 <= 1;//lol
						MC <= 0;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 0;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 1;
						N1 <= 0;
						N0 <= 1;
						Inv <= 1;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 1;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 1;
						CR0 <= 0;
					end
				5'b10011:
					begin
												//	Control Signals for Data Path
						MOV <= 0;// 
						RW <= 1;// 
						MARld <= 0; //changed thisss
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 0;
						RFld <= 1;
						FRld <= 0;
						MA <= 0;
						MB0 <= 0;
						MB1 <= 1;
						MC <= 0;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						MH <=0; //hcnaged this
						OP0 <= 0;
						OP1 <= 1;
						OP2 <= 0;
						OP3 <= 1;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 0;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 1;
					end
				5'b10100:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 1;
						MARld <= 1;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 0;
						RFld <= 0;
						FRld <= 0;
						MA <= 0;
						MB0 <= 1;
						MB1 <= 0;
						MC <= 0;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 0;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 0;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 1;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 1;
					end
				5'b10101:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 1;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 0;
						RFld <= 0;
						FRld <= 0;
						MA <= 1;
						MB0 <= 0;
						MB1 <= 0;
						MC <= 0;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 0;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 1;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 0;
					end
				5'b10110:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 0;
						MDRld <= 1;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 0;
						RFld <= 0;
						FRld <= 0;
						MA <= 1;
						MB0 <= 0;
						MB1 <= 0;
						MC <= 0;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 0;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 1;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 0;
					end
				5'b10111:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 0;
						RFld <= 0;
						FRld <= 0;
						MA <= 1;
						MB0 <= 0;
						MB1 <= 0;
						MC <= 0;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 0;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 1;
						N1 <= 1;
						N0 <= 1;
						Inv <= 1;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 1;
						CR3 <= 0;
						CR2 <= 1;
						CR1 <= 1;
						CR0 <= 1;
					end
				5'b11000:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 1;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 0;
						RFld <= 0;
						FRld <= 0;
						MA <= 1;
						MB0 <= 0;
						MB1 <= 0;
						MC <= 0;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 0;
						MF <= 1;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 0;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 0;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 1;
						CR3 <= 0;
						CR2 <= 1;
						CR1 <= 1;
						CR0 <= 0;
					end
				5'b11001:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 0;
						RFld <= 0;
						FRld <= 0;
						MA <= 0;
						MB0 <= 0;
						MB1 <= 0;
						MC <= 0;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 0;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 1;
						N1 <= 0;
						N0 <= 1;
						Inv <= 1;
						S1 <= 1;
						S0 <= 1;
						CR4 <= 1;
						CR3 <= 1;
						CR2 <= 0;
						CR1 <= 1;
						CR0 <= 1;
					end
				5'b11010:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 1;
						nPCld <= 1;
						RFld <= 0;
						FRld <= 0;
						MA <= 0;
						MB0 <= 1;
						MB1 <= 1;
						MC <= 0;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 1;
						MF <= 1;
						MG <= 0;
						OP0 <= 1;
						OP1 <= 1;
						OP2 <= 1;
						OP3 <= 1;
						OP4 <= 1;
						OP5 <= 1;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 0;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 1;
					end
				5'b11011:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 0;
						RFld <= 0;
						FRld <= 0;
						MA <= 0;
						MB0 <= 0;
						MB1 <= 0;
						MC <= 0;
						MD0 <= 0;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 0;
						OP2 <= 0;
						OP3 <= 0;
						OP4 <= 0;
						OP5 <= 0;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 1;
						N1 <= 0;
						N0 <= 1;
						Inv <= 1;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 1;
						CR3 <= 1;
						CR2 <= 1;
						CR1 <= 1;
						CR0 <= 0;
					end
				5'b11100:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 1;
						nPCld <= 0;
						RFld <= 0;
						FRld <= 0;
						MA <= 0;
						MB0 <= 1;
						MB1 <= 1;
						MC <= 0;
						MD0 <= 1;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 1;
						OP2 <= 1;
						OP3 <= 1;
						OP4 <= 1;
						OP5 <= 1;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 1;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 0;
					end
				5'b11101:
					begin
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 0;
						nPCld <= 1;
						RFld <= 0;
						FRld <= 0;
						MA <= 0;
						MB0 <= 1;
						MB1 <= 1;
						MC <= 0;
						MD0 <= 1;
						MD1 <= 0;
						ME <= 0;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 0;
						OP2 <= 1;
						OP3 <= 1;
						OP4 <= 1;
						OP5 <= 1;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 0;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 1;
					end
				5'b11110:
					begin 
												//	Control Signals for Data Path
						MOV <= 0;
						RW <= 0;
						MARld <= 0;
						MDRld <= 0;
						IRld <= 0;
						PCld <= 1;
						nPCld <= 1;
						RFld <= 0;
						FRld <= 0;
						MA <= 0;
						MB0 <= 1;
						MB1 <= 1;
						MC <= 0;
						MD0 <= 1;
						MD1 <= 0;
						ME <= 1;
						MF <= 0;
						MG <= 0;
						OP0 <= 0;
						OP1 <= 1;
						OP2 <= 1;
						OP3 <= 1;
						OP4 <= 1;
						OP5 <= 1;
						Cin <= 0;
						// 	Transition State Signals
						N2 <= 0;
						N1 <= 1;
						N0 <= 0;
						Inv <= 0;
						S1 <= 0;
						S0 <= 0;
						CR4 <= 0;
						CR3 <= 0;
						CR2 <= 0;
						CR1 <= 0;
						CR0 <= 1;
					end
			endcase // state
		end
endmodule // microstore
