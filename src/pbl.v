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
	input pbr,pbl,clr,rst;
	output push,tie,right;
	
	//module internals
	wire G,H,Gx,Hx;
	
	//PBL logic  
	assign Gx = (~H)&pbl; 
	assign Hx = (~G)&pbr;
	assign G = (G|Gx)&(~(rst|clr));	
	assign H = (H|Hx)&(~(rst|clr));	
	
	//outputs we want in this module
	assign push = G|H; //Either player pushed button
	assign tie = G&H; // both player pushed simultaneously
	assign right = H&(~G); //1 if right player pushed first
	
endmodule
