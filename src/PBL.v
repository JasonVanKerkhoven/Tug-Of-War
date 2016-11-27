/**
*Module Name:		PBL.v
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

module PBL (pbl, pbr, rst, clr, push, tie, right);
	
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
	
endmodule
