/* Module of Arithmetic Logic Unit 
   Programmed by: Lianne Sánchez Rodríguez
   Phase 1 
   Professor: Nestor Rodríguez 
*/
module ALU (output reg [31:0]  Out, output reg N,Z,V,C, input [31:0] Ain, Bin, input [5:0] Op3, input Cin); 
	initial begin
		Out <= 32'h00000000;
	end
	always @(Op3, Ain, Bin, Cin)						//Do when any of the inputs change 
		begin
			case(Op3) 
				6'b111111: begin
				 // 	$display("Bin, %b", Bin);
								
					// $display("PC %b", dPath.pc_out-4);
					 //$display("Multiplication %b", $signed(Bin)*4);
					Out[31:0]<= $signed(dPath.pc_out-3'b100)-($signed(Bin))*$signed(3'b100);
					//$display("N %b, Z %b, V %b, C %b", N,Z,V,C);
					//Out[31:0]<= $signed(dPath.pc_out-3'sb100)-($signed(Bin)*3'sb100);
					//$display("out %d", Out);
					//$display("out %b", Out);

				end // 6'b111111:
				6'b111010: begin Out <= Bin + 4;  end// 6'b000010:
				6'b000000: Out <= Ain + Bin; 			//ADD -- Adds 2 32-bit inputs
				6'b010000: begin
							{C,Out} = Ain + Bin; 		//ADDcc -- Adds 2 32-bit inputs modifying icc
							flagCheckAdd();				//Calling to check flags for addition
							end
				6'b001000: Out = Ain + Bin + Cin; 		//ADDX -- Adds 2 32-bit input and the 1 bit carry in
				6'b011000: begin					
							{C,Out} = Ain + Bin + Cin; 	//ADDXcc -- Adds 2 32-bit input and the 1 bit carry in, icc
							flagCheckAdd();				//Calling to check flags for addition
							end
				6'b000100: Out = Ain - Bin; 			//SUB -- Substracts 2 32-bit input
				6'b010100: begin
							{C,Out} <= Ain - Bin; 		//SUBcc -- Substracts 2 32-bit input, icc
							flagCheckSub();				//Calling to check flags for substraction
							//$display("Bin %b, Ain %b, Out%b", Bin, Ain,Out);

							end
				6'b001100: Out = Ain - Bin - Cin; 		//SUBX -- Substracts 2 32-bit input and carry in
				6'b011100: begin
							{C,Out} = Ain - Bin - Cin; 	//SUBXcc -- Substracts 2 32-bit input and carry in, icc
							flagCheckSub();				//Calling to check flags for substraction
							end 
				6'b000001: Out = Ain & Bin; 			//AND -- Bitwise AND | Ain^Bin
				6'b010001: begin
							Out = Ain & Bin; 			//ANDcc -- Bitwise AND,icc | Ain^Bin
							flagCheckLog();				//Calling to check flags for logical operations
							end
				6'b000101: Out = Ain & (~Bin); 			//ANDN -- Bitwise AND Not | Ain ^ (!Bin)
				6'b010101: begin
							Out = Ain & (~Bin); 		//ANDNcc -- Bitwise AND Not,icc | Ain ^ (!Bin)
							flagCheckLog();				//Calling to check flags for logical operations
							end
				6'b000010: Out = Ain | Bin; 			//OR -- Bitwise OR | Ain OR Bin
				6'b010010: begin
							Out = Ain | Bin; 			//ORcc -- Bitwise OR,icc | Ain OR Bin
							flagCheckLog();				//Calling to check flags for logical operations
							end
				6'b000110: Out = Ain | (~Bin); 			//ORN -- Bitwise OR NOT | Ain OR (~Bin)
				6'b010110: begin
							Out = Ain | (~Bin); 		//ORNcc -- Bitwise OR NOT,icc | Ain OR (~Bin)
							flagCheckLog();				//Calling to check flags for logical operations
							end
				6'b000011: Out = Ain ^ Bin; 			//XOR -- Bitwise XOR 
				6'b010011: begin
							Out = Ain ^ Bin; 			//XORcc -- Bitwise XOR,icc
							flagCheckLog();				//Calling to check flags for logical operations
							end
				6'b000111: Out = Ain ^ (~Bin); 			//XNOR -- Bitwise XOR NOT
				6'b010111: begin
							Out = Ain ^ (~Bin); 		//XNORcc -- Bitwise XOR NOT, icc
							flagCheckLog();				//Calling to check flags for logical operations
							end 
				6'b100101: Out = Ain << Bin[4:0];		//SLL -- Shift to the Left
				6'b100110: Out = Ain >> Bin[4:0];		//SRL -- Shift to the Right
				6'b100111: Out = $signed(Ain) >>> Bin[4:0];//SRA -- Shift to the Right Arithmetic
				//LIANNE SPECIAL CODES
		
				6'b110011: begin Out <= Bin; end // 6'b110011:
				//6'b100101:
				//6'b111000:
				6'b001010: begin Out <= Bin; end

				//6'b111110:
				//6'b111100:
			endcase // Op3
		end

	task flagCheckAdd;
		begin
			if (Out==0) //Checking for zero flag 
				Z=1;
			else Z=0;

			if(Out[31]==1) //Checking for negative flag
				N=1;
			else N=0;

			if(Ain[31]==Bin[31] && Ain[31]!=Out[31]) //Checking for overflow flag addition
				V=1;
			else V=0;
		end
	endtask 

	task flagCheckSub;
		begin
			if (Out==0) //Checking for zero flag 
				Z=1;
			else Z=0;

			if(Out[31]==1) //Checking for negative flag
				N=1;
			else N=0;

			if(Ain[31]!=Bin[31] && Ain[31]!=Out[31]) //Checking for overflow flag subtraction
				V=1;
			else V=0;
		end
	endtask 
	task flagCheckLog;
		begin
			if (Out==0) //Checking for zero flag 
				Z=1;
			else Z=0;

			if(Out[31]==1) //Checking for negative flag
				N=1;
			else N=0;
			C=0;
			V=0;
		end
	endtask 
endmodule

// module ALU_test;
// 	// Inputs of ALU
// 	reg [31:0] A_in, B_in;
// 	reg [5:0] OpCode;
// 	// Carry that goes into the ALU
// 	reg carry;
// 	//Outputs of ALU module
// 	wire [31:0] result;
// 	wire C_flag;
// 	wire N_flag;
// 	wire Z_flag;
// 	wire V_flag;

// 	reg [8*8:1] intr;
// 	//test duration
// 	parameter stop_time = 1090;

// 	ALU A1(result, N_flag, Z_flag, V_flag, C_flag, A_in, B_in, OpCode, carry);
// 	initial #stop_time $finish;

// 	initial begin

// 	//ADD
// 	#0 A_in = 32'h0000000F; B_in = 32'hF0000000; OpCode = 6'b000000; carry = 1'b0; intr = "ADD";
// 	//ADDcc
// 	#10 A_in = 32'h8000000F; B_in = 32'hF0000000; OpCode = 6'b010000; carry = 1'b1; intr = "ADDcc";
// 	//ADDX
// 	#10 A_in = 32'h8000000F; B_in = 32'hF0000000; OpCode = 6'b001000; carry = 1'b1; intr = "ADDX";
// 	//ADDXcc
// 	#10 A_in = 32'h8000000F; B_in = 32'hF0000000; OpCode = 6'b011000; carry = 1'b1; intr = "ADDXcc";
// 	//SUB
// 	#20 A_in = 32'h8000000F; B_in = 32'h90000000; OpCode = 6'b000100; carry = 1'b0; intr = "SUB";
// 	//SUBcc
// 	#20 A_in = 32'h8000000F; B_in = 32'h90000000; OpCode = 6'b010100; carry = 1'b0; intr = "SUBcc";
// 	//SUBX
// 	#20 A_in = 32'h8000000F; B_in = 32'hF0000000; OpCode = 6'b001100; carry = 1'b1; intr = "SUBX";
// 	//SUBXcc
// 	#20 A_in = 32'h8000000F; B_in = 32'h50000000; OpCode = 6'b011100; carry = 1'b1; intr = "SUBXcc";
// 	//AND
// 	#30 A_in = 32'h8000000F; B_in = 32'h00000000; OpCode = 6'b000001; carry = 1'b1; intr = "AND";
// 	//ANDcc
// 	#30 A_in = 32'h8000000F; B_in = 32'hF0000000; OpCode = 6'b010001; carry = 1'b1; intr = "ANDcc";
// 	//ANDN
// 	#30 A_in = 32'h8000000F; B_in = 32'hF0000000; OpCode = 6'b000101; carry = 1'b1; intr = "ANDN";
// 	//ANDNcc
// 	#30 A_in = 32'h8000000F; B_in = 32'hF0000000; OpCode = 6'b010101; carry = 1'b1; intr = "ANDNcc";
// 	//OR
// 	#30 A_in = 32'h8000000F; B_in = 32'hF0000000; OpCode = 6'b000010; carry = 1'b1; intr = "OR";
// 	//ORcc
// 	#30 A_in = 32'h8000000F; B_in = 32'hF0000000; OpCode = 6'b010010; carry = 1'b1; intr = "ORcc";
// 	//ORN
// 	#30 A_in = 32'h8000000F; B_in = 32'hF0000000; OpCode = 6'b000110; carry = 1'b1; intr = "ORN";
// 	//ORNcc
// 	#30 A_in = 32'h8000000F; B_in = 32'hF0000000; OpCode = 6'b010110; carry = 1'b1; intr = "ORNcc";
// 	//XOR
// 	#30 A_in = 32'h8000000F; B_in = 32'hF0000000; OpCode = 6'b000011; carry = 1'b1; intr = "XOR";
// 	//XORcc
// 	#30 A_in = 32'h8000000F; B_in = 32'hF0000000; OpCode = 6'b010011; carry = 1'b1; intr = "XORcc";
// 	//XNOR
// 	#30 A_in = 32'h8000000F; B_in = 32'hF0000000; OpCode = 6'b000111; carry = 1'b1; intr = "XNOR";
// 	//XNORcc
// 	#30 A_in = 32'h8000000F; B_in = 32'hF0000000; OpCode = 6'b010111; carry = 1'b1; intr = "XNORcc";
// 		//SLL
// 	#10 A_in = 32'hA0000000; B_in = 32'h00000004; OpCode = 6'b100101; carry = 1'b0; intr = "SLL";
// 	//SRL
// 	#10 A_in = 32'hA0000000; B_in = 32'h0000000A; OpCode = 6'b100110; carry = 1'b0; intr = "SRL";
// 	//SRA
// 	#10 A_in = 32'hA0000000; B_in = 32'h00000004; OpCode = 6'b100111; carry = 1'b0; intr = "SRA";

// 	end
	
// 	initial begin
// 		$display ("\n\nTime\tAin\t\tBin\t\tcarry\topcode\t\t\tN\tZ\tC\tV\t\tResult\n");
// 		$monitor ("%0d\t%h\t%h\t%b\t%b\t%s\t%b\t%b\t%b\t%b\t\t%h\t", $time, A_in, B_in, carry, OpCode, intr, N_flag, Z_flag, C_flag, V_flag, result);
// 	end
	
// endmodule

