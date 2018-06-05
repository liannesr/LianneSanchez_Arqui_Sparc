/* Module of Control Unit
   Programmed by: Lianne Sánchez Rodríguez
   Phase 3 
   Professor: Nestor Rodríguez 
*/

module controlUnit (output wire [4:0] present_state, output wire MOV, RW, MARld, MDRld, IRld, PCld, nPCld, RFld, FRld, Cin, MA, MB0, MB1, MC, MD0, MD1, ME, MF, MG, MH,MI,ML, OP5, 
				OP4, OP3, OP2, OP1, OP0, input MOC, clr, Condin,cond, clk, N_flag, Z_flag, C_flag, V_flag, input [31:0] instr);


wire mux4to1_1_output;				//Mux 4 x 1 bits
wire inverter_output; 				//Inverter
wire [4:0] encoder_output; 			//Encoder
wire [1:0] nextStateDecoder_output;		//Next State Decoder
wire [4:0] mux4to1_5_output; 				// Mux 4x1
wire [4:0] incrementRegister_output;		// Incrementer Register
wire [4:0] adder_output;					//Adder 
reg [4:0] addition= 5'b00001;
wire [4:0] option1 = 5'b00001;
wire [4:0] state_out;

//Instruction included on CU - Parameters

wire Inv, S1, S0, N2, N1, N0, CR7, CR6, CR5, CR4, CR3, CR2, CR1, CR0; // MicroStore
reg [2:0] N;
reg [1:0] S;
reg [4:0] CR;

//Other Variables included on CU - Parameters
wire [1:0] MAOutM, MBOutM, MCOutM;
wire MOV_out, RW_out, MARld_out, MDRld_out, IRld_out, PCld_out, nPCld_out, RFld_out, FRld_out, Cin_out, MA_out, MB0_out, MB1_out, MC_out, MD0_out, MD1_out,
	ME_out, MF_out, MG_out, MH_out, MI_out,ML_out, OP5_out, OP4_out, OP3_out, OP2_out, OP1_out, OP0_out, N2_out, N1_out, N0_out, Inv_out, S1_out, S0_out, CR4_out,
	CR3_out, CR2_out, CR1_out, CR0_out;  


//Propper connections for controlUnit with control Register

mux4To1_1 mux4To1_1(mux4to1_1_output, MOC , 1'b1, instr[13], cond, S1, S0); 	// Connected
inverter inverter(inverter_output, Inv, mux4to1_1_output,clk);		// Connected
encoder encoder(encoder_output, instr, clk);						// Connected
nextStateAdressSelector nextStateAdressSelector(nextStateDecoder_output, N, inverter_output, clk);	// Connected
//mux4To1_5 mux4To1_5(mux4to1_5, encoder_output, option1, CR, incrementRegister, nextStateDecoder);	//Connected
mux4To1_5 mux4To1_5(mux4to1_5_output, encoder_output, option1,CR, incrementRegister_output, nextStateDecoder_output);	//Connected
adder adder(adder_output, mux4to1_5_output);
incrementerRegister incrementerRegister(incrementRegister_output, adder_output, clk);	// Connected
microstore microstore(MOV_out, RW_out, MARld_out, MDRld_out, IRld_out, PCld_out, nPCld_out, RFld_out, FRld_out, Cin_out, MA_out, MB0_out, MB1_out, MC_out, MD0_out, MD1_out,
	ME_out, MF_out, MG_out,MH_out, MI_out, ML_out,OP5_out, OP4_out, OP3_out, OP2_out, OP1_out, OP0_out, N2_out, N1_out, N0_out, Inv_out, S1_out, S0_out, CR4_out,
	CR3_out, CR2_out, CR1_out, CR0_out, mux4to1_5_output, clk, 1'b0);	// Connected
controlRegister controlRegister(MOV, state_out,  RW, MARld, MDRld, IRld, PCld, nPCld, RFld, FRld, Cin, MA, MB0, MB1, MC, MD0, MD1, ME, MF, MG,MH,MI, ML,OP5, 
				OP4, OP3, OP2, OP1, OP0, N2, N1, N0, Inv, S1, S0, CR4, CR3, CR2, CR1, CR0, MOV_out, RW_out, MARld_out, MDRld_out, 
				IRld_out, PCld_out, nPCld_out, RFld_out, FRld_out, Cin_out, MA_out, MB0_out, MB1_out, MC_out, MD0_out, MD1_out, ME_out, MF_out, MG_out, MH_out, MI_out, ML_out,
				OP5_out, OP4_out, OP3_out, OP2_out, OP1_out, OP0_out, N2_out, N1_out, N0_out, Inv_out, S1_out, S0_out, CR4_out,
				CR3_out, CR2_out, CR1_out, CR0_out,mux4to1_5_output, clk); 

//End Module Calling 

always @ (*) begin
	CR[4] = CR4; CR[3] = CR3; CR[2] = CR2; CR[1] = CR1; CR[0] = CR0; 
	N[2] = N2_out; N[1] = N1_out; N[0] = N0_out;   
	S[1] = S1_out; S[0] = S0_out;
	//state = mux4to1_5_output;
end

always @ (mux4to1_5_output) begin
	//$display("RW_inside: %b",RW);
	//$monitor("Mux: %d,adder_Output:%d, Incrementer:%d, State:%d ",mux4to1_5_output, adder_output, incrementRegister_output,state_out );
	//$display("%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n",
	//MOV, RW, MARld, MDRld, IRld, PCld, nPCld, RFld, FRld, MA, MB0, MB1, MC, MD0, MD1, ME, MF, MG,OP0, 
	//			OP1, OP2, OP3, OP4, OP5,Cin, N2, N1, N0, Inv, S1, S0, CR4, CR3, CR2, CR1, CR0); 
	//$display("State: %d\t, RW: %b, MOV: %b, MOC: %b", mux4to1_5_output, RW_out, MOV_out, MOC);
	//$display("State: %d\t", mux4to1_5_output);
    //$display("npc Load %h",nPCld_out);
end
endmodule
