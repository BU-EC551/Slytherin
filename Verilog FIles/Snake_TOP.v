`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:32:45 03/24/2018 
// Design Name: 
// Module Name:    Snake_TOP 
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
module Snake_TOP(clk, HS_L, VS_L, R0, R1, R2, G0, G1, G2, B0,B1,CLK,data,led,rst, s_L, seg_L, switch);

reg up;
reg down;
reg left;
reg right;



input  switch;
input  data;
output  [7:0] led;
wire [7:0] dataout;
input clk, CLK, rst;
output wire HS_L, VS_L;


output reg R0,R1,R2,G0,G1,G2,B0,B1;


wire VGA_clk_L;
wire blank_L;
wire [10:0] hcount_L;
wire [10:0] vcount_L;
wire Snake_clk_L;
reg snakehead;
reg snakeEye0;
reg snakeEye1; 
reg foodbar;
reg letter1;
reg barrier0, barrier1, barrier2;
reg wall0, wall1, wall2, wall3;  // signal of whether there is wall
reg food; // signal of whether there is food
reg go_up, go_down, go_left, go_right; // up, down, left, right directions
reg [3:0] state;
reg [3:0] next_state;
reg [10:0] x, y, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, x8, y8, x9, y9, 
x10, y10, x11, y11, x12, y12, x13, y13, x14, y14, x15, y15, x16, y16, x17, y17, x18, y18,
x19, y19, x20, y20, x21, y21, x22, y22, x23, y23, x24, y24, x25, y25;
reg snakesegment1, snakesegment2, snakesegment3, snakesegment4, snakesegment5, snakesegment6,
snakesegment7, snakesegment8, snakesegment9, snakesegment10, snakesegment11, snakesegment12,
snakesegment13, snakesegment14, snakesegment15, snakesegment16, snakesegment17, snakesegment18, 
snakesegment19, snakesegment20, snakesegment21, snakesegment22, snakesegment23, snakesegment24,
snakesegment25;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
reg dragon_Eye0;
reg dragon_Eye1;
reg dragon_head;
reg dragon_up;
reg dragon_down;
reg dragon_left;
reg dragon_right;
reg dragon_segment1,dragon_segment2,dragon_segment3,dragon_segment4,dragon_segment5,dragon_segment6,dragon_segment7,dragon_segment8,dragon_segment9,
dragon_segment10,dragon_segment11,dragon_segment12,dragon_segment13,dragon_segment14,dragon_segment15,dragon_segment16,dragon_segment17,dragon_segment18,dragon_segment19,
dragon_segment20,dragon_segment21,dragon_segment22,dragon_segment23,dragon_segment24,dragon_segment25;
reg dragon_go_up, dragon_go_down, dragon_go_left, dragon_go_right;
reg [10:0] dx, dy, dx1, dy1, dx2, dy2, dx3, dy3, dx4, dy4, dx5, dy5, dx6, dy6, dx7, dy7, dx8, dy8, dx9, dy9, 
dx10, dy10, dx11, dy11, dx12, dy12, dx13, dy13, dx14, dy14, dx15, dy15, dx16, dy16, dx17, dy17, dx18, dy18,
dx19, dy19, dx20, dy20, dx21, dy21, dx22, dy22, dx23, dy23, dx24, dy24, dx25, dy25;
reg [3:0] dragon_state;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
reg k0,k1,k2,k3,k4,k5,k6,k7,O0,O1,O2,O3,d0,d1;
reg kk0,kk1,kk2,kk3,kk4,kk5,kk6,kk7,OO0,OO1,OO2,OO3,dd0,dd1;
reg die0,die1,die2,die3,die4,die5,die6,die7,die8,die9,die10,die11,die12,die13,die14,die15,die16,die17,die18;
reg green_die0,green_die1,green_die2,green_die3,green_die4,green_die5,green_die6,green_die7,green_die8,green_die9,green_die10,green_die11,green_die12,green_die13,green_die14,green_die15,green_die16,green_die17,green_die18;
reg dieflag = 0;
reg green_dieflag = 0;
reg [15:0] foodxcount, foodycount;
reg [10:0] foodx, foody;
reg [15:0] itemxcount, itemycount;
reg [10:0] itemx, itemy; 
reg [15:0] dragon_score = 0;//b
reg [15:0] score = 0;//g
wire [15:0] score_to_wire_L; // the wire used to connect different modules
wire [15:0] Dragon_score_to_wire_L;
wire clk_mid_L;
reg powerup_item;
reg speedup ;
wire speedup_L;
wire Dragon_clk_L;
reg dragon_speedup;
wire Dragon_speedup_L;
output wire [3:0] s_L;
output wire [7:0] seg_L;

assign score_to_wire_L = score;
assign Dragon_score_to_wire_L = dragon_score;
assign speedup_L = speedup;
assign Dragon_speedup_L = dragon_speedup;

keyboardtest uut5(.clk(CLK), .data(data), .led(led), .dataout(dataout)); 
VGA_clk_divider uut0(.VGA_clk(VGA_clk_L), .clk(clk));
VGA uut1(.VGA_clock(VGA_clk_L), .HS(HS_L), .VS(VS_L), .hcount(hcount_L), .vcount(vcount_L), .blank(blank_L));
Snake_clk_divider uut2(.Snake_clk(Snake_clk_L), .clk(clk),.speedup(speedup_L));
Dragon_clk_divider uut6(.Dragon_clk(Dragon_clk_L), .clk(clk), .Dragon_speedup(Dragon_speedup_L));
BinaryTo7seg uut3(.clk_mid(clk_mid_L), .rst(rst), .score(score_to_wire_L), .Dragon_score(Dragon_score_to_wire_L), .s(s_L), .seg(seg_L));
LED_clk_divider uut4(.clk(clk), .clk_mid(clk_mid_L));
 


always@(posedge clk) begin

if(rst) begin
score = 0;
speedup = 0;
dragon_speedup = 0;
//////////////////
dragon_score = 0;
//////////////////
dieflag = 0;

green_dieflag = 0;
end




wall0 <= ~blank_L & (hcount_L >= 1 & hcount_L <= 639 & vcount_L >= 1 & vcount_L <= 19);
wall1 <= ~blank_L & (hcount_L >= 1 & hcount_L <= 639 & vcount_L >= 461 & vcount_L <= 479);
wall2 <= ~blank_L & (hcount_L >= 1 & hcount_L <= 19 & vcount_L >= 1 & vcount_L <= 479);
wall3 <= ~blank_L & (hcount_L >= 621 & hcount_L <= 639 & vcount_L >= 1 & vcount_L <= 479);  // THE OBSTACLES

if(switch == 1) begin
barrier0 <= ~blank_L & (hcount_L >= 170 & hcount_L <= 360 & vcount_L >= 150 & vcount_L <= 160);
barrier1 <= ~blank_L & (hcount_L >= 230 & hcount_L <= 420 & vcount_L >= 230 & vcount_L <= 240);
barrier2 <= ~blank_L & (hcount_L >= 290 & hcount_L <= 480 & vcount_L >= 310 & vcount_L <= 320);
end


if(green_dieflag == 1) begin
green_die0 <= ~blank_L & (hcount_L >= 200 & hcount_L <= 210 & vcount_L >= 190 & vcount_L <= 270);
green_die1 <= ~blank_L & (hcount_L >= 210 & hcount_L <= 223 & vcount_L >= 255 & vcount_L <= 270);
green_die2 <= ~blank_L & (hcount_L >= 223 & hcount_L <= 236 & vcount_L >= 240 & vcount_L <= 255);
green_die3 <= ~blank_L & (hcount_L >= 236 & hcount_L <= 242 & vcount_L >= 220 & vcount_L <= 240);
green_die4 <= ~blank_L & (hcount_L >= 223 & hcount_L <= 236 & vcount_L >= 205 & vcount_L <= 220); 
green_die5 <= ~blank_L & (hcount_L >= 210 & hcount_L <= 223 & vcount_L >= 190 & vcount_L <= 205);  // D

green_die6 <= ~blank_L & (hcount_L >= 267 & hcount_L <= 277 & vcount_L >= 200 & vcount_L <= 260);  
green_die7 <= ~blank_L & (hcount_L >= 254 & hcount_L <= 290 & vcount_L >= 260 & vcount_L <= 270);  
green_die8 <= ~blank_L & (hcount_L >= 254 & hcount_L <= 290 & vcount_L >= 190 & vcount_L <= 200);  // I

green_die9  <= ~blank_L & (hcount_L >= 304 & hcount_L <= 314 & vcount_L >= 190 & vcount_L <= 270);
green_die10 <= ~blank_L & (hcount_L >= 314 & hcount_L <= 340 & vcount_L >= 258 & vcount_L <= 270);
green_die11 <= ~blank_L & (hcount_L >= 314 & hcount_L <= 340 & vcount_L >= 224 & vcount_L <= 236);
green_die12 <= ~blank_L & (hcount_L >= 314 & hcount_L <= 340 & vcount_L >= 190 & vcount_L <= 202); // E

green_die13 <= ~blank_L & (hcount_L >= 354 & hcount_L <= 364 & vcount_L >= 190 & vcount_L <= 270);
green_die14 <= ~blank_L & (hcount_L >= 364 & hcount_L <= 377 & vcount_L >= 255 & vcount_L <= 270);
green_die15 <= ~blank_L & (hcount_L >= 377 & hcount_L <= 390 & vcount_L >= 240 & vcount_L <= 255);
green_die16 <= ~blank_L & (hcount_L >= 390 & hcount_L <= 396 & vcount_L >= 220 & vcount_L <= 240);
green_die17 <= ~blank_L & (hcount_L >= 377 & hcount_L <= 390 & vcount_L >= 205 & vcount_L <= 220); 
green_die18 <= ~blank_L & (hcount_L >= 364 & hcount_L <= 377 & vcount_L >= 190 & vcount_L <= 205);  // D
end

/////////////////////////////////////////////////////////////////////////////////////////////
if(dieflag == 1) begin
die0 <= ~blank_L & (hcount_L >= 200 & hcount_L <= 210 & vcount_L >= 190 & vcount_L <= 270);
die1 <= ~blank_L & (hcount_L >= 210 & hcount_L <= 223 & vcount_L >= 255 & vcount_L <= 270);
die2 <= ~blank_L & (hcount_L >= 223 & hcount_L <= 236 & vcount_L >= 240 & vcount_L <= 255);
die3 <= ~blank_L & (hcount_L >= 236 & hcount_L <= 242 & vcount_L >= 220 & vcount_L <= 240);
die4 <= ~blank_L & (hcount_L >= 223 & hcount_L <= 236 & vcount_L >= 205 & vcount_L <= 220); 
die5 <= ~blank_L & (hcount_L >= 210 & hcount_L <= 223 & vcount_L >= 190 & vcount_L <= 205);  // D

die6 <= ~blank_L & (hcount_L >= 267 & hcount_L <= 277 & vcount_L >= 200 & vcount_L <= 260);  
die7 <= ~blank_L & (hcount_L >= 254 & hcount_L <= 290 & vcount_L >= 260 & vcount_L <= 270);  
die8 <= ~blank_L & (hcount_L >= 254 & hcount_L <= 290 & vcount_L >= 190 & vcount_L <= 200);  // I

die9  <= ~blank_L & (hcount_L >= 304 & hcount_L <= 314 & vcount_L >= 190 & vcount_L <= 270);
die10 <= ~blank_L & (hcount_L >= 314 & hcount_L <= 340 & vcount_L >= 258 & vcount_L <= 270);
die11 <= ~blank_L & (hcount_L >= 314 & hcount_L <= 340 & vcount_L >= 224 & vcount_L <= 236);
die12 <= ~blank_L & (hcount_L >= 314 & hcount_L <= 340 & vcount_L >= 190 & vcount_L <= 202); // E

die13 <= ~blank_L & (hcount_L >= 354 & hcount_L <= 364 & vcount_L >= 190 & vcount_L <= 270);
die14 <= ~blank_L & (hcount_L >= 364 & hcount_L <= 377 & vcount_L >= 255 & vcount_L <= 270);
die15 <= ~blank_L & (hcount_L >= 377 & hcount_L <= 390 & vcount_L >= 240 & vcount_L <= 255);
die16 <= ~blank_L & (hcount_L >= 390 & hcount_L <= 396 & vcount_L >= 220 & vcount_L <= 240);
die17 <= ~blank_L & (hcount_L >= 377 & hcount_L <= 390 & vcount_L >= 205 & vcount_L <= 220); 
die18 <= ~blank_L & (hcount_L >= 364 & hcount_L <= 377 & vcount_L >= 190 & vcount_L <= 205);  // D
end
////////////////////////////////////////////////////////////////////////////////////////////////////
if(score >= 25) begin //green one
k0 <= ~blank_L & (hcount_L >= 230 & hcount_L <= 240 & vcount_L >= 195 & vcount_L <= 265);
k1 <= ~blank_L & (hcount_L >= 240 & hcount_L <= 250 & vcount_L >= 225 & vcount_L <= 235);
k2 <= ~blank_L & (hcount_L >= 250 & hcount_L <= 260 & vcount_L >= 215 & vcount_L <= 225);
k3 <= ~blank_L & (hcount_L >= 250 & hcount_L <= 260 & vcount_L >= 235 & vcount_L <= 245);
k4 <= ~blank_L & (hcount_L >= 260 & hcount_L <= 270 & vcount_L >= 205 & vcount_L <= 215); 
k5 <= ~blank_L & (hcount_L >= 260 & hcount_L <= 270 & vcount_L >= 245 & vcount_L <= 255); 
k6 <= ~blank_L & (hcount_L >= 270 & hcount_L <= 280 & vcount_L >= 195 & vcount_L <= 205); 
k7 <= ~blank_L & (hcount_L >= 270 & hcount_L <= 280 & vcount_L >= 255 & vcount_L <= 265);  // K

d0 <= ~blank_L & (hcount_L >= 290 & hcount_L <= 300 & vcount_L >= 255 & vcount_L <= 265);  //.

O0 <= ~blank_L & (hcount_L >= 310 & hcount_L <= 320 & vcount_L >= 205 & vcount_L <= 255);
O1 <= ~blank_L & (hcount_L >= 320 & hcount_L <= 350 & vcount_L >= 255 & vcount_L <= 265);
O2 <= ~blank_L & (hcount_L >= 320 & hcount_L <= 350 & vcount_L >= 195 & vcount_L <= 205);
O3 <= ~blank_L & (hcount_L >= 350 & hcount_L <= 360 & vcount_L >= 205 & vcount_L <= 255);  //O

d1 <= ~blank_L & (hcount_L >= 370 & hcount_L <= 380 & vcount_L >= 255 & vcount_L <= 265); //.
{die0,die1,die2,die3,die4,die5,die6,die7,die8,die9,die10,die11,die12,die13,die14,die15,die16,die17,die18} <=0;
end

if(dragon_score >= 25) begin  //blue one
kk0 <= ~blank_L & (hcount_L >= 230 & hcount_L <= 240 & vcount_L >= 195 & vcount_L <= 265);
kk1 <= ~blank_L & (hcount_L >= 240 & hcount_L <= 250 & vcount_L >= 225 & vcount_L <= 235);
kk2 <= ~blank_L & (hcount_L >= 250 & hcount_L <= 260 & vcount_L >= 215 & vcount_L <= 225);
kk3 <= ~blank_L & (hcount_L >= 250 & hcount_L <= 260 & vcount_L >= 235 & vcount_L <= 245);
kk4 <= ~blank_L & (hcount_L >= 260 & hcount_L <= 270 & vcount_L >= 205 & vcount_L <= 215); 
kk5 <= ~blank_L & (hcount_L >= 260 & hcount_L <= 270 & vcount_L >= 245 & vcount_L <= 255); 
kk6 <= ~blank_L & (hcount_L >= 270 & hcount_L <= 280 & vcount_L >= 195 & vcount_L <= 205); 
kk7 <= ~blank_L & (hcount_L >= 270 & hcount_L <= 280 & vcount_L >= 255 & vcount_L <= 265);  // K

dd0 <= ~blank_L & (hcount_L >= 290 & hcount_L <= 300 & vcount_L >= 255 & vcount_L <= 265);  //.

OO0 <= ~blank_L & (hcount_L >= 310 & hcount_L <= 320 & vcount_L >= 205 & vcount_L <= 255);
OO1 <= ~blank_L & (hcount_L >= 320 & hcount_L <= 350 & vcount_L >= 255 & vcount_L <= 265);
OO2 <= ~blank_L & (hcount_L >= 320 & hcount_L <= 350 & vcount_L >= 195 & vcount_L <= 205);
OO3 <= ~blank_L & (hcount_L >= 350 & hcount_L <= 360 & vcount_L >= 205 & vcount_L <= 255);  //O

dd1 <= ~blank_L & (hcount_L >= 370 & hcount_L <= 380 & vcount_L >= 255 & vcount_L <= 265); //.
{green_die0,green_die1,green_die2,green_die3,green_die4,green_die5,green_die6,green_die7,green_die8,green_die9,green_die10,green_die11,green_die12,green_die13,green_die14,green_die15,green_die16,green_die17,green_die18} <= 0;
end



snakehead <= ~blank_L & (hcount_L >= x & hcount_L <= x+20 & vcount_L >= y & vcount_L <= y+20);  // THE HEAD OF THE SNAKE


////////////////////////////////////////////////////////////////////////////////////////////////////////////
dragon_head <= ~blank_L & (hcount_L >= dx & hcount_L <= dx+20 & vcount_L >= dy & vcount_L <= dy+20);  // THE HEAD OF THE dragon
///////////////////////////////////////////////////////////////////////////////////////////////////////////

if(state == 4'b0011) begin //go right 
snakeEye0 <= ~blank_L & (hcount_L >= x+21 & hcount_L <= x+22 & vcount_L >= y+5 & vcount_L <= y+8);
snakeEye1 <= ~blank_L & (hcount_L >= x+21 & hcount_L <= x+22 & vcount_L >= y+12 & vcount_L <= y+15);
end
else if(state == 4'b0010) begin //go left
snakeEye0 <= ~blank_L & (hcount_L >= x-4 & hcount_L <= x-1 & vcount_L >= y+5 & vcount_L <= y+8);
snakeEye1 <= ~blank_L & (hcount_L >= x-4 & hcount_L <= x-1 & vcount_L >= y+12 & vcount_L <= y+15);
end
else if(state == 4'b0000) begin //go up
snakeEye0 <= ~blank_L & (hcount_L >= x+3 & hcount_L <= x+7 & vcount_L >= y-3 & vcount_L <= y);
snakeEye1 <= ~blank_L & (hcount_L >= x+14 & hcount_L <= x+17 & vcount_L >= y-3 & vcount_L <= y);
end
else if(state == 4'b0001) begin//go down
snakeEye0 <= ~blank_L & (hcount_L >= x+13 & hcount_L <= x+16 & vcount_L >= y+20 & vcount_L <= y+24);
snakeEye1 <= ~blank_L & (hcount_L >= x+4 & hcount_L <= x+7 & vcount_L >= y+20 & vcount_L <= y+24);
end

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
if(dragon_state == 4'b0011) begin //go right 
dragon_Eye0 <= ~blank_L & (hcount_L >= dx+21 & hcount_L <= dx+22 & vcount_L >= dy+5 & vcount_L <= dy+8);
dragon_Eye1 <= ~blank_L & (hcount_L >= dx+21 & hcount_L <= dx+22 & vcount_L >= dy+12 & vcount_L <= dy+15);
end
else if(dragon_state == 4'b0010) begin //go left
dragon_Eye0 <= ~blank_L & (hcount_L >= dx-4 & hcount_L <= dx-1 & vcount_L >= dy+5 & vcount_L <= dy+8);
dragon_Eye1 <= ~blank_L & (hcount_L >= dx-4 & hcount_L <= dx-1 & vcount_L >= dy+12 & vcount_L <= dy+15);
end
else if(dragon_state == 4'b0000) begin //go up
dragon_Eye0 <= ~blank_L & (hcount_L >= dx+3 & hcount_L <= dx+7 & vcount_L >= dy-3 & vcount_L <= dy);
dragon_Eye1 <= ~blank_L & (hcount_L >= dx+14 & hcount_L <= dx+17 & vcount_L >= dy-3 & vcount_L <= dy);
end
else if(dragon_state == 4'b0001) begin//go down
dragon_Eye0 <= ~blank_L & (hcount_L >= dx+13 & hcount_L <= dx+16 & vcount_L >= dy+20 & vcount_L <= dy+24);
dragon_Eye1 <= ~blank_L & (hcount_L >= dx+4 & hcount_L <= dx+7 & vcount_L >= dy+20 & vcount_L <= dy+24);
end
/////////////////////////////////////////////////////////////////////////////////////////////////////////////

food <= ~blank_L & (hcount_L >=foodx + 5 & hcount_L <= foodx + 15 &vcount_L >= foody + 5 & vcount_L <= foody + 15);  // THE DISPLAY OF THE FOOD
foodbar <= ~blank_L & (hcount_L >=foodx + 10 & hcount_L <= foodx + 12 &vcount_L >= foody + 1 & vcount_L <= foody + 4); //THE DISPLAY OF THE FOODBAR

powerup_item <= ~blank_L & (hcount_L >=itemx + 5 & hcount_L <= itemx + 15 &vcount_L >= itemy + 5 & vcount_L <= itemy + 15);
case(dataout)
8'h1c:begin left<=1; right<=0; up<=0; down<=0; dragon_up<=0;dragon_down<=0;dragon_left<=0; dragon_right<=0;end
8'h1d:begin left<=0; right<=0; up<=1; down<=0; dragon_up<=0;dragon_down<=0;dragon_left<=0; dragon_right<=0; end
8'h1b:begin left<=0; right<=0; up<=0; down<=1; dragon_up<=0;dragon_down<=0;dragon_left<=0; dragon_right<=0;end
8'h23:begin left<=0; right<=1; up<=0; down<=0; dragon_up<=0;dragon_down<=0;dragon_left<=0; dragon_right<=0;end
8'h3b:begin left<=0; right<=0; up<=0; down<=0; dragon_up<=0;dragon_down<=0;dragon_left<=1; dragon_right<=0;end
8'h43:begin left<=0; right<=0; up<=0; down<=0; dragon_up<=1;dragon_down<=0;dragon_left<=0; dragon_right<=0;end
8'h42:begin left<=0; right<=0; up<=0; down<=0; dragon_up<=0;dragon_down<=1;dragon_left<=0; dragon_right<=0;end
8'h4b:begin left<=0; right<=0; up<=0; down<=0; dragon_up<=0;dragon_down<=0;dragon_left<=0; dragon_right<=1;end
default: begin left<=0; right<=0; up<=0; down<=0; dragon_up<=0;dragon_down<=0;dragon_left<=0; dragon_right<=0;end
endcase


if (up==1'b1 && go_down == 1'b0) begin
go_up = 1; go_down = 0; go_left = 0; go_right = 0;
state = 4'b0000;
end
else if (down==1'b1 && go_up== 1'b0) begin
go_up = 0; go_down = 1; go_left = 0; go_right = 0;
state = 4'b0001;
end
else if (left==1'b1 && go_right==1'b0) begin
go_up = 0; go_down = 0; go_left = 1; go_right = 0;
state = 4'b0010;
end
else if (right==1'b1 && go_left==1'b0) begin
go_up = 0; go_down = 0; go_left = 0; go_right = 1;
state = 4'b0011;
end
else state=state;

////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (dragon_up==1'b1 && dragon_go_down == 1'b0) begin
dragon_go_up = 1; dragon_go_down = 0; dragon_go_left = 0; dragon_go_right = 0;
dragon_state = 4'b0000;
end
else if (dragon_down==1'b1 && dragon_go_up== 1'b0) begin
dragon_go_up = 0; dragon_go_down = 1; dragon_go_left = 0; dragon_go_right = 0;
dragon_state = 4'b0001;
end
else if (dragon_left==1'b1 && dragon_go_right==1'b0) begin
dragon_go_up = 0; dragon_go_down = 0; dragon_go_left = 1; dragon_go_right = 0;
dragon_state = 4'b0010;
end
else if (dragon_right==1'b1 && dragon_go_left==1'b0) begin
dragon_go_up = 0; dragon_go_down = 0; dragon_go_left = 0; dragon_go_right = 1;
dragon_state = 4'b0011;
end
else dragon_state=dragon_state;
////////////////////////////////////////////////////////////////////////////////////////////////////////////




begin
foodxcount = 22 + (foodxcount + 5'd20)%10'd560;    // 600
foodycount = 22 + (foodycount + 5'd20)%9'd380;   //420
end

begin
itemxcount = 22 + (itemxcount + 5'd35)%10'd1000;
itemycount = 22 + (itemycount + 5'd35)%10'd1000;
end

if (snakehead && food) begin	// if you are within the valid region
speedup = 0;
itemx = itemxcount;
itemy = itemycount;

score = score + 16'b1;
foodx = foodxcount;
foody = foodycount;
end

//////////////////////////////////////////////////////////////////
if (dragon_head && food) begin	// if you are within the valid region
dragon_speedup = 0;
itemx = itemxcount;
itemy = itemycount;
dragon_score = dragon_score + 16'b1;
foodx = foodxcount;
foody = foodycount;
end
//////////////////////////////////////////////////////////////////

if (snakehead && (wall0||wall1||wall2||wall3|| //if the snake collides the walls

						dragon_segment1||dragon_segment2||dragon_segment3||dragon_segment4||dragon_segment5||dragon_segment6||dragon_segment7||
						dragon_segment8||dragon_segment9||dragon_segment10||dragon_segment11||dragon_segment12||dragon_segment13||dragon_segment14||
						dragon_segment15||dragon_segment16||dragon_segment17||dragon_segment18||dragon_segment19||dragon_segment20||
						dragon_segment21||dragon_segment22||dragon_segment23||dragon_segment24||dragon_segment25|| //if the snake collides the dragon's body

						snakesegment1|| snakesegment2|| snakesegment3|| snakesegment4|| snakesegment5|| snakesegment6||snakesegment7|| snakesegment8|| 
						snakesegment9|| snakesegment10|| snakesegment11|| snakesegment12|| snakesegment13|| snakesegment14||snakesegment15||
						snakesegment16||snakesegment17||snakesegment18||snakesegment19||snakesegment20||snakesegment21|| snakesegment22||snakesegment23||
						snakesegment24||snakesegment25)) //if the snake bites itself
begin
green_dieflag = 1;
end


//if (snakehead && (wall0||wall1||wall2||wall3||dragon_head||dragon_segment1||dragon_segment2||dragon_segment3||dragon_segment4||dragon_segment5||dragon_segment6||dragon_segment7||
//	 dragon_segment8||dragon_segment9||dragon_segment10||dragon_segment11||dragon_segment12||
//dragon_segment13||dragon_segment14||dragon_segment15||dragon_segment16||dragon_segment17||dragon_segment18||dragon_segment19||dragon_segment20||
//dragon_segment21||dragon_segment22||dragon_segment23||dragon_segment24||dragon_segment25||snakesegment1|| snakesegment2|| snakesegment3|| snakesegment4|| snakesegment5|| snakesegment6||
//	   snakesegment7|| snakesegment8|| snakesegment9|| snakesegment10|| snakesegment11|| 
//	   snakesegment12|| snakesegment13|| snakesegment14||snakesegment15||
//	 snakesegment16||snakesegment17||snakesegment18||snakesegment19||snakesegment20||
//	 snakesegment21|| snakesegment22||snakesegment23||snakesegment24||snakesegment25)) begin
//green_dieflag = 1;
//end



if (dragon_head && (wall0||wall1||wall2||wall3||barrier0||barrier1||barrier2||//if the dragon collides the walls

						  snakesegment1|| snakesegment2|| snakesegment3|| snakesegment4|| snakesegment5|| snakesegment6||snakesegment7|| snakesegment8|| 
						  snakesegment9|| snakesegment10|| snakesegment11|| snakesegment12|| snakesegment13|| snakesegment14||snakesegment15||
						  snakesegment16||snakesegment17||snakesegment18||snakesegment19||snakesegment20||
						  snakesegment21|| snakesegment22||snakesegment23||snakesegment24||snakesegment25|| //if the dragon collides the snake's body
	 
						  dragon_segment1||dragon_segment2||dragon_segment3||dragon_segment4||dragon_segment5||dragon_segment6||dragon_segment7||
						  dragon_segment8||dragon_segment9||dragon_segment10||dragon_segment11||dragon_segment12||dragon_segment13||dragon_segment14||
						  dragon_segment15||dragon_segment16||dragon_segment17||dragon_segment18||dragon_segment19||dragon_segment20||
					     dragon_segment21||dragon_segment22||dragon_segment23||dragon_segment24||dragon_segment25)) //if the dragon bites itself
begin
dieflag = 1;
end

//if (dragon_head && (wall0||wall1||wall2||wall3||snakehead ||snakesegment1|| snakesegment2|| snakesegment3|| snakesegment4|| snakesegment5|| snakesegment6||
//	   snakesegment7|| snakesegment8|| snakesegment9|| snakesegment10|| snakesegment11|| 
//	   snakesegment12|| snakesegment13|| snakesegment14||snakesegment15||
//	 snakesegment16||snakesegment17||snakesegment18||snakesegment19||snakesegment20||
//	 snakesegment21|| snakesegment22||snakesegment23||snakesegment24||snakesegment25||dragon_segment1||dragon_segment2||dragon_segment3||dragon_segment4||dragon_segment5||dragon_segment6||dragon_segment7||
//	 dragon_segment8||dragon_segment9||dragon_segment10||dragon_segment11||dragon_segment12||
//dragon_segment13||dragon_segment14||dragon_segment15||dragon_segment16||dragon_segment17||dragon_segment18||dragon_segment19||dragon_segment20||
//dragon_segment21||dragon_segment22||dragon_segment23||dragon_segment24||dragon_segment25)) begin
//dieflag = 1;
//end
//////////////////////////////////////////////////////////////////

if (score > 16'b0)
snakesegment1 = ~blank_L & (hcount_L >=x1+1 & hcount_L <= x1 + 19 &vcount_L >= y1+1 & vcount_L <= y1+19);
if (score > 16'b1)
snakesegment2 = ~blank_L & (hcount_L >=x2+1 & hcount_L <= x2 + 19 &vcount_L >= y2+1 & vcount_L <= y2+19);
if (score > 16'b10)
snakesegment3 = ~blank_L & (hcount_L >=x3+1 & hcount_L <= x3 + 19 &vcount_L >= y3+1 & vcount_L <= y3+19);
if (score > 16'b11)
snakesegment4 = ~blank_L & (hcount_L >=x4+1 & hcount_L <= x4 + 19 &vcount_L >= y4+1 & vcount_L <= y4+19);
if (score > 16'b100)
snakesegment5 = ~blank_L & (hcount_L >=x5+1 & hcount_L <= x5 + 19 &vcount_L >= y5+1 & vcount_L <= y5+19);
if (score > 16'b101)
snakesegment6 = ~blank_L & (hcount_L >=x6+1 & hcount_L <= x6 + 19 &vcount_L >= y6+1 & vcount_L <= y6+19);
if (score > 16'b110)
snakesegment7 = ~blank_L & (hcount_L >=x7+1 & hcount_L <= x7 + 19 &vcount_L >= y7+1 & vcount_L <= y7+19);
if (score > 16'b111)
snakesegment8 = ~blank_L & (hcount_L >=x8+1 & hcount_L <= x8 + 19 &vcount_L >= y8+1 & vcount_L <= y8+19);
if (score > 16'b1000)
snakesegment9 = ~blank_L & (hcount_L >=x9+1 & hcount_L <= x9 + 19 &vcount_L >= y9+1 & vcount_L <= y9+19);
if (score > 16'b1001)
snakesegment10 = ~blank_L & (hcount_L >=x10+1 & hcount_L <= x10 + 19 &vcount_L >= y10+1 & vcount_L <= y10+19);
if (score > 16'b1010)
snakesegment11 = ~blank_L & (hcount_L >=x11+1 & hcount_L <= x11 + 19 &vcount_L >= y11+1 & vcount_L <= y11+19);
if (score > 16'b1011)
snakesegment12 = ~blank_L & (hcount_L >=x12+1 & hcount_L <= x12 + 19 &vcount_L >= y12+1 & vcount_L <= y12+19);
if (score > 16'b1100)
snakesegment13 = ~blank_L & (hcount_L >=x13+1 & hcount_L <= x13 + 19 &vcount_L >= y13+1 & vcount_L <= y13+19);
if (score > 16'b1101)
snakesegment14 = ~blank_L & (hcount_L >=x14+1 & hcount_L <= x14 + 19 &vcount_L >= y14+1 & vcount_L <= y14+19);
if (score > 16'b1110)
snakesegment15 = ~blank_L & (hcount_L >=x15+1 & hcount_L <= x15 + 19 &vcount_L >= y15+1 & vcount_L <= y15+19);
if (score > 16'b1111)
snakesegment16 = ~blank_L & (hcount_L >=x16+1 & hcount_L <= x16 + 19 &vcount_L >= y16+1 & vcount_L <= y16+19);
if (score > 16'b10000)
snakesegment17 = ~blank_L & (hcount_L >=x17+1 & hcount_L <= x17 + 19 &vcount_L >= y17+1 & vcount_L <= y17+19);
if (score > 16'b10001)
snakesegment18 = ~blank_L & (hcount_L >=x18+1 & hcount_L <= x18 + 19 &vcount_L >= y18+1 & vcount_L <= y18+19);
if (score > 16'b10010)
snakesegment19 = ~blank_L & (hcount_L >=x19+1 & hcount_L <= x19 + 19 &vcount_L >= y19+1 & vcount_L <= y19+19);
if (score > 16'b10011)
snakesegment20 = ~blank_L & (hcount_L >=x20+1 & hcount_L <= x20 + 19 &vcount_L >= y20+1 & vcount_L <= y20+19);
if (score > 16'b10100)
snakesegment21 = ~blank_L & (hcount_L >=x21+1 & hcount_L <= x21 + 19 &vcount_L >= y21+1 & vcount_L <= y21+19);
if (score > 16'b10101)
snakesegment22 = ~blank_L & (hcount_L >=x22+1 & hcount_L <= x22 + 19 &vcount_L >= y22+1 & vcount_L <= y22+19);
if (score > 16'b10110)
snakesegment23 = ~blank_L & (hcount_L >=x23+1 & hcount_L <= x23 + 19 &vcount_L >= y23+1 & vcount_L <= y23+19);
if (score > 16'b10111)
snakesegment24 = ~blank_L & (hcount_L >=x24+1 & hcount_L <= x24 + 19 &vcount_L >= y24+1 & vcount_L <= y24+19);
if (score > 16'b11000)
snakesegment25 = ~blank_L & (hcount_L >=x25+1 & hcount_L <= x25 + 19 &vcount_L >= y25+1 & vcount_L <= y25+19);

////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (dragon_score > 16'b0)
dragon_segment1 = ~blank_L & (hcount_L >=dx1+1 & hcount_L <= dx1 + 19 &vcount_L >= dy1+1 & vcount_L <= dy1+19);
if (dragon_score > 16'b1)
dragon_segment2 = ~blank_L & (hcount_L >=dx2+1 & hcount_L <= dx2 + 19 &vcount_L >= dy2+1 & vcount_L <= dy2+19);
if (dragon_score > 16'b10)
dragon_segment3 = ~blank_L & (hcount_L >=dx3+1 & hcount_L <= dx3 + 19 &vcount_L >= dy3+1 & vcount_L <= dy3+19);
if (dragon_score > 16'b11)
dragon_segment4 = ~blank_L & (hcount_L >=dx4+1 & hcount_L <= dx4 + 19 &vcount_L >= dy4+1 & vcount_L <= dy4+19);
if (dragon_score > 16'b100)
dragon_segment5 = ~blank_L & (hcount_L >=dx5+1 & hcount_L <= dx5 + 19 &vcount_L >= dy5+1 & vcount_L <= dy5+19);
if (dragon_score > 16'b101)
dragon_segment6 = ~blank_L & (hcount_L >=dx6+1 & hcount_L <= dx6 + 19 &vcount_L >= dy6+1 & vcount_L <= dy6+19);
if (dragon_score > 16'b110)
dragon_segment7 = ~blank_L & (hcount_L >=dx7+1 & hcount_L <= dx7 + 19 &vcount_L >= dy7+1 & vcount_L <= dy7+19);
if (dragon_score > 16'b111)
dragon_segment8 = ~blank_L & (hcount_L >=dx8+1 & hcount_L <= dx8 + 19 &vcount_L >= dy8+1 & vcount_L <= dy8+19);
if (dragon_score > 16'b1000)
dragon_segment9 = ~blank_L & (hcount_L >=dx9+1 & hcount_L <= dx9 + 19 &vcount_L >= dy9+1 & vcount_L <= dy9+19);
if (dragon_score > 16'b1001)
dragon_segment10= ~blank_L & (hcount_L >=dx10+1 & hcount_L <= dx10 + 19 &vcount_L >= dy10+1 & vcount_L <= dy10+19);
if (dragon_score > 16'b1010)
dragon_segment11= ~blank_L & (hcount_L >=dx11+1 & hcount_L <= dx11 + 19 &vcount_L >= dy11+1 & vcount_L <= dy11+19);
if (dragon_score > 16'b1011)
dragon_segment12= ~blank_L & (hcount_L >=dx12+1 & hcount_L <= dx12 + 19 &vcount_L >= dy12+1 & vcount_L <= dy12+19);
if (dragon_score > 16'b1100)
dragon_segment13= ~blank_L & (hcount_L >=dx13+1 & hcount_L <= dx13 + 19 &vcount_L >= dy13+1 & vcount_L <= dy13+19);
if (dragon_score > 16'b1101)
dragon_segment14= ~blank_L & (hcount_L >=dx14+1 & hcount_L <= dx14 + 19 &vcount_L >= dy14+1 & vcount_L <= dy14+19);
if (dragon_score > 16'b1110)
dragon_segment15= ~blank_L & (hcount_L >=dx15+1 & hcount_L <= dx15 + 19 &vcount_L >= dy15+1 & vcount_L <= dy15+19);
if (dragon_score > 16'b1111)
dragon_segment16= ~blank_L & (hcount_L >=dx16+1 & hcount_L <= dx16 + 19 &vcount_L >= dy16+1 & vcount_L <= dy16+19);
if (dragon_score > 16'b10000)
dragon_segment17= ~blank_L & (hcount_L >=dx17+1 & hcount_L <= dx17 + 19 &vcount_L >= dy17+1 & vcount_L <= dy17+19);
if (dragon_score > 16'b10001)
dragon_segment18= ~blank_L & (hcount_L >=dx18+1 & hcount_L <= dx18 + 19 &vcount_L >= dy18+1 & vcount_L <= dy18+19);
if (dragon_score > 16'b10010)
dragon_segment19= ~blank_L & (hcount_L >=dx19+1 & hcount_L <= dx19 + 19 &vcount_L >= dy19+1 & vcount_L <= dy19+19);
if (dragon_score > 16'b10011)
dragon_segment20= ~blank_L & (hcount_L >=dx20+1 & hcount_L <= dx20 + 19 &vcount_L >= dy20+1 & vcount_L <= dy20+19);
if (dragon_score > 16'b10100)
dragon_segment21= ~blank_L & (hcount_L >=dx21+1 & hcount_L <= dx21 + 19 &vcount_L >= dy21+1 & vcount_L <= dy21+19);
if (dragon_score > 16'b10101)
dragon_segment22= ~blank_L & (hcount_L >=dx22+1 & hcount_L <= dx22 + 19 &vcount_L >= dy22+1 & vcount_L <= dy22+19);
if (dragon_score > 16'b10110)
dragon_segment23= ~blank_L & (hcount_L >=dx23+1 & hcount_L <= dx23 + 19 &vcount_L >= dy23+1 & vcount_L <= dy23+19);
if (dragon_score > 16'b10111)
dragon_segment24= ~blank_L & (hcount_L >=dx24+1 & hcount_L <= dx24 + 19 &vcount_L >= dy24+1 & vcount_L <= dy24+19);
if (dragon_score > 16'b11000)
dragon_segment25 = ~blank_L & (hcount_L >=dx25+1 & hcount_L <= dx25 + 19 &vcount_L >= dy25+1 & vcount_L <= dy25+19);
////////////////////////////////////////////////////////////////////////////////////////////////////////////

if( snakehead ||snakesegment1|| snakesegment2|| snakesegment3|| snakesegment4|| snakesegment5|| snakesegment6||
	   snakesegment7|| snakesegment8|| snakesegment9|| snakesegment10|| snakesegment11|| 
	   snakesegment12|| snakesegment13|| snakesegment14||snakesegment15||
	 snakesegment16||snakesegment17||snakesegment18||snakesegment19||snakesegment20||
	 snakesegment21|| snakesegment22||snakesegment23||snakesegment24||snakesegment25||dragon_head||dragon_segment1||dragon_segment2||dragon_segment3||dragon_segment4||dragon_segment5||dragon_segment6||dragon_segment7||
	 dragon_segment8||dragon_segment9||dragon_segment10||dragon_segment11||dragon_segment12||
dragon_segment13||dragon_segment14||dragon_segment15||dragon_segment16||dragon_segment17||dragon_segment18||dragon_segment19||dragon_segment20||
dragon_segment21||dragon_segment22||dragon_segment23||dragon_segment24||dragon_segment25||
	 foodbar||powerup_item == 1) begin
	G0 = 1;
	G1 = 1;
	G2 = 1;
	B1 = 0;
	end
	else begin
	G0 = 0;
	G1 = 0;
	G2 = 0;
	B1 = 0;
	end

if( snakehead && powerup_item == 1) begin
itemx = itemxcount;
itemy = itemycount;
speedup = 1;
end

if( dragon_head && powerup_item == 1) begin
itemx = itemxcount;
itemy = itemycount;
dragon_speedup = 1;
end

if(dragon_head||dragon_segment1||dragon_segment2||dragon_segment3||dragon_segment4||dragon_segment5||dragon_segment6||dragon_segment7||
	 dragon_segment8||dragon_segment9||dragon_segment10||dragon_segment11||dragon_segment12||
dragon_segment13||dragon_segment14||dragon_segment15||dragon_segment16||dragon_segment17||dragon_segment18||dragon_segment19||dragon_segment20||
dragon_segment21||dragon_segment22||dragon_segment23||dragon_segment24||dragon_segment25  == 1) begin
B0 = 1;
B1 = 1;

end
else begin
B0 = 0;
B1 = 0;

end



if(die0 ||die1 ||die2 ||die3 ||die4 ||die5 ||die6 ||die7 ||die8 ||die9||die10||die11||die12 ||die13 ||die14||die15||die16||die17 ||die18 ||kk0||kk1||kk2||kk3||kk4||kk5||kk6||kk7||dd0||dd1||OO0||OO1||OO2||OO3 == 1) begin
		G0 = 0;
		G1 = 0;
		G2 = 1;
		B1 = 1;
end


if(green_die0 ||green_die1 ||green_die2 ||green_die3 ||green_die4 ||green_die5 ||green_die6 ||green_die7 ||green_die8 ||green_die9||green_die10||green_die11||green_die12 ||green_die13 ||green_die14||green_die15||green_die16||green_die17 ||green_die18||k0||k1||k2||k3||k4||k5||k6||k7||O0||O1||O2||O3||d0||d1 == 1) begin
		G0 = 1;
		G1 = 1;
		G2 = 0;

end
	

if (wall0 || wall1 || wall2 || wall3 || food || snakeEye0 ||snakeEye1 || dragon_Eye0 || dragon_Eye1 || barrier0 || barrier1 || barrier2) begin
R0 = 1;
R1 = 1;
R2 = 1;
end
else begin
R0 = 0;
R1 = 0;
R2 = 0;
end


	

end   // END OF THE FAST CLK



always@( posedge Snake_clk_L ) begin



if (rst) begin

x25 = 300; y25 = 0; x24 = 280; y24 = 0; x23 = 260; y23 = 0; x22 = 240; y22 = 0; x21 = 220;
y21 = 0; x20 = 200; y20 = 0; x19 = 180; y19 = 0; x18 = 160; y18 = 0; x17 = 140; y17 = 0; 
x16 = 120; y16 = 0; x15 = 100; y15 = 0; x14 = 80; y14 = 0; x13 = 60; y13 = 0; x12 = 40;
y12 = 0; x11 = 20; y11 = 0; x10 = 0; y10 = 0; x9 = 0; y9 = 20; x8 = 0; y8 = 40; x7 = 0;
y7 = 60; x6 = 00; y6 = 80; x5 = 0; y5 = 100; x4 = 20; y4 = 100; x3 = 40; y3 = 100; x2 = 60;
y2 = 100; x1 = 80; y1 = 100; x = 100; y = 100;

end

case(state)

4'b0000: begin  //up

x25 = x24; y25 = y24; x24 = x23; y24 = y23; x23 = x22; y23 = y22; x22 = x21; y22 = y21; x21 = x20; 
y21 = y20; x20 = x19; y20 = y19; x19 = x18; y19 = y18; x18 = x17; y18 = y17; x17 = x16; y17 = y16;
x16 = x15; y16 = y15; x15 = x14; y15 = y14; x14 = x13; y14 = y13; x13 = x12; y13 = y12; x12 = x11;
y12 = y11; x11 = x10; y11 = y10; x10 = x9; y10 = y9; x9 = x8; y9 = y8; x8 = x7; y8 = y7; x7 = x6; 
y7 = y6; x6 = x5; y6 = y5; x5 = x4; y5 = y4; x4 = x3; y4 = y3; x3 = x2; y3 = y2; x2 = x1; y2 = y1; 
x1 = x; y1 = y;
y = y - 11'd20; // move snakehead up

end

4'b0001: begin //down

x25 = x24; y25 = y24; x24 = x23; y24 = y23; x23 = x22; y23 = y22; x22 = x21; y22 = y21; x21 = x20; 
y21 = y20; x20 = x19; y20 = y19; x19 = x18; y19 = y18; x18 = x17; y18 = y17; x17 = x16; y17 = y16;
x16 = x15; y16 = y15; x15 = x14; y15 = y14; x14 = x13; y14 = y13; x13 = x12; y13 = y12; x12 = x11;
y12 = y11; x11 = x10; y11 = y10; x10 = x9; y10 = y9; x9 = x8; y9 = y8; x8 = x7; y8 = y7; x7 = x6; 
y7 = y6; x6 = x5; y6 = y5; x5 = x4; y5 = y4; x4 = x3; y4 = y3; x3 = x2; y3 = y2; x2 = x1; y2 = y1; 
x1 = x; y1 = y;
y = y + 11'd20; // move snakehead down

end

4'b0010: begin //left

x25 = x24; y25 = y24; x24 = x23; y24 = y23; x23 = x22; y23 = y22; x22 = x21; y22 = y21; x21 = x20; 
y21 = y20; x20 = x19; y20 = y19; x19 = x18; y19 = y18; x18 = x17; y18 = y17; x17 = x16; y17 = y16;
x16 = x15; y16 = y15; x15 = x14; y15 = y14; x14 = x13; y14 = y13; x13 = x12; y13 = y12; x12 = x11;
y12 = y11; x11 = x10; y11 = y10; x10 = x9; y10 = y9; x9 = x8; y9 = y8; x8 = x7; y8 = y7; x7 = x6; 
y7 = y6; x6 = x5; y6 = y5; x5 = x4; y5 = y4; x4 = x3; y4 = y3; x3 = x2; y3 = y2; x2 = x1; y2 = y1; 
x1 = x; y1 = y;
x = x - 11'd20; // move snakehead left

end

4'b0011: begin //right

x25 = x24; y25 = y24; x24 = x23; y24 = y23; x23 = x22; y23 = y22; x22 = x21; y22 = y21; x21 = x20; 
y21 = y20; x20 = x19; y20 = y19; x19 = x18; y19 = y18; x18 = x17; y18 = y17; x17 = x16; y17 = y16;
x16 = x15; y16 = y15; x15 = x14; y15 = y14; x14 = x13; y14 = y13; x13 = x12; y13 = y12; x12 = x11;
y12 = y11; x11 = x10; y11 = y10; x10 = x9; y10 = y9; x9 = x8; y9 = y8; x8 = x7; y8 = y7; x7 = x6; 
y7 = y6; x6 = x5; y6 = y5; x5 = x4; y5 = y4; x4 = x3; y4 = y3; x3 = x2; y3 = y2; x2 = x1; y2 = y1; 
x1 = x; y1 = y;
x = x + 11'd20; // move snakehead right

end
endcase

/////////////////////////////////////////////////////////////////////////////////////////////////
end

always@(posedge Dragon_clk_L) begin
if (rst) begin
///////////////////////////////////////////////////////////////////////////////////////////////
dx25 = 400; dy25 = 100; dx24 = 380; dy24 = 100; dx23 = 360; dy23 = 100; dx22 = 340; dy22 = 100; dx21 = 320;
dy21 = 100; dx20 = 300; dy20 = 100; dx19 = 280; dy19 = 100; dx18 = 260; dy18 = 100; dx17 = 240; dy17 = 100; 
dx16 = 220; dy16 = 100; dx15 = 200; dy15 = 100; dx14 = 180; dy14 = 100; dx13 = 160; dy13 = 100; dx12 = 140;
dy12 = 100; dx11 = 120; dy11 = 100; dx10 = 100; dy10 = 100; dx9 = 100; dy9 = 120; dx8 = 100; dy8 = 140; dx7 = 100;
dy7 = 160; dx6 = 100; dy6 = 180; dx5 = 100; dy5 = 200; dx4 = 120; dy4 = 200; dx3 = 140; dy3 = 200; dx2 = 160;
dy2 = 200; dx1 = 180; dy1 = 200; dx = 200; dy = 200;
///////////////////////////////////////////////////////////////////////////////////////////////
end

case(dragon_state)

4'b0000: begin  //up	

dx25 = dx24; dy25 = dy24; dx24 = dx23; dy24 = dy23; dx23 = dx22; dy23 = dy22; dx22 = dx21; dy22 = dy21; dx21 = dx20; 
dy21 = dy20; dx20 = dx19; dy20 = dy19; dx19 = dx18; dy19 = dy18; dx18 = dx17; dy18 = dy17; dx17 = dx16; dy17 = dy16;
dx16 = dx15; dy16 = dy15; dx15 = dx14; dy15 = dy14; dx14 = dx13; dy14 = dy13; dx13 = dx12; dy13 = dy12; dx12 = dx11;
dy12 = dy11; dx11 = dx10; dy11 = dy10; dx10 = dx9; dy10 = dy9; dx9 = dx8; dy9 = dy8; dx8 = dx7; dy8 = dy7; dx7 = dx6; 
dy7 = dy6; dx6 = dx5; dy6 = dy5; dx5 = dx4; dy5 = dy4; dx4 = dx3; dy4 = dy3; dx3 = dx2; dy3 = dy2; dx2 = dx1; dy2 = dy1; 
dx1 = dx; dy1 = dy;
dy = dy - 11'd20; // move snakehead up

end

4'b0001: begin //down

dx25 = dx24; dy25 = dy24; dx24 = dx23; dy24 = dy23; dx23 = dx22; dy23 = dy22; dx22 = dx21; dy22 = dy21; dx21 = dx20; 
dy21 = dy20; dx20 = dx19; dy20 = dy19; dx19 = dx18; dy19 = dy18; dx18 = dx17; dy18 = dy17; dx17 = dx16; dy17 = dy16;
dx16 = dx15; dy16 = dy15; dx15 = dx14; dy15 = dy14; dx14 = dx13; dy14 = dy13; dx13 = dx12; dy13 = dy12; dx12 = dx11;
dy12 = dy11; dx11 = dx10; dy11 = dy10; dx10 = dx9; dy10 = dy9; dx9 = dx8; dy9 = dy8; dx8 = dx7; dy8 = dy7; dx7 = dx6; 
dy7 = dy6; dx6 = dx5; dy6 = dy5; dx5 = dx4; dy5 = dy4; dx4 = dx3; dy4 = dy3; dx3 = dx2; dy3 = dy2; dx2 = dx1; dy2 = dy1; 
dx1 = dx; dy1 = dy;
dy = dy + 11'd20; // move snakehead down

end

4'b0010: begin //left

dx25 = dx24; dy25 = dy24; dx24 = dx23; dy24 = dy23; dx23 = dx22; dy23 = dy22; dx22 = dx21; dy22 = dy21; dx21 = dx20; 
dy21 = dy20; dx20 = dx19; dy20 = dy19; dx19 = dx18; dy19 = dy18; dx18 = dx17; dy18 = dy17; dx17 = dx16; dy17 = dy16;
dx16 = dx15; dy16 = dy15; dx15 = dx14; dy15 = dy14; dx14 = dx13; dy14 = dy13; dx13 = dx12; dy13 = dy12; dx12 = dx11;
dy12 = dy11; dx11 = dx10; dy11 = dy10; dx10 = dx9; dy10 = dy9; dx9 = dx8; dy9 = dy8; dx8 = dx7; dy8 = dy7; dx7 = dx6; 
dy7 = dy6; dx6 = dx5; dy6 = dy5; dx5 = dx4; dy5 = dy4; dx4 = dx3; dy4 = dy3; dx3 = dx2; dy3 = dy2; dx2 = dx1; dy2 = dy1; 
dx1 = dx; dy1 = dy;
dx = dx - 11'd20; // move snakehead left

end

4'b0011: begin //right

dx25 = dx24; dy25 = dy24; dx24 = dx23; dy24 = dy23; dx23 = dx22; dy23 = dy22; dx22 = dx21; dy22 = dy21; dx21 = dx20; 
dy21 = dy20; dx20 = dx19; dy20 = dy19; dx19 = dx18; dy19 = dy18; dx18 = dx17; dy18 = dy17; dx17 = dx16; dy17 = dy16;
dx16 = dx15; dy16 = dy15; dx15 = dx14; dy15 = dy14; dx14 = dx13; dy14 = dy13; dx13 = dx12; dy13 = dy12; dx12 = dx11;
dy12 = dy11; dx11 = dx10; dy11 = dy10; dx10 = dx9; dy10 = dy9; dx9 = dx8; dy9 = dy8; dx8 = dx7; dy8 = dy7; dx7 = dx6; 
dy7 = dy6; dx6 = dx5; dy6 = dy5; dx5 = dx4; dy5 = dy4; dx4 = dx3; dy4 = dy3; dx3 = dx2; dy3 = dy2; dx2 = dx1; dy2 = dy1; 
dx1 = dx; dy1 = dy;
dx = dx + 11'd20; // move snakehead right

end
endcase
//////////////////////////////////////////////////////////////////////////////////////////////////
end

endmodule
