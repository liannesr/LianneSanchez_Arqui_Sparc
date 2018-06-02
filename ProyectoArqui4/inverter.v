/* Module of inverter
   Programmed by: Lianne Sánchez Rodríguez
   Phase 3 
   Professor: Nestor Rodríguez 
*/
module inverter(output reg outInv, input inv, input in, input clk);
	
	always @(inv,in)
		begin
			case(inv)
				1'b0:	outInv = in; 
				1'b1:	outInv = !in;
			endcase // inv
		end
endmodule


// module invert; 
// 	// Inputs of ALU
// 	wire out;
// 	reg inv;
// 	reg in;
// 	reg clk = 0;

// 	//test duration
// 	parameter stop_time = 1090;

// 	inverter invertion(out, in, inv, clk);
// 	initial #stop_time $finish;

// 	initial begin

// 	//ADD
// 	#0 inv = 1'b0; in = 1'b1; 
// 	#20 inv = 1'b1; in = 1'b1; 
// 	#40 inv = 1'b0; in = 1'b0; 
// 	#60 inv = 1'b1; in = 1'b0; 
// 	//ADDcc

// 	end
// 	initial begin
// 		repeat (500) begin
// 			#10 clk = ~clk;
// 		end
// 	end
// 	initial begin
// 		$display ("\n\n\tInverted Result\t\tinv\twhatTo\t");
// 		$display ("%0d\t\t%b\t\t%b\t%b", $time, out, inv, in);
// 	end
	
// endmodule
