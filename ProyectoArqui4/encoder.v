/* Module of Encoder for the Control Unit
   Programmed by: Lianne Sánchez Rodríguez
   Phase 3 
   Professor: Nestor Rodríguez 
*/
module encoder(output reg [4:0] nextState, input [31:0] instruction, input clk);
	always @(instruction, posedge clk)
		begin
			// #1;
			case(instruction[31:30])
				2'b00:
					begin
						if(instruction[24:22] == 3'b010)		// Branches
							begin
								nextState <= 5'b11001;
							end
						else if(instruction[24:22] == 3'b100)	// Sethi
							begin
								nextState <= 5'b01001;
							end
					end
				2'b01:											//  Call
					begin
						nextState <= 5'b01010;
					end
				2'b10:											// Arithmetic and Jumpl
					begin
						case(instruction[24:19])
								6'b111000:						// Jumpl
									begin
										nextState <= 5'b01100;
									end
								6'b100101:						// Shift
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00101;
										else
											nextState <= 5'b00111;
									end
								6'b100110:						// Shift
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00101;
										else
											nextState <= 5'b00111;
									end
								6'b100111:						// Shift
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00101;
										else
											nextState <= 5'b00111;
									end
								6'b000000:
									begin
										 if(instruction[13]==0) 
											nextState <= 5'b00101;
										else
											nextState <= 5'b00111;
									end
								6'b010000:
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00110;
										else
											nextState <= 5'b01000;
									end 
								6'b001000:
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00101;
										else
											nextState <= 5'b00111;
									end
								6'b011000:
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00110;
										else
											nextState <= 5'b01000;
									end
								6'b000100:
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00101;
										else
											nextState <= 5'b00111;
									end
								6'b010100:							//MISSINGGG
									begin
										if(instruction[13]==0)
											nextState <= 5'b00110;
										else
											nextState <= 5'b01000;
									end 
								6'b001100:
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00101;
										else
											nextState <= 5'b00111;
									end
								6'b011100:
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00110;
										else
											nextState <= 5'b01000;
									end
								6'b000001:
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00101;
										else
											nextState <= 5'b00111;
									end
								6'b010001:
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00110;
										else
											nextState <= 5'b01000;
									end
								6'b000101:
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00101;
										else
											nextState <= 5'b00111;
									end
								6'b010101:
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00110;
										else
											nextState <= 5'b01000;
									end
								6'b000010:
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00101;
										else
											nextState <= 5'b00111;
									end
								6'b010010:
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00110;
										else
											nextState <= 5'b01000;
									end
								6'b000110:
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00101;
										else
											nextState <= 5'b00111;
									end
								6'b010110:
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00110;
										else
											nextState <= 5'b01000;
									end
								6'b000011:
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00101;
										else
											nextState <= 5'b00111;
									end
								6'b010011:
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00110;
										else
											nextState <= 5'b01000;
									end
								6'b000111:
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00101;
										else
											nextState <= 5'b00111;
									end
								6'b010111:
									begin
										if(instruction[13]==0) 
											nextState <= 5'b00110;
										else
											nextState <= 5'b01000;
									end
						endcase // instruction[24:19]
					end
				2'b11:
					begin
						case(instruction[24:19])
							6'b001001:
								begin
									if(instruction[13]==0)
										nextState <= 5'b10000;
									else
										nextState <= 5'b10100;
								end
							6'b001010:
								begin
									if(instruction[13]==0)
										nextState <= 5'b10000;
									else
										nextState <= 5'b10100;
								end							
							6'b000001:
								begin
									if(instruction[13]==0)
										nextState <= 5'b10000;
									else
										nextState <= 5'b10100;
								end
							6'b000010:
								begin
									if(instruction[13]==0)
										nextState <= 5'b10000;
									else
										nextState <= 5'b10100;
								end							
							6'b000000:
								begin
									if(instruction[13]==0)
										nextState <= 5'b10000;
									else
										nextState <= 5'b10100;
								end							
							6'b000011:
								begin
									if(instruction[13]==0)
										nextState <= 5'b10000;
									else
										nextState <= 5'b10100;
								end
							6'b000101:
								begin
									if(instruction[13]==0)
										nextState <= 5'b10101;
									else
										nextState <= 5'b11000;
								end							
							6'b000110:
								begin
									if(instruction[13]==0)
										nextState <= 5'b10101;
									else
										nextState <= 5'b11000;
								end							
							6'b000100:
								begin
									if(instruction[13]==0)
										nextState <= 5'b10101;
									else
										nextState <= 5'b11000;
								end
							6'b000111:
								begin
									if(instruction[13]==0)
										nextState <= 5'b10101;
									else
										nextState <= 5'b11000;
								end
						endcase // insruction[24:19]
					end
			endcase // intruction[31:30]
		end
endmodule 

// module encode;  
// 	// Inputs of ALU
// 	reg [31:0] Instruction;
// 	reg clk = 0;
// 	//Outputs of ALU module
// 	wire [4:0] nextState;
// 	//test duration
// 	parameter stop_time = 1090;

// 	encoder encod(nextState, Instruction, clk);
// 	initial #stop_time $finish;

// 	initial begin

// 	//ADD
// 	#10 Instruction = 32'b00010001000000000000000000000000;
	
	
// 	//ADDcc

// 	end
// 		initial begin
// 		repeat (500) begin
// 			#10 clk = ~clk;
// 		end
// 	end
// 	initial begin
// 		$display ("\n\nNext State\t\tInstruction\t");
// 		$monitor ("%0d\t%b\t\t%b\t", $time, nextState, Instruction);
// 	end
	
// endmodule