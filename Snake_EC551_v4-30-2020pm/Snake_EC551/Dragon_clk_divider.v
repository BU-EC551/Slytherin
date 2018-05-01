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
module Dragon_clk_divider(Dragon_clk, clk, Dragon_speedup);
input Dragon_speedup;
input clk;
output reg Dragon_clk = 0;
		
reg [24:0] k=0;
		
		always@(posedge clk) begin
		if(Dragon_speedup == 0) begin
		k <= k + 25'b1;
		Dragon_clk <= k[24];
		end
		
		else begin
		k <= k + 25'b1;
		Dragon_clk <= k[23];
		end
		
		end

endmodule