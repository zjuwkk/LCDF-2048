`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/17 12:25:41
// Design Name: 
// Module Name: Top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Top(
	input wire clk,
	//input rstn,
	//input wire [15:0] SW,
		//input wire rst,
	input wire clrn,
	output wire hs,
	output wire vs,
	output wire [3:0] r,
	output wire [3:0] g,
	output wire [3:0] b
		//output reg [31:0]clkdiv

	/*output SEGLED_CLK,
	output SEGLED_CLR,
	output SEGLED_DO,
	output SEGLED_PEN,
   output LED_CLK,
	output LED_CLR,
	output LED_DO,
	output LED_PEN,
	inout [4:0]BTN_X,
	inout [3:0]BTN_Y,
	output buzzer*/
    );
	
		//clkdiv m0 (.rst(rst), .clk(clk), .clkdiv(clkdiv));
	//wire [15:0] SW_OK;
	//AntiJitter #(4) a0[15:0](.clk(clkdiv[15]), .I(SW), .O(SW_OK));
	
	//wire [4:0] keyCode;
	//wire keyReady;
	//Keypad k0 (.clk(clkdiv[15]), .keyX(BTN_Y), .keyY(BTN_X), .keyCode(keyCode), .ready(keyReady));
	
	//wire [31:0] segTestData;
	//wire [3:0]sout;
   /*Seg7Device segDevice(.clkIO(clkdiv[3]), .clkScan(clkdiv[15:14]), .clkBlink(clkdiv[25]),
		.data(segTestData), .point(8'h0), .LES(8'h0),
		.sout(sout));
	assign SEGLED_CLK = sout[3];
	assign SEGLED_DO = sout[2];
	assign SEGLED_PEN = sout[1];
	assign SEGLED_CLR = sout[0];*/
 	
	
	//reg [9:0] x;                                                                       
	//reg [8:0] y;
	
 	wire [11:0] vga_data;
 	wire [9:0] col_addr;
 	wire [8:0] row_addr;
	wire [11:0] addr;
	wire [23:0] px_data;
	//wire [19:0] x_sqr, y_sqr, r_sqr;
	//assign col_addr = 0;
	//assign row_addr = 0;
	address add1 (
		.clk(clk),
		.col_addr(col_addr),
		.row_addr(row_addr),
		.addr(addr)
	);
	index_rom rom1 (
	  .clka(clk), // input clka
	  .addra(addr), // input [11 : 0] addra
	  .douta(px_data) // output [23 : 0] douta
	);
	rgbconvert cvt1 (
		.indata(px_data),
		.outdata(vga_data)
	);
	vgac v0 (
		.vga_clk(clk), .clrn(clrn), .d_in(vga_data), .row_addr(row_addr), .col_addr(col_addr), .r(r), .g(g), .b(b), .hs(hs), .vs(vs)
	);
	/*reg wasReady;
	reg [9:0] radius = 10'd15;
	always @(posedge clk) begin
		if (!rstn) begin
			x <= 10'd320;
			y <= 9'd240;
			radius <= 10'd15;
		end else begin
			wasReady <= keyReady;
			if (!wasReady&&keyReady) begin
				case (keyCode)
					5'h10: radius <= radius - 10'd5;
					5'h12: radius <= radius + 10'd5;
					5'hc: x <= x - 10'd20;
					5'he: x <= x + 10'd20;
					5'h9: y <= y - 9'd20;
					5'h11: y <= y + 9'd20;
					default: ;
				endcase
			end
		end
	end
	
	assign x_sqr = (x - col_addr) * (x - col_addr);
	assign y_sqr = (y - row_addr) * (y - row_addr);
	assign r_sqr = radius * radius;
	
	always@(*) begin
		if ((x_sqr + y_sqr < r_sqr))
			vga_data <= SW[12:1];
		else vga_data <= 12'hfff;
	end
	assign segTestData = {7'b0,x,8'b0,y};
	wire [15:0] ledData;
	assign ledData = SW_OK;
	ShiftReg #(.WIDTH(16)) ledDevice (.clk(clkdiv[3]), .pdata(~ledData), .sout({LED_CLK,LED_DO,LED_PEN,LED_CLR}));*/
endmodule