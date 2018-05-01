`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:45:35 03/26/2018 
// Design Name: 
// Module Name:    LED_clk_divider 
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
module LED_clk_divider(clk, clk_mid);
		input clk;
		output reg clk_mid = 0;
		
		reg [15:0] k=0;
		
		always@(posedge clk)
		begin
		
		if(k == 50000) 
		begin
		
		k <=0;
		clk_mid <= ~clk_mid;end	

		else begin
		k <= k+1;
		end
		
		end
		
		
		


endmodule
