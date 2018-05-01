`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:15:48 03/26/2018
// Design Name:   Snake_TOP
// Module Name:   X:/Desktop/Snake_EC551/Snake_EC551/TOP_tb.v
// Project Name:  Snake_EC551
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Snake_TOP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TOP_tb;

	// Inputs
	reg clk;
	reg up;
	reg down;
	reg left;
	reg right;
	reg rst;

	// Outputs
	wire HS_L;
	wire VS_L;
	wire R0;
	wire R1;
	wire R2;
	wire G0;
	wire G1;
	wire G2;
	wire B0;
	wire B1;
	wire [3:0] s_L;
	wire [7:0] seg_L;

	// Instantiate the Unit Under Test (UUT)
	Snake_TOP uut (
		.clk(clk), 
		.HS_L(HS_L), 
		.VS_L(VS_L), 
		.R0(R0), 
		.R1(R1), 
		.R2(R2), 
		.G0(G0), 
		.G1(G1), 
		.G2(G2), 
		.B0(B0), 
		.B1(B1), 
		.up(up), 
		.down(down), 
		.left(left), 
		.right(right), 
		.rst(rst), 
		.s_L(s_L), 
		.seg_L(seg_L)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		up = 0;
		down = 0;
		left = 0;
		right = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		rst = 1;
		#100;
		rst = 0;
		
		
        
		// Add stimulus here

	end
	always begin 
	#10;
	clk = ~clk;
	end
      
endmodule

