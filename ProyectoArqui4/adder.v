/* Module of Adder
   Programmed by: Lianne Sánchez Rodríguez
   Phase 3 
   Professor: Nestor Rodríguez 
*/
module adder(output reg [4:0] out, input[4:0] presentState);
	always @(presentState)
		begin
			out = presentState + 1;
		end
endmodule

// module nextState; 
// 	// Inputs of ALU
// 	reg [4:0] presentState;
// 	reg clk = 0;
// 	//Outputs of ALU module
// 	wire [4:0] out;
// 	//test duration
// 	parameter stop_time = 1090;

// 	adder adder(out, presentState);
// 	initial #stop_time $finish;

// 	initial begin

// 	//ADD
// 	#0 presentState = 5'b00000; 
// 	#20 presentState = 5'b0101; 
	
// 	//ADDcc

// 	end
// 		initial begin
// 		repeat (500) begin
// 			#10 clk = ~clk;
// 		end
// 	end
// 	initial begin
// 		$display ("\n\nNext State\t\tPresent State\t");
// 		$monitor ("%0d\t%b\t\t%b\t", $time, presentState, out);
// 	end
	
// endmodule