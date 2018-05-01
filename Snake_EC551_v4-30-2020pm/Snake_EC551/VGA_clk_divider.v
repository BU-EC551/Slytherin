`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:34:21 03/24/2018 
// Design Name: 
// Module Name:    VGA_clk_divider 
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
module VGA_clk_divider(VGA_clk, clk);
input clk;
output reg VGA_clk = 0;
		
reg [1:0] k=0;
		
		always@(posedge clk)
		begin
		
		k <= k + 2'b01;
		VGA_clk <= k[1];
		end
		
endmodule
