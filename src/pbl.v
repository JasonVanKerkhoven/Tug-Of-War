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
	
	/**
	//Declaring inputs/outputs
	input pbl, pbr, rst, clr;
	output push, tie, right;
	
	//delcaring wires
	wire leftpushed, rightpushed, H, G;
	
	//declaring modules
	latch latchL(.trigger(left_pushed), .clr(clr), .out(G));
	latch latchR(.trigger(right_pushed), .clr(clr), .out(H));
	
	//gate logic for PBL
	assign leftpushed = pbl & !H;
	assign rightpushed = pbr & !G;
	assign push = (pbl | pbr) & ~clr & ~rst;
	assign tie = pbl & pbr & ~rst;
	assign right = pbr & ~G & ~clr & ~rst;
	*/
	
	input pbr,pbl,clr,rst; //inputs
	output push,tie,right; // outputs
	wire G,H,Gx,Hx; //wires used to make the logic
	
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
