/* Module of DataType
   Programmed by: Lianne Sánchez Rodríguez
   Phase 3 
   Professor: Nestor Rodríguez 
*/

module dataType(output reg [1:0] size, output reg sign, input [5:0] op3, input [4:0] state);

	always @(*)
		begin
			if(state==1 || state==2 || state==3 || state==4)
			begin
				$display("IM HERE BEOTCH");
				sign<=0;
				size<=2'b10;
			end 
			else
			begin
			case(op3)
				6'b001001:						// LOAD SIGNED BYTE
					begin
						sign <= 1;
						size <= 2'b00;
					end
				6'b001010:						// LOAD SIGNED HALFWORD
					begin
						sign <= 1;
						size <= 2'b01;						
					end
				6'b000001:						// LOAD UNSIGNED BYTE
					begin
						sign <= 0;
						size <= 2'b00;						
					end
				6'b000010:						// LOAD UNSIGNED HALFWORD
					begin
						sign <= 0;
						size <= 2'b01;						
					end
				6'b000000:						// LOAD WORD
					begin
						sign <= 0;
						size <= 2'b10;
					end
				6'b000101:						// STORE BYTE
					begin
						sign <= 0;
						size <= 2'b00;						
					end
				6'b000110:						// STORE HALFWORD
					begin
						sign <= 0;
						size <= 2'b01;						
					end
				6'b000100:						// STORE WORD 
					begin
						sign <= 0;
						size <= 2'b10;						
					end 
			endcase // op3
		end
	end
endmodule // dataType

// module dataTypemem; 
// 	// Inputs of ALU
	
// 	reg [5:0] op3;
// 	//Outputs of ALU module
// 	wire [1:0] size;
// 	wire sign;
// 	//test duration
// 	parameter stop_time = 10090;

// 	dataType memType(size, sign, op3);
// 	initial #stop_time $finish;

// 	initial begin

	
// 	#10 op3=6'b000101;
//  	#20 op3= 6'b001010; 
//  	#30 op3= 6'b000010; 
//  	#40 op3= 6'b000000; 

// 	end
// 	initial begin
// 		$display ("\n\n\top3\t\tSize\t\tSign");
// 		$monitor ("%0d\t%b\t\t%b\t\t%b", $time, op3, size, sign);
// 	end
	
//	endmodule