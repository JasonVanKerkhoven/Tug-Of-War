/**
Module Name:			mc.v
Project:					ToW
Author:					Jason Van Kerkhoven
							Connor Emery
Date of Update:		27/11/2016                                              
Version:           	1.0.0                                                      

Purpose:					TODO
 
 
Update Log:				v1.0.0
								- intial commit
*/
`timescale 1 ns/ 1ps


module mc(winrnd, slowen, rand, clk, rst, leds_on, led_ctrl, clr);

	//declaring inputs
	input winrnd;
	input slowen;
	input rand;
	input clk;
	input rst;
	
	//declaring outputs
	output reg leds_on;
	output reg clr;
	output reg [1:0] led_ctrl;
	reg [2:0] state;
	reg [2:0] nxt_state;
	
	//declaring parameters
	parameter reset = 0;
	parameter wait_a = 1;
	parameter wait_b = 2;
	parameter dark = 3;
	parameter play = 4;
	parameter gloat_a = 5;
	parameter gloat_b = 6;
	
	
	always@(posedge clk or posedge rst) begin
		if(rst) state <= reset;
		else state <= nxt_state;
	end
	
	
	//the ol' state switcherroo
	always@(state or winrnd or slowen or rand or rst) begin
		case(state)
			reset:	if(!rst) nxt_state = wait_a;
					else nxt_state = reset;
					
			wait_a:	if(slowen) nxt_state = wait_b;
					else nxt_state = wait_a;
					
			wait_b:	if(slowen) nxt_state = dark;
					else nxt_state = wait_b;
			
			dark:	if(slowen&rand) nxt_state = play;
					else if(winrnd) nxt_state = gloat_a;
					else nxt_state = dark;
			
			play:	if(winrnd) nxt_state = gloat_a;
					else nxt_state = play;
					
			gloat_a: if(slowen) nxt_state = gloat_b;
					else nxt_state = gloat_a;
					
			gloat_b:	if(slowen) nxt_state = dark;
					else nxt_state = gloat_b;
			
			default: nxt_state = reset;
		endcase 
	end
	
	
	//define each state
	always@(state) begin
		case(state)
			reset:
			begin
				leds_on = 1;
				clr = 1;
				led_ctrl = 2'b11;
			end
			
			wait_a:
			begin
				leds_on = 1;
				clr = 1;
				led_ctrl = 2'b11;
			end
			
			wait_b:
			begin
				leds_on = 1;
				clr = 1;
				led_ctrl = 2'b11;
			end
			
			dark:
			begin
				leds_on = 0;
				clr = 0;
				led_ctrl = 2'b00;
			end
			
			play:
			begin
				leds_on = 1;
				clr = 0;
				led_ctrl = 2'b10;
			end
			
			gloat_a:
			begin
				leds_on = 1;
				clr = 1;
				led_ctrl = 2'b10;
			end
			
			gloat_b:
			begin
				leds_on = 1;
				clr = 1;
				led_ctrl = 2'b10;
			end
			
			default:
			begin
				leds_on = 1;
				clr = 1;
				led_ctrl = 2'b11;
			end
		endcase
	end
endmodule
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	