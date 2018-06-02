/* Module of Mux 2 to 1 of 31 bits (MuxE, MuxF, MuxA)
   Programmed by: Lianne Sánchez Rodríguez
   Phase 3 
   Professor: Nestor Rodríguez 
*/
module mux2To1_31(output reg [31:0] outMux, input [31:0] I_0, input [31:0] I_1, 
	input select);
	initial begin
		//outMux = 0;
	end
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
// 	reg [31:0] in_0;
// 	reg [31:0] in_1;
// 	reg clk; 
// 	//Outputs of ALU module
// 	wire [31:0] result;
// 	//test duration
// 	parameter stop_time = 1090;
// 	mux2To1_31 mux(result, in_0, in_1, select);
// 	initial #stop_time $finish;

// 	initial begin

// 	#0  in_0 = 32'h00000000; in_1 = 32'h000A0001; select = 1'b0;
// 	#20 in_0 = 32'h00000000; in_1 = 32'h000A0001; select = 1'b1;

// 	end
	
// 	initial begin
// 		$display ("\n\nSelect\tEntrance1\t\tEntrance2\t\tOut Mux");
// 		$monitor ("%0d\t%b\t%b\t%b\t%b", $time, select, in_0, in_1,result);
// 	end
	
// endmodule