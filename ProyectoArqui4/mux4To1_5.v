/* Module of Mux 4 to 1 of 5 bits
   Programmed by: Lianne Sánchez Rodríguez
   Phase 3 
   Professor: Nestor Rodríguez 
*/
module mux4To1_5(output reg [4:0] outMux, input [4:0] I_0, input [4:0] I_1, input  [4:0] I_2,
	input [4:0] I_3, input [1:0] select);
	//initial begin
	//	outMux <= 5'b00000;
	//end // initial
	always @(I_0,I_1,I_2,I_3,select)
		begin
			case(select)
				2'b00:	outMux <= I_0; 
				2'b01:	outMux <= I_1;
				2'b10:	outMux <= I_2;
				2'b11:	outMux <= I_3;
			endcase // select
		end
endmodule

// module MuxTest;
// 	// Inputs of ALU
// 	reg [1:0] select;
// 	reg [4:0] entrance0;
// 	reg [4:0] entrance1;
// 	reg [4:0] entrance2;
// 	reg [4:0] entrance3;
	
// 	//Outputs of ALU module
// 	wire [4:0] result;
// 	//test duration
// 	parameter stop_time = 1090;

// 	mux4To1_5 mux(result, entrance0, entrance1, entrance2, entrance3, select);
// 	initial #stop_time $finish;

// 	initial begin

// 	//ADD
// 	#0 entrance0 = 5'b00000; entrance1 = 5'b00001; entrance2 = 5'b00011; entrance3 = 5'b01101; select = 2'b00;
// 	#20 entrance0 = 5'b00000; entrance1 = 5'b00001; entrance2 = 5'b00011; entrance3 = 5'b01101; select = 2'b01;
// 	#40 entrance0 = 5'b00000; entrance1 = 5'b00001; entrance2 = 5'b00011; entrance3 = 5'b01101; select = 2'b11;
// 	#60 entrance0 = 5'b00000; entrance1 = 5'b00001; entrance2 = 5'b00011; entrance3 = 5'b01101; select = 2'b10;
// 	//ADDcc

// 	end
	
// 	initial begin
// 		$display ("\n\nOutput\tEntrance1\t\tEntrance2\t\tEntrance3\tEntrance4\t\t\tselect");
// 		$monitor ("%0d\t%b\t%b\t%b\t%b\t%b\t%b", $time, result, entrance0, entrance1, entrance2, entrance3, select);
// 	end
	
// endmodule

