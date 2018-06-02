/* Module of Mux 4 to 1 of 1 bit
   Programmed by: Lianne Sánchez Rodríguez
   Phase 3 
   Professor: Nestor Rodríguez 
*/
module mux4To1_1(output reg outMux, input I_0, input I_1, input I_2, input I_3, input S1, S0);
	initial begin
		outMux = 0;
	end // initial
	always @(I_0,I_1,S1,S0)
		begin
			if(S1 == 0 & S0 == 0)
				begin
					outMux = I_0;
				end
			if(S1 == 0 & S0 == 1)
				begin
					outMux = I_1;
				end
			if(S1 == 1 & S0 == 0)
				begin
					outMux = I_2;
				end
			if(S1 == 1 & S0 == 1)
				begin
					outMux = I_3;
				end
		end
endmodule

