/* Module of Sign Extender
   Programmed by: Lianne Sánchez Rodríguez
   Phase 4 
   Professor: Nestor Rodríguez 
*/

module signExtender(output reg [31:0] signExtended, input [21:0] notSignExtended, input [4:0] state);
	always @(notSignExtended) 
		begin
			if(state==25)
				begin
				signExtended[21:0] <= notSignExtended[21:0];
				
					case(notSignExtended[21])
						1'b0:	
							begin
								signExtended[31:22] <= 10'b0000000000;
							end
						1'b1:
							begin
								signExtended[31:22] <= 10'b1111111111;
							end
					endcase // notSignExtended[12]					
				end
			else
				begin
					signExtended[12:0] <= notSignExtended[12:0];
					case(notSignExtended[12])
						1'b0:	
							begin
								signExtended[31:13] <= 19'b0000000000000000000;
							end
						1'b1:
							begin
								signExtended[31:13] <= 19'b1111111111111111111;
							end
					endcase // notSignExtended[12]
				end
		end
endmodule

// module signExtension; 
// 	// Inputs of ALU
// 	reg [12:0] signExtent;
// 	//Outputs of ALU module
// 	wire [31:0] out;
// 	//test duration
// 	parameter stop_time = 10090;
// 	signExtender signextent(out, signExtent);
// 	initial #stop_time $finish;

// 	initial begin
// 	#10 signExtent = 13'b0111111111111;
//  	#20 signExtent = 13'b1000000000000; 
//  	#30 signExtent = 13'b0110111111111; 
//  	#40 signExtent = 13'b1110000000000; 
// 	end
// 	initial begin
// 		$display ("\n\n\tNot Sign Extended\t\t Sign Extended");
// 		$monitor ("%0d\t%b\t\t%b\t\t", $time, signExtent, out);
// 	end
	
// endmodule