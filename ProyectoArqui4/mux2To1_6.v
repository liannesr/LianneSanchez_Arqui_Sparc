/* Module of Mux 2 to 1 of 6 bits (MuxC)
   Programmed by: Lianne Sánchez Rodríguez
   Phase 3 
   Professor: Nestor Rodríguez 
*/
module mux2To1_6(output reg [5:0] outMux, input [5:0] I_0, input [5:0] I_1, input select);
	
	always @(I_0, I_1, select)
		begin
			case(select)
				1'b0:	outMux <= I_0; 
				1'b1:	outMux <= I_1;
			endcase // select
		end
endmodule

// module MuxTest;
// 	// Inputs of ALU
// 	reg select;
// 	reg [5:0] in_0;
// 	reg [5:0] in_1;
// 	//Outputs of ALU module
// 	wire [5:0] result;
// 	//test duration
// 	parameter stop_time = 1090;
// 	mux2To1_6 mux(result, in_0, in_1, select);
// 	initial #stop_time $finish;

// 	initial begin

// 	#0  in_0 = 5'b00000; in_1 = 5'b01101; select = 1'b0;
// 	#20 in_0 = 5'b00000; in_1 = 5'b01101; select = 1'b1;

// 	end
	
// 	initial begin
// 		$display ("\n\nSelect\tEntrance1\t\tEntrance2\t\tOut Mux");
// 		$monitor ("%0d\t%b\t%b\t%b\t%b", $time, select, in_0, in_1,result);
// 	end
	
// endmodule