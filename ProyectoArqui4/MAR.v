/* Module of MAR
   Programmed by: Lianne Sánchez Rodríguez
   Phase 4 
   Professor: Nestor Rodríguez 
*/
module mar(output reg [31:0] outToRAMAddress, input [31:0] Ds, input MARld, input clk);
	initial begin
	 //	outToRAMAddress = 32'b00000000000000000000000000000000;
	end
	always @(posedge clk) 
		begin
			#5;
			if (MARld == 1)
				outToRAMAddress = Ds;
		end
	 always @(outToRAMAddress)begin 
	 	//	$display("CAMBIE BITCHHHHH !!!!!    MAR %d", outToRAMAddress);
	 end
endmodule

// module marRegister; 
// 	// Inputs of ALU
	
// 	reg [31:0] in;
// 	reg MARld;
// 	reg clk=0;
// 	//Outputs of ALU module
// 	wire [31:0] out;
// 	//test duration
// 	parameter stop_time = 10590;

// 	mar mar(out, in, MARld, clk);
// 	initial #stop_time $finish;

// 	initial begin

// 	#10 in= 32'b0000; MARld = 1;  
//  	#10 in= 32'b0011; #30 MARld=0;
//  	#30 in= 32'b1100; 
//  	#40 in= 32'b1111;

// 	end
// 		initial begin
// 		repeat (500) begin
// 			#5 clk = ~clk;
// 		end
// 	end
// 	initial begin
// 		$display ("\n\n\t\tInput\t\t\tOutput\t\t\tMARld");
// 		$monitor ("%0d\t%b\t\t%b\t%b", $time,in, out, MARld);
// 	end
	
//  endmodule