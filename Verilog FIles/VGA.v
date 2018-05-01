`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:15:58 03/24/2018 
// Design Name: 
// Module Name:    VGA 
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
module VGA(VGA_clock, HS, VS, hcount, vcount, blank);
	
	input VGA_clock;
	output reg HS, VS;
	output reg blank;
	output reg [10:0] hcount = 0;
	output reg [10:0] vcount = 0;
	
	parameter HMAX = 800; 	// maximum value for the horizontal pixel counter
	parameter VMAX = 525; 	// maximum value for the vertical pixel counter
	parameter HLINES = 640;	// total number of visible columns
	parameter HFP = 648; 	// value for the horizontal counter where front porch ends
	parameter HSP = 744; 	// value for the horizontal counter where the synch pulse ends
	parameter VLINES = 480;	// total number of visible lines
	parameter VFP = 482; 	// value for the vertical counter where the frone proch ends
	parameter VSP = 484; 	// value for the vertical counter where the synch pulse ends
	parameter SPP = 0;		// value for the porch synchronization pulse
	
	wire valid;
	
	always@(posedge VGA_clock) begin
	
	blank <= ~valid;
	
	end
	
	
	always@(posedge VGA_clock)	begin
	
		if(hcount == HMAX) hcount <= 0;
		else hcount <= hcount + 1'b1;
	end
	
	always@(posedge VGA_clock) begin
		if(hcount == HMAX) begin
			if(vcount == VMAX) vcount <= 0;
			else vcount <= vcount + 1'b1;
		end
	end
	
	always@(posedge VGA_clock) begin
		if(hcount >= HFP && hcount < HSP) HS <= SPP;
		else HS <= ~SPP; 
	end

	always@(posedge VGA_clock) begin
		if(vcount >= VFP && vcount < VSP) VS <= SPP;
		else VS <= ~SPP; 
	end	
	
	assign valid = (hcount < HLINES && vcount < VLINES) ? 1'b1 : 1'b0;
	



endmodule
