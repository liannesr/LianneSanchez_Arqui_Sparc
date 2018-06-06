/* Module of Incrementer Register 
   Programmed by: Lianne Sánchez Rodríguez
   Phase 3 
   Professor: Nestor Rodríguez 
*/
module incrementerRegister(output reg [4:0] outToMux, input [4:0] inAdder, input clk);

	initial begin
	 	outToMux = 5'b00000;
	end

 	always @(posedge clk)//posedge clk) 
 		begin
 			#10;
 			outToMux <= inAdder;
 		end
 endmodule

// module incrementer; 
// 	// Inputs of ALU
	
// 	reg [4:0] in;
// 	reg clk = 0;
// 	//Outputs of ALU module
// 	wire [4:0] out;
// 	//test duration
// 	parameter stop_time = 10090;

// 	incrementerRegister next(out, in, clk);
// 	initial #stop_time $finish;

// 	initial begin

// 	//ADD
// 	#10 in= 5'b00000; 
//  	#20 in= 5'b00000; 
//  	#30 in= 5'b00111; 
//  	#40 in= 5'b11000; 
// 	//ADDcc

// 	end
// 		initial begin
// 		repeat (500) begin
// 			#5 clk = ~clk;
// 		end
// 	end
// 	initial begin
// 		$display ("\n\nOutput\t\tInput\t");
// 		$monitor ("%0d\t%b\t\t%b", $time, out, in);
// 	end
	
// endmodule