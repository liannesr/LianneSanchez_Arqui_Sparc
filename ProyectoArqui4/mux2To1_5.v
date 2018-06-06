/* Module of Mux 2 to 1 of 5 bits (MuxG)
   Programmed by: Lianne Sánchez Rodríguez
   Phase 3 
   Professor: Nestor Rodríguez 
*/
module mux2To1_5(output reg [4:0] outMux, input [4:0] I_0, input [4:0] I_1, input select);
	
	always @(I_0, I_1, select)
		begin
			#1;
			case(select)
				1'b0:	outMux <= I_0; 
				1'b1:	outMux <= I_1;
			endcase // select
		end
endmodule
