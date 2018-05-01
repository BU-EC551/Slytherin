`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:06:01 03/24/2018
// Design Name:   VGA
// Module Name:   X:/Desktop/Snake_EC551/Snake_EC551/VGA_tb.v
// Project Name:  Snake_EC551
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VGA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module VGA_tb;

	// Inputs
	reg VGA_clock;

	// Outputs
	wire HS;
	wire VS;
	wire [10:0] hcount;
	wire [10:0] vcount;
	wire blank;

	// Instantiate the Unit Under Test (UUT)
	VGA uut (
		.VGA_clock(VGA_clock), 
		.HS(HS), 
		.VS(VS), 
		.hcount(hcount), 
		.vcount(vcount), 
		.blank(blank)
	);

	initial begin
		// Initialize Inputs
		VGA_clock = 0;

		// Wait 100 ns for global reset to finish
		#1000;
        
		// Add stimulus here

	end
	
	always begin
	#10;
	VGA_clock = ~VGA_clock;
	end
      
endmodule

