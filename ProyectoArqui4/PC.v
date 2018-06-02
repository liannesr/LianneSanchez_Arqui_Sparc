/* Module of PC register
   Programmed by: Lianne Sánchez Rodríguez
   Phase 4 
   Professor: Nestor Rodríguez 
*/
module pc(output reg [31:0] outPC, input [31:0] inFromDataPath, input PCld, input clk);
	 initial begin
	  	outPC = 32'h00000000;
	 end
	always @(posedge clk) 
		begin
			//$display("PC inside",outPC);
			if (PCld == 1)
				outPC <= inFromDataPath;
		end
endmodule

// module nextProgramCounter; 
// 	// Inputs of ALU
	
// 	reg [31:0] in;
// 	reg PCld;
// 	reg clk=0;
// 	//Outputs of ALU module
// 	wire [31:0] out;
// 	//test duration
// 	parameter stop_time = 10590;

// 	pc pc(out, in, PCld, clk);
// 	initial #stop_time $finish;

// 	initial begin

// 	#10 in= 32'b00000000000000000000000000000000; PCld = 1;  
//  	#20 in= 32'b00000001111000000000000000000000; //#30 nPCld=0;
//  	#30 in= 32'b00000000000111100000000000000000; 
//  	#40 in= 32'b01111110000000000000000000000000;

// 	end
// 		initial begin
// 		repeat (500) begin
// 			#5 clk = ~clk;
// 		end
// 	end
// 	initial begin
// 		$display ("\n\n\t\tOutput\t\t\tInput\t\t\tPCld");
// 		$monitor ("%0d\t%b\t\t%b\t%b", $time,in, out, PCld);
// 	end
	
// endmodule
