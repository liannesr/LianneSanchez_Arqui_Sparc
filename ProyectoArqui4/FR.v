/* Module of FR (Flag Register) register
   Programmed by: Lianne Sánchez Rodríguez
   Phase 4 
   Professor: Nestor Rodríguez 
*/
module fr(output reg [3:0] outFlags, input [3:0] inFlagsFromALU, input FRld, input clk);
	initial begin
	 	outFlags = 4'b0000;
	end
	always @(posedge clk) 
		begin
			if (FRld == 1)
				outFlags <= inFlagsFromALU;
		end
endmodule

// module flagRegister; 
// 	// Inputs of ALU
	
// 	reg [3:0] in;
// 	reg FRld;
// 	reg clk=0;
// 	//Outputs of ALU module
// 	wire [3:0] out;
// 	//test duration
// 	parameter stop_time = 10590;

// 	fr fr(out, in, FRld, clk);
// 	initial #stop_time $finish;

// 	initial begin

// 	#10 in= 4'b0000; FRld = 1;  
//  	#10 in= 4'b0011; //#30 FRld=0;
//  	#30 in= 4'b1100; 
//  	#40 in= 4'b1111;

// 	end
// 		initial begin
// 		repeat (500) begin
// 			#5 clk = ~clk;
// 		end
// 	end
// 	initial begin
// 		$display ("\n\n\t\tInput\t\t\tOutput\t\t\tNPCld");
// 		$monitor ("%0d\t%b\t\t%b\t%b", $time,in, out, FRld);
// 	end
	
//  endmodule