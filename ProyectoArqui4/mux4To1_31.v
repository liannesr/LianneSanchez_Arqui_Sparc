/* Module of Mux 4 to 1 of 31 bits (MuxB, MuxD)
   Programmed by: Lianne Sánchez Rodríguez
   Phase 3 
   Professor: Nestor Rodríguez 
*/
module mux4To1_31(output reg [31:0] outMux, input [31:0] I_0, input [31:0] I_1, input [31:0] I_2,
	input [31:0] I_3, input [1:0] select);
	initial begin
		outMux = 4;
	end
	always @(I_0, I_1, select)
		begin
			case(select)
				2'b00:	outMux <= I_0; 
				2'b01:	outMux <= I_1;
				2'b10:	outMux <= I_2;
				2'b11:	outMux <= I_3;
			endcase // select
		end
endmodule
