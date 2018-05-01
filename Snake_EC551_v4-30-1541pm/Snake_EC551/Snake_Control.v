`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:49:43 03/24/2018 
// Design Name: 
// Module Name:    Snake_Control 
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
module Snake_Control(Snake_clk, rst);

input Snake_clk, rst;

reg [10:0] x, y, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, x8, y8, x9, y9, 
x10, y10, x11, y11, x12, y12, x13, y13, x14, y14, x15, y15, x16, y16, x17, y17, x18, y18,
x19, y19, x20, y20, x21, y21, x22, y22, x23, y23, x24, y24, x25, y25;


always @(posedge Snake_clk) begin

if(rst == 1'b1) begin









endmodule
