// module test_cu;
// 		//inputs to the ALU
// 	//Inputs 
// 	reg [31:0] instr; 
// 	reg MOC, Condin, N_flag, V_flag, Z_flag, C_flag, cond, a;

// 	//Outputs
// 	wire RFld, IRld, MARld, MDRld, RW, MOV, FRld, Cin, MA, MB0, MB1, MC, MD0, MD1, ME, MF, MG, OP4, OP3, OP2, OP1, OP0;	

// 	//Label
// 	reg [8*5:1] instr_label;

// 	reg clk = 0;
// 	reg clr ;
// 	controlUnit controlUnit(MOV, RW, MARld, MDRld, IRld, PCld, nPCld, RFld, FRld, Cin, MA, MB0, MB1, MC, MD0, MD1, ME, MF, MG,OP5, 
// 				OP4, OP3, OP2, OP1, OP0, MOC, clr, Condin, cond,  clk, N_flag, Z_flag, C_flag, V_flag, instr);

// 	initial begin

// 		//A/L/S reg
// 		//instr_label = "A/L reg"; instr = 32'b10000000010000000000000000000000; MOC = 0; Condin = 0; Z_flag = 0; #50 MOC = 1; #20 Condin = 1;
// 		//A/L/S imm
// 		//#300 instr_label = "A/L imm"; instr = 32'b10000000010000000010000000000000; MOC = 0; Condin = 0; Z_flag = 0; #50 MOC = 1; #20 Condin = 1;
// 		//A/L/S reg cc
// 		//#300 instr_label = "A/L reg cc"; instr = 32'b10000000100000000000000000000000; MOC = 0; Condin = 0; Z_flag = 0; #50 MOC = 1; #20 Condin = 1;
// 		//A/L/S imm cc
// 		//#300 instr_label = "A/L imm cc"; instr = 32'b10000000110000000010000000000000; MOC = 0; Condin = 0; Z_flag = 0; #50 MOC = 1; #20 Condin = 1;
// 		//Sethi
// 		//#300 instr_label = "SETHI"; instr = 32'b00010001000000000000000000000000; MOC = 0; Condin = 0; Z_flag = 0; #50 MOC = 1; #20 Condin = 1;
// 		//Jumpl reg
// 	    //instr_label = "JUMPL"; instr = 32'b10010001110000000000000000000000; MOC = 0; Condin = 0; Z_flag = 0; #50 MOC = 1; #20 Condin = 1;
// 		//Jumpl imm
// 		// instr_label = "JUMPL imm"; instr = 32'b10010001110000000110000000000000; MOC = 0; Condin = 0; Z_flag = 0; #50 MOC = 1; #20 Condin = 1;
// 		//Call
// 		//instr_label = "CALL"; instr = 32'b01010001110000000110000000000000; MOC = 0; Condin = 0; Z_flag = 0; #50 MOC = 1; #20 Condin = 1;
// 		//Load reg
// 		//instr_label = "LOAD reg"; instr = 32'b11010000010010000100000000000000; MOC = 0; Condin = 0; Z_flag = 0; #50 MOC = 1; #20 Condin = 1;
// 		//Load imm
// 		//instr_label = "LOAD imm"; instr = 32'b11010000010010000110000000000000; MOC = 0; Condin = 0; Z_flag = 0; #50 MOC = 1; #20 Condin = 1;
// 		//Store reg
// 		//instr_label = "STORE reg"; instr = 32'b11000000001100000000000000000000; MOC = 0; Condin = 0; Z_flag = 0; #50 MOC = 1; #20 Condin = 1;
// 		//Store imm
// 		//instr_label = "STORE imm"; instr = 32'b11000000001100000010000000000000; MOC = 0; Condin = 0; Z_flag = 0; #50 MOC = 1; #20 Condin = 1;
// 		//Branch conditional a=1
// 		//instr_label = "BC"; instr = 32'b00111010100000000000000000000000; MOC = 0; Condin = 0;cond = 0; Z_flag = 0; #50 MOC = 1; #20 Condin = 1; 
// 		//Branch conditional a=0
// 		instr_label = "BC"; instr = 32'b00011010100000000000000000000000; MOC = 0; Condin = 0;cond = 0; Z_flag = 0; #50 MOC = 1; #20 Condin = 1; 
// 	end

// 	initial #1000 $finish;

// 	initial begin
// 		repeat (500) begin
// 			#10 clk = ~clk;
// 		end
// 	end
		
// 	initial begin
// 		$display("%s\t%b", instr_label, instr);
// 	end

// endmodule