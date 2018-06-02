/* Module of nPC register
   Programmed by: Lianne Sánchez Rodríguez
   Phase 4 
   Professor: Nestor Rodríguez 
*/
module npc(output reg [31:0] outnPC, input [31:0] inFromDataPath, input nPCld, input clk);
	 initial begin
	  	outnPC = 32'h00000004;
	 end
	always @(posedge clk) 
		begin	
			//$display("npcInside",outnPC);
			if (nPCld == 1)
				outnPC <= inFromDataPath;
		end
endmodule

// module nextProgramCounter; 
// 	// Inputs of ALU
	
// 	reg [31:0] in;
// 	reg nPCld;
// 	reg clk=0;
// 	//Outputs of ALU module
// 	wire [31:0] out;
// 	//test duration
// 	parameter stop_time = 10590;

// 	npc npc(out, in, nPCld, clk);
// 	initial #stop_time $finish;

// 	initial begin

// 	#10 in= 32'b00000000000000000000000000000000; nPCld = 1;  
//  	#20 in= 32'b00000001111000000000000000000000; #30 nPCld=0;
//  	#30 in= 32'b00000000000111100000000000000000; 
//  	#40 in= 32'b01111110000000000000000000000000;

// 	end
// 		initial begin
// 		repeat (500) begin
// 			#5 clk = ~clk;
// 		end
// 	end
// 	initial begin
// 		$display ("\n\n\t\tOutput\t\t\tInput\t\t\tNPCld");
// 		$monitor ("%0d\t%b\t\t%b\t%b", $time,in, out, nPCld);
// 	end
	
// endmodule