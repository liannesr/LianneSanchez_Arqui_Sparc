/* Module of RAM
   Programmed by: Lianne Sánchez Rodríguez
   Phase 3 
   Professor: Nestor Rodríguez 
*/
/* Module of DataType
   Programmed by: Lianne Sánchez Rodríguez
   Phase 3 
   Professor: Nestor Rodríguez 
*/

// module dataType(output reg [1:0] size, output reg sign, input [5:0] op3);
// 	always @(op3)
// 		begin
// 			case(op3)
// 				6'b001001:						// LOAD SIGNED BYTE
// 					begin
// 						sign <= 1;
// 						size <= 2'b00;
// 					end
// 				6'b001010:						// LOAD SIGNED HALFWORD
// 					begin
// 						sign <= 1;
// 						size <= 2'b01;						
// 					end
// 				6'b000001:						// LOAD UNSIGNED BYTE
// 					begin
// 						sign <= 0;
// 						size <= 2'b00;						
// 					end
// 				6'b000010:						// LOAD UNSIGNED HALFWORD
// 					begin
// 						sign <= 0;
// 						size <= 2'b01;						
// 					end
// 				6'b000000:						// LOAD WORD
// 					begin
// 						sign <= 0;
// 						size <= 2'b10;
// 					end
// 				6'b000101:						// STORE BYTE
// 					begin
// 						sign <= 0;
// 						size <= 2'b00;						
// 					end
// 				6'b000110:						// STORE HALFWORD
// 					begin
// 						sign <= 0;
// 						size <= 2'b01;						
// 					end
// 				6'b000100:						// STORE WORD 
// 					begin
// 						sign <= 0;
// 						size <= 2'b10;						
// 					end 
// 			endcase // op3
// 		end

// endmodule // dataType

module ram(output reg [31:0] dataOut, output reg MOC, input RW, MOV, sign, enable, input [1:0] size, 
	input [31:0] dataIn, input [31:0] address, input precharge);
	reg [7:0] Mem[0:511];
	reg [8:0] in_address;
	reg [8:0] Start_address;
	//reg [1:0] size;
	reg [7:0] data;
	integer textFile, codeFile;
	initial begin
		//MOC <= 0;
			textFile = $fopenr("testcode_sparc1.txt");
			Start_address = 9'b000000000;
			while(!$feof(textFile)) begin
				codeFile= $fscanf(textFile, "%b", data);
				Mem[Start_address] = data;
//				$display("Mem[%d] %d",Start_address, data);
				Start_address = Start_address + 1;
			end 
			$fclose(textFile);
	end // initial

		always @(MOV, address)
			begin
				MOC <= 0;
				in_address <= address[8:0];
				begin
					if(MOV==1)
						begin
							if(RW==1)
								begin
									dataOut = 32'b00000000000000000000000000000000;
									case(size)
										2'b00: 
											begin
											dataOut[7:0] = Mem[in_address];
											//$display("Memory: %b" , Mem[in_address]);
											if(sign==1 && dataOut[7]==1) 
												begin
													dataOut[31:8] = 24'b111111111111111111111111;
												end
											//MOC <= 1;
											//else
											//	dataOut[31:8] <=24'b000000000000000000000000;
											end
										2'b01: 
											begin
												dataOut[15:8] = Mem[in_address];
												dataOut[7:0] = Mem[in_address+1];
												if(sign==1 && dataOut[15]==1)
													begin
														dataOut[31:16] = 16'b1111111111111111;
													end
												//MOC <= 1;
											end 	
										2'b10: 
											begin
												dataOut[31:24] = Mem[in_address];
												dataOut[23:16] = Mem[in_address+1];
												dataOut[15:8] = Mem[in_address+2];
												dataOut[7:0] = Mem[in_address+3];
											//	MOC <= 1;
											end

									endcase
									//$display("DATA OUT: %b", dataOut);
									//$display("In_address: %b", in_address);
									//MOC <= 1;
								end
								else if(RW==0)
									begin
										case(size)
											2'b00: Mem[in_address] <= dataIn[7:0];
											2'b01: {Mem[in_address],Mem[in_address+1]} <= dataIn[15:0];
											2'b10: {Mem[in_address],Mem[in_address+1],Mem[in_address+2],Mem[in_address+3]} <= dataIn;
										endcase // dataType
										$display("Mem[%d] %d",in_address, Mem[in_address]);
										$display("Mem[%d] %d",in_address+1, Mem[in_address+1]);
										$display("Mem[%d] %d",in_address+2, Mem[in_address+2]);
										$display("Mem[%d] %d",in_address+3, Mem[in_address+3]);
										//MOC <= 1;
									end

							 MOC <=1;
						end
				end
				
			end 
endmodule // ram
