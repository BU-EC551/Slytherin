`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: YZSU
// 
// Create Date:    20:52:41 03/24/2018 
// Design Name: 
// Module Name:    Example 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

//module TwoScores(clk_mid, score, Dragon_score, two_scores, s, seg);
//	input clk_mid;
//	//input rst;
//	input [15:0] score;
//	input [15:0] Dragon_score;
//	output wire [15:0] two_scores;
//	output wire [3:0] s;
//	output wire [7:0] seg;
//	
//	always@(posedge clk_mid)
//	begin
//	two_scores = score  * 100 + Dragon_score;
//	end
//	
//	BinaryTo7seg uut0(.clk_mid, .rst, .score, .s(s), .seg(seg)); //??
//	BCD uut1(.score(score), .BCDcode(BCDcode_L));
//	MUX_4_to_1 uut2(.in16bits(BCDcode_L), .s(s), .digit(digit_L));
//	SevenSegment uut3(.digit(digit_L), .seg(seg));
//	Fresher uut4(.clk_mid(clk_mid), .s(s), .rst(rst));
//	
//	
//endmodule


module BinaryTo7seg(clk_mid, rst, score, Dragon_score, two_scores, s, seg);
	input clk_mid;
	input rst;
	input [15:0] score;
	input [15:0] Dragon_score;
	output reg [15:0] two_scores;
	output wire [3:0] s;
	output wire [7:0] seg;
	
	wire [15:0] BCDcode_L;
	wire [3:0] digit_L;

	always@(posedge clk_mid)
	begin
		two_scores = score  * 100 + Dragon_score;
	end
	

	BCD uut1(.score(two_scores), .BCDcode(BCDcode_L));
	MUX_4_to_1 uut2(.in16bits(BCDcode_L), .s(s), .digit(digit_L));
	SevenSegment uut3(.digit(digit_L), .seg(seg));
	Fresher uut4(.clk_mid(clk_mid), .s(s), .rst(rst));
	
endmodule	



//module BinaryTo7seg(clk_mid, rst, score, s, seg);
//	input clk_mid;
//	input rst;
//	input [15:0] score;
//	output wire [3:0] s;
//	output wire [7:0] seg;
//	
//	wire [15:0] BCDcode_L;
//	wire [3:0] digit_L;
//	
//	/*
//	BCD uut1(.score(score), .BCDcode(BCDcode_L));
//	MUX_4_to_1 uut2(.in16bits(BCDcode_L), .s(s), .digit(digit_L));
//	SevenSegment uut3(.digit(digit_L), .seg(seg));
//	Fresher uut4(.clk_mid(clk_mid), .s(s), .rst(rst));
//	*/
//endmodule	

module BCD (input [15:0] score, output reg [15:0] BCDcode);
	reg [3:0] Thousands;
	reg [3:0] Hundreds;
	reg [3:0] Tens;
	reg [3:0] Ones;
	integer i;
	
always @ (score)
begin

	Thousands = 4'd0;
	Hundreds = 4'd0;
	Tens = 4'd0;
	Ones = 4'd0;
	
	for (i=10; i>=0; i = i-1)
	begin
	
	
		if (Thousands >= 5)
			Thousands = Thousands +3;
		if (Hundreds >= 5)
			Hundreds = Hundreds + 3;
		if (Tens >= 5)
			Tens = Tens + 3;
		if (Ones >= 5)
			Ones = Ones + 3;
			
			Thousands = Thousands << 1;
			Thousands[0] = Hundreds[3];
			Hundreds = Hundreds << 1;
			Hundreds[0] = Tens[3];
			Tens = Tens << 1;
			Tens[0] = Ones[3];
			Ones = Ones << 1;
			Ones[0] = score[i];
		end
		BCDcode = {Thousands, Hundreds, Tens, Ones};
	end
endmodule


module MUX_4_to_1(in16bits, s, digit);
	input [15:0] in16bits;
   input [3:0]s;
	output reg [3:0] digit;

		 always@(in16bits or s)
		 begin
	
	    case(s)		 
		  7: digit <= in16bits[3:0];    //0111
		 11: digit <= in16bits[7:4];    //1011
		 13: digit <= in16bits[11:8];   //1101
		 14:  digit <= in16bits[15:12]; //1110
		 endcase
		 end
		 
endmodule


module SevenSegment(digit, seg);
	input [3:0] digit;
	output reg [7:0] seg;
	 
   always@(digit)
	begin
	case (digit)
		0 	: seg[7:0] <= 8'b00000011;	//0
		1 	: seg[7:0] <= 8'b10011111;	//1
		2 	: seg[7:0] <= 8'b00100101;	//2
		3 	: seg[7:0] <= 8'b00001101;	//3
		4 	: seg[7:0] <= 8'b10011001;	//4
		5 	: seg[7:0] <= 8'b01001001;	//5
		6 	: seg[7:0] <= 8'b01000001;	//6
		7 	: seg[7:0] <= 8'b00011111;	//7
		8 	: seg[7:0] <= 8'b00000001;	//8
		9 	: seg[7:0] <= 8'b00001001;	//9
		10 : seg[7:0] <= 8'b00010001;  //A
		11 : seg[7:0] <= 8'b11000001;  //b
		12 : seg[7:0] <= 8'b01100011;  //C
		13 : seg[7:0] <= 8'b10000101;  //d
		14 : seg[7:0] <= 8'b01100001;  //E
		15 : seg[7:0] <= 8'b01110001;  //F
    endcase
end
endmodule


module Fresher(clk_mid, s, rst);
	input clk_mid;
	input rst;	
	reg [2:0] state;
	output reg[3:0] s;
		
	always@(posedge clk_mid, posedge rst)
	begin
		if(rst)
			state <= 3'b001;
		else
		begin
			case(state)
			3'b001: begin s <= 4'b1110; state <= 3'b010; end
			3'b010: begin s <= 4'b1101; state <= 3'b011; end
			3'b011: begin s <= 4'b1011; state <= 3'b100; end		
			3'b100: begin s <= 4'b0111; state <= 3'b001; end
			endcase
		end
	end
endmodule
	
/*	
module sevenalternate(bigbin, smallbin, AN, clk1khz);

input [15:0] bigbin;
output reg [3:0] smallbin;
output reg [3:0] AN;
input clk1khz; 
reg [1:0] count; 

initial begin
	AN= 0;
	smallbin=0;
	count=1'b0;
	end
	
always @(posedge clk1khz) begin
				

	case (count)
	2'b00: begin 
		AN=4'b1110;
		smallbin = bigbin[3:0];
		
	end
		
	2'b01: begin 
			AN=4'b1101;
			smallbin=bigbin[7:4];
			end
	
	2'b10: begin 
			AN=4'b1011;
			smallbin=bigbin[11:8];
			end
			
	2'b11: begin 
			AN=4'b0111;
			smallbin=bigbin[15:12];
			end
		default: begin
		
			AN=4'b1111;
			smallbin=0;
			end
		endcase
		count= count+1'b1;
		
end

endmodule
*/