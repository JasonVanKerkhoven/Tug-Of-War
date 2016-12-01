/**
Module Name:			latch.v
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

module latch(trigger, clr, out);
	//declaring inputs/outputs
	input trigger, clr;
	output out;
	
	//declaring wires and regs
	wire interm;
	
	//gatewise logic
	assign interm = (trigger | out);
	assign out = (trigger & clr);
	
endmodule
