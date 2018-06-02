module binaryDecoder(output reg [31:0] exitEncoder, input [4:0] C , input RFld);
	always @(C, RFld) begin
		if (!RFld) begin
			exitEncoder = 0;
		end
		else begin
			case(C)
				5'b00000: exitEncoder = 32'b00000000000000000000000000000001;	
				5'b00001: exitEncoder = 32'b00000000000000000000000000000010;	
				5'b00010: exitEncoder = 32'b00000000000000000000000000000100;
				5'b00011: exitEncoder = 32'b00000000000000000000000000001000;	
				5'b00100: exitEncoder = 32'b00000000000000000000000000010000;
				5'b00101: exitEncoder = 32'b00000000000000000000000000100000;
				5'b00110: exitEncoder = 32'b00000000000000000000000001000000;
				5'b00111: exitEncoder = 32'b00000000000000000000000010000000;
				5'b01000: exitEncoder = 32'b00000000000000000000000100000000;
				5'b01001: exitEncoder = 32'b00000000000000000000001000000000;
				5'b01010: exitEncoder = 32'b00000000000000000000010000000000;
				5'b01011: exitEncoder = 32'b00000000000000000000100000000000;
				5'b01100: exitEncoder = 32'b00000000000000000001000000000000;
				5'b01101: exitEncoder = 32'b00000000000000000010000000000000;
				5'b01110: exitEncoder = 32'b00000000000000000100000000000000;
				5'b01111: exitEncoder = 32'b00000000000000001000000000000000;
				5'b10000: exitEncoder = 32'b00000000000000010000000000000000;
				5'b10001: exitEncoder = 32'b00000000000000100000000000000000;
				5'b10010: exitEncoder = 32'b00000000000001000000000000000000;
				5'b10011: exitEncoder = 32'b00000000000010000000000000000000;
				5'b10100: exitEncoder = 32'b00000000000100000000000000000000;
				5'b10101: exitEncoder = 32'b00000000001000000000000000000000;
				5'b10110: exitEncoder = 32'b00000000010000000000000000000000;
				5'b10111: exitEncoder = 32'b00000000100000000000000000000000;
				5'b11000: exitEncoder = 32'b00000001000000000000000000000000;
				5'b11001: exitEncoder = 32'b00000010000000000000000000000000;
				5'b11010: exitEncoder = 32'b00000100000000000000000000000000;	
				5'b11011: exitEncoder = 32'b00001000000000000000000000000000;
				5'b11100: exitEncoder = 32'b00010000000000000000000000000000;
				5'b11101: exitEncoder = 32'b00100000000000000000000000000000;
				5'b11110: exitEncoder = 32'b01000000000000000000000000000000;
				5'b11111: exitEncoder = 32'b10000000000000000000000000000000;
			endcase
		end
	end // always @(C, RFld)
endmodule

module mux32To1(output reg [31:0] PA, input[4:0] A, input[31:0] E0, input[31:0] E1, input[31:0] E2, input[31:0] E3, input[31:0] E4, input[31:0] E5,
	input[31:0] E6, input[31:0]E7, input[31:0]E8, input[31:0]E9,input[31:0]E10,input[31:0]E11,input[31:0]E12,input[31:0]E13,input[31:0]E14,
	input[31:0]E15, input[31:0]E16, input[31:0]E17, input[31:0]E18, input[31:0]E19, input[31:0]E20, input[31:0]E21, input[31:0]E22, input[31:0]E23,
	input[31:0]E24, input[31:0]E25, input[31:0]E26, input[31:0]E27, input[31:0]E28, input[31:0]E29, input[31:0]E30, input[31:0]E31 );
	always @(A,E0,E1,E2,E3,E4,E5,E6,E7,E8,E9,E10,E11,E12,E13,E14,E15,E16,E17,E18,E19,E20,E21,E22,E23,E24,E25,E26,E27,E28,E29,E30,E31) 
		begin
			case(A)
				5'b00000: PA <= E0; 	
				5'b00001: PA <= E1; 	
				5'b00010: PA <= E2; 
				5'b00011: PA <= E3; 
				5'b00100: PA <= E4; 
				5'b00101: PA <= E5; 
				5'b00110: PA <= E6; 
				5'b00111: PA <= E7; 
				5'b01000: PA <= E8; 
				5'b01001: PA <= E9; 
				5'b01010: PA <= E10; 
				5'b01011: PA <= E11; 
				5'b01100: PA <= E12; 
				5'b01101: PA <= E13; 
				5'b01110: PA <= E14; 
				5'b01111: PA <= E15; 
				5'b10000: PA <= E16; 
				5'b10001: PA <= E17; 
				5'b10010: PA <= E18; 
				5'b10011: PA <= E19; 
				5'b10100: PA <= E20; 
				5'b10101: PA <= E21; 
				5'b10110: PA <= E22; 
				5'b10111: PA <= E23; 
				5'b11000: PA <= E24; 
				5'b11001: PA <= E25; 
				5'b11010: PA <= E26; 
				5'b11011: PA <= E27; 
				5'b11100: PA <= E28; 
				5'b11101: PA <= E29; 
				5'b11110: PA <= E30; 
				5'b11111: PA <= E31; 
		endcase
	end
endmodule
module register32Bit(output reg [31:0] Q, input[31:0] D, input Rld, clk);
	initial begin
		Q <= 0;	
	end
	always @(posedge clk) 
		begin
			if(Rld)begin
				Q <= D;
			end
		end
endmodule

module registerFile(output wire[31:0]PA,output wire[31:0]PB,input [4:0]InDecoder,input [31:0]InRegister,
	input [4:0] MuxA,input [4:0] MuxB, input RFLd, input clk);
	wire [31:0] DecOut;
	wire [31:0] PortA;
	wire [31:0] PortB;
	binaryDecoder BinDec(DecOut,InDecoder,RFLd);

	wire [31:0] R0Out;
	wire [31:0] R1Out;
	wire [31:0] R2Out;
	wire [31:0] R3Out;
	wire [31:0] R4Out;
	wire [31:0] R5Out;
	wire [31:0] R6Out;
	wire [31:0] R7Out;
	wire [31:0] R8Out;
	wire [31:0] R9Out;
	wire [31:0] R10Out;
	wire [31:0] R11Out;
	wire [31:0] R12Out;
	wire [31:0] R13Out;
	wire [31:0] R14Out;
	wire [31:0] R15Out;
	wire [31:0] R16Out;
	wire [31:0] R17Out;
	wire [31:0] R18Out;
	wire [31:0] R19Out;
	wire [31:0] R20Out;
	wire [31:0] R21Out;
	wire [31:0] R22Out;
	wire [31:0] R23Out;
	wire [31:0] R24Out;
	wire [31:0] R25Out;
	wire [31:0] R26Out;
	wire [31:0] R27Out;
	wire [31:0] R28Out;
	wire [31:0] R29Out;
	wire [31:0] R30Out;
	wire [31:0] R31Out;



	register32Bit R0(R0Out,InRegister,DecOut[0],clk);
	register32Bit R1(R1Out,InRegister,DecOut[1],clk);
	register32Bit R2(R2Out,InRegister,DecOut[2],clk);
	register32Bit R3(R3Out,InRegister,DecOut[3],clk);
	register32Bit R4(R4Out,InRegister,DecOut[4],clk);
	register32Bit R5(R5Out,InRegister,DecOut[5],clk);
	register32Bit R6(R6Out,InRegister,DecOut[6],clk);
	register32Bit R7(R7Out,InRegister,DecOut[7],clk);
	register32Bit R8(R8Out,InRegister,DecOut[8],clk);
	register32Bit R9(R9Out,InRegister,DecOut[9],clk);
	register32Bit R10(R10Out,InRegister,DecOut[10],clk);
	register32Bit R11(R11Out,InRegister,DecOut[11],clk);
	register32Bit R12(R12Out,InRegister,DecOut[12],clk);
	register32Bit R13(R13Out,InRegister,DecOut[13],clk);
	register32Bit R14(R14Out,InRegister,DecOut[14],clk);
	register32Bit R15(R15Out,InRegister,DecOut[15],clk);
	register32Bit R16(R16Out,InRegister,DecOut[16],clk);
	register32Bit R17(R17Out,InRegister,DecOut[17],clk);
	register32Bit R18(R18Out,InRegister,DecOut[18],clk);
	register32Bit R19(R19Out,InRegister,DecOut[19],clk);
	register32Bit R20(R20Out,InRegister,DecOut[20],clk);
	register32Bit R21(R21Out,InRegister,DecOut[21],clk);
	register32Bit R22(R22Out,InRegister,DecOut[22],clk);
	register32Bit R23(R23Out,InRegister,DecOut[23],clk);
	register32Bit R24(R24Out,InRegister,DecOut[24],clk);
	register32Bit R25(R25Out,InRegister,DecOut[25],clk);
	register32Bit R26(R26Out,InRegister,DecOut[26],clk);
	register32Bit R27(R27Out,InRegister,DecOut[27],clk);
	register32Bit R28(R28Out,InRegister,DecOut[28],clk);
	register32Bit R29(R29Out,InRegister,DecOut[29],clk);
	register32Bit R30(R30Out,InRegister,DecOut[30],clk);
	register32Bit R31(R31Out,InRegister,DecOut[31],clk);

	mux32To1 muxA(PA,MuxA,R0Out,R1Out,R2Out,R3Out,R4Out,R5Out,R6Out,R7Out,R8Out,R9Out,R10Out,R11Out,R12Out,R13Out,R14Out,R15Out,R16Out,
					R17Out,R18Out,R19Out,R20Out,R21Out,R22Out,R23Out,R24Out,R25Out,R26Out,R27Out,R28Out,R29Out,R30Out,R31Out);
	mux32To1 muxB(PB,MuxB,R0Out,R1Out,R2Out,R3Out,R4Out,R5Out,R6Out,R7Out,R8Out,R9Out,R10Out,R11Out,R12Out,R13Out,R14Out,R15Out,R16Out,
					R17Out,R18Out,R19Out,R20Out,R21Out,R22Out,R23Out,R24Out,R25Out,R26Out,R27Out,R28Out,R29Out,R30Out,R31Out);

	always @(posedge clk) begin
		//$display("R1_out %b", R1Out);
		//$display("R2_out %b", R2Out);
		//display("R5_out %b", R5Out);
	end // always @(posedge clk)
endmodule
