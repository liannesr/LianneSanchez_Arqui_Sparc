/* Module of Next State Adress Selector for the Control Unit
   Programmed by: Lianne Sánchez Rodríguez
   Phase 3 
   Professor: Nestor Rodríguez 
*/
module nextStateAdressSelector(output reg [1:0] outNext, input [2:0] N, input Sts, input clk);
	initial begin
	 	outNext <= 2'b01;
	end
	always @(posedge clk)
		begin
			#10;
			case(N)
				3'b000: begin
					 outNext <= 2'b00;	// Encoder	
				end
				3'b001:	begin
					 outNext <= 2'b01;	// 1
				end
				3'b010:	begin
					 outNext <= 2'b10;	// Control Register
				end
				3'b011:	begin
					outNext <= 2'b11;	// Incrementer
				end
				3'b100:	begin
					
							if(Sts)
								begin
									outNext <= 2'b00;	// Encoder
								end
							else
								begin
									outNext <= 2'b10;	// Control Register 
								end
						end 
				3'b101: begin
					
							if(Sts)
								begin
									outNext <= 2'b10;	// Control Register 
								end
							else
								begin
									outNext <= 2'b11;	// Incrementer
								end
						end 
				3'b110:	begin
					
							if(Sts)
								begin
									outNext <= 2'b00;	// Encoder
								end
							else
								begin
									outNext <= 2'b11;	// Incrementer
								end
						end 
				3'b111: begin
					
							if(Sts)
								begin
									outNext <= 2'b10;	// Control Register
								end
							else
								begin
									outNext <= 2'b01;	// 000001
								end
				end
			endcase // N
		end
endmodule

// module nextState; 
// 	// Inputs of ALU
// 	reg [2:0] N;
// 	reg Sts;
// 	reg clk = 0;
// 	//Outputs of ALU module
// 	wire [1:0] result;
// 	//test duration
// 	parameter stop_time = 1090;

// 	nextStateAdressSelector next(result, N, Sts, clk);
// 	initial #stop_time $finish;

// 	initial begin

// 	//ADD
// 	#0 N = 3'b000; Sts = 1'b1; 
// 	#20 N = 3'b010; Sts = 1'b1; 
// 	#40 N = 3'b011; Sts = 1'b1; 
// 	#60 N = 3'b101; Sts = 1'b1; 
// 	//ADDcc

// 	end
// 		initial begin
// 		repeat (500) begin
// 			#10 clk = ~clk;
// 		end
// 	end
// 	initial begin
// 		$display ("\n\nNext State\tN\tSts\t");
// 		$monitor ("%0d\t%b\t%b\t%b", $time, result, N, Sts);
// 	end
	
// endmodule
