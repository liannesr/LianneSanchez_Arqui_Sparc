/* Module of Condition Checker register
   Programmed by: Lianne Sánchez Rodríguez
   Phase 4 
   Professor: Nestor Rodríguez 
*/
module conditionChecker(output reg cond, a , input [4:0] conditionCode, input N_flag, Z_flag, V_flag, C_flag);
	always @(conditionCode) 
		begin
			a = conditionCode[4];
			cond <= 0;
			case(conditionCode[3:0])
				4'b1000:											// BRANCH ALWAYS
					begin
						cond <= 1'b1;
					end
				4'b0000:											// BRANCH NEVER
					begin
						cond <= 1'b0;
					end
				4'b1001:											// BRANCH ON NOT EQUAL
					begin
						if(Z_flag == 0)
							cond <= 1;
					end
				4'b0001:											// BRANCH ON EQUAL	
					begin
						if(Z_flag == 1)
							cond <= 1;
					end
				4'b1010:											// BRANCH ON GREATER
					begin
						if(Z_flag == 0 && (N_flag == Z_flag))
							cond <= 1;
					end
				4'b0010:											// BRANCH ON LESS OR GREATER
					begin
						if(Z_flag == 1 || (N_flag != Z_flag))
							cond <= 1;
					end
				4'b1011:											// BRANCH ON GREATER OR EQUAL
					begin
						if(N_flag == Z_flag)
							cond <= 1;
					end
				4'b0011:											// BRANCH ON LESS
					begin
						if(N_flag != Z_flag)
							cond <= 1;
					end
				4'b1100:											// BRANCH ON GREATER UNSIGNED
					begin
						if(C_flag == 0 && N_flag==0)
							cond <= 1;
					end
				4'b0100:											// BRANCH ON LESS OR EQUAL UNSIGNED
					begin
						if(C_flag == 1 || N_flag==1)
							cond <= 1;
					end
				4'b1101:											// BRANCH ON CARRY CLEAR
					begin
						if(C_flag == 0)
							cond <= 1;
					end
				4'b0101:											// BRANCH ON CARRY SET
					begin
						if(C_flag == 1)
							cond <= 1;
					end
				4'b1110:											// BRANCH ON POSITIVE
					begin
						if(N_flag == 0)
							cond <= 1;
					end	
				4'b0110:											// BRANCH ON NEGATIVE
					begin
						if(N_flag == 1)
							cond <= 1;
					end	
				4'b1111:											// BRANCH ON OVERFLOW CLEAR
					begin
						if(V_flag == 0)
							cond <= 1;
					end	
				4'b0111:											// BRANCH ON OVERFLOW SET 
					begin
						if(V_flag == 1)
							cond <= 1;
					end	
			endcase // conditionCode[3:0]
		end
endmodule

// module checkCondition; 
// 	// Inputs of ALU
// 	reg [4:0] op3;
// 	reg N_flag;
// 	reg Z_flag;
// 	reg V_flag;
// 	reg C_flag;
// 	//Outputs of ALU module
// 	wire cond;
// 	wire a;
// 	//test duration
// 	parameter stop_time = 10090;

// 	conditionChecker checkType(cond, a , op3, N_flag, Z_flag, V_flag, C_flag);
// 	initial #stop_time $finish;

// 	initial begin
// 	#10 op3 = 5'b11111; N_flag = 0; Z_flag = 0; V_flag = 1; C_flag = 0;
//  	#20 op3 = 5'b01001; N_flag = 0; Z_flag = 1; V_flag = 0; C_flag = 0;
//  	#30 op3 = 5'b11011; N_flag = 0; Z_flag = 0; V_flag = 0; C_flag = 0;
//  	#40 op3 = 5'b01100; N_flag = 0; Z_flag = 0; V_flag = 0; C_flag = 0;
// 	end
// 	initial begin
// 		$display ("\n\n\top3\t\tN_flag\t\tZ_flag\t\tV_flag\t\tC_flag\t\tCond\t\tA");
// 		$monitor ("%0d\t%b\t\t%b\t\t%b\t\t%b\t\t%b\t\t%b\t\t%b", $time, op3, N_flag, Z_flag, V_flag, C_flag, cond, a);
// 	end
	
// 	endmodule
