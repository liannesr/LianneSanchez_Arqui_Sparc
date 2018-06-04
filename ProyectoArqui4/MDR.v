/* Module of MDR
   Programmed by: Lianne Sánchez Rodríguez
   Phase 4 
   Professor: Nestor Rodríguez 
*/
module mdr(output reg [31:0] outToRAMIn, input [31:0] Ds, input MDRld, input clk);
	initial begin
	 	//outToRAMIn = 32'b00000000000000000000000000000000;
	end
	always @(posedge clk) 
		begin
			if (MDRld == 1)
				outToRAMIn = Ds;
		end
endmodule

// module mdrRegister; 
// 	// Inputs of ALU
	
// 	reg [31:0] in;
// 	reg MDRld;
// 	reg clk=0;
// 	//Outputs of ALU module
// 	wire [31:0] out;
// 	//test duration
// 	parameter stop_time = 10590;

// 	mdr mdr(out, in, MDRld, clk);
// 	initial #stop_time $finish;

// 	initial begin

// 	#10 in= 32'b1000; MDRld = 1;  
//  	#10 in= 32'b0011; //#30 MDRld=0;
//  	#30 in= 32'b1100; 
//  	#40 in= 32'b1111;

// 	end
// 		initial begin
// 		repeat (500) begin
// 			#5 clk = ~clk;
// 		end
// 	end
// 	initial begin
// 		$display ("\n\n\t\tInput\t\t\tOutput\t\t\tMDRld");
// 		$monitor ("%0d\t%b\t\t%b\t%b", $time,in, out, MDRld);
// 	end
	
//  endmodule