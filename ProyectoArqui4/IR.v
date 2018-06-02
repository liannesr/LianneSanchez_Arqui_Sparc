/* Module of Instruction Register
   Programmed by: Lianne Sánchez Rodríguez
   Phase 4 
   Professor: Nestor Rodríguez 
*/
module ir(output reg [31:0] outToDataPath, input [31:0] outFromRAM, input IRld, input clk);
	initial begin
	 	outToDataPath = 32'b00000000000000000000000000000000;
	end
	always @(posedge clk) 
		begin
			
			if (IRld == 1 )
				outToDataPath <= outFromRAM;
		end
	 always @(outToDataPath)begin 

	 		//$display("IR %b, RAM %b", outToDataPath, outFromRAM);
	 end
endmodule

// module irRegister; 
// 	// Inputs of ALU
	
// 	reg [31:0] in;
// 	reg IRld;
// 	reg clk=0;
// 	//Outputs of ALU module
// 	wire [31:0] out;
// 	//test duration
// 	parameter stop_time = 10590;

// 	ir ir(out, in, IRld, clk);
// 	initial #stop_time $finish;

// 	initial begin

// 	#10 in= 32'b1000; IRld = 1;  
//  	#10 in= 32'b0011; #30 IRld=0;
//  	#30 in= 32'b1100; 
//  	#40 in= 32'b1111;

// 	end
// 		initial begin
// 		repeat (500) begin
// 			#5 clk = ~clk;
// 		end
// 	end
// 	initial begin
// 		$display ("\n\n\t\tInput\t\t\tOutput\t\t\tIRld");
// 		$monitor ("%0d\t%b\t\t%b\t%b", $time,in, out, IRld);
// 	end
	
//  endmodule