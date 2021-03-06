/**
*Module Name:		pbl.v
*Project:			ToW
*Author:			Jason Van Kerkhoven
*					Connor Emery
*Date of Update:	27/11/2016                                              
*Version:           1.0.0                                                      

*Purpose:           TODO
* 
* 
*Update Log:		v1.0.0
						- intial commit
*/
`timescale 1ns / 1ps

module pbl (pbl, pbr, rst, clr, push, tie, right);
	
	//module I/O
	input pbr;
	input pbl;
	input clr;
	input rst;
	output push;
	output tie;
	output right;
	
	//internal module wires/registers
	wire G,H,Gx,Hx; //wires used to make the logic
	
	//PBL latch logic
	assign Gx = (~H)&pbl; 
	assign Hx = (~G)&pbr;
	assign G = (G|Gx)&(~(rst|clr));	
	assign H = (H|Hx)&(~(rst|clr));	
	
	//final gates for output
	assign push = G|H; 
	assign tie = G&H;
	assign right = H&(~G);
	
endmodule
