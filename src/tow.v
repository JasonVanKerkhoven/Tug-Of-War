/**
Module Name:			tow.v
Project:					ToW
Author:					Jason Van Kerkhoven
							Connor Emery
Date of Update:		27/11/2016                                              
Version:           	1.0.0                                                      

Purpose:           	TODO
 
 
Update Log:				v1.0.0
								- intial commit
*/
`timescale 1ns / 1ps

module tow(pbr, pbl, clk, rst, led_out);
	//module i/o
	input clk; 
	input rst;
	input pbr;
	input pbl;
	output [6:0]led_out;
	
	//general wires
	wire		push, sypush, winrnd, slowen, rand, clr, led_on, tie, right;
	wire[1:0]	led_ctrl;
	wire[6:0]	score; 
	wire clk;
	
	//connect all the modules
	clk_div CLOCKdiv(.CLK_I(CLK_I), .rst(rst), .clk(clk));	 
	div256 div256(.clk(clk), .rst(rst), .slowen(slowen));
	lfsr lfsr(.clk(clk), .rst(rst), .rand(rand));
	mc mc(.clk(clk), .rst(rst), .winrnd(winrnd), .slowen(slowen), .rand(rand), .leds_on(leds_on), .clr(clr), .led_ctrl(led_ctrl));
	synchronizer sync(.sypush(sypush), .push(push), .clk(clk), .rst(rst));
	opp onepush(.winrnd(winrnd), .clk(clk), .rst(rst), .sypush(sypush));
	pbl pushleft(.push(push),.tie(tie),.right(right),.pbr(pbr),.pbl(pbl),.clr(clr),.rst(rst));
	scorer scorer (.winrnd(winrnd), .right(right), .leds_on(leds_on), .clk(clk), .rst(rst), .score(score));
	led_mux mux (.score(score), .led_out(led_out), .led_ctrl(led_ctrl));
endmodule
