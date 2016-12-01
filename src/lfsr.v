/**
Module Name:			lfsr.v
Project:					ToW
Author:					Jason Van Kerkhoven
							Connor Emery
Date of Update:		27/11/2016                                              
Version:					1.0.0                                                      

Purpose:					TODO
 
 
Update Log:				v1.0.0
								- intial commit
*/
`timescale 1 ns/ 1ps


module lfsr(clk, rst, rand);
	
	//declaring inputs and outputs
	input clk;
	input rst;
	output rand;
	reg[9:0] lfsr;
	
	always@(posedge clk or posedge rst) 
	begin
		if (rst) lfsr[9:0] <= 1;
		else 
		begin
			lfsr[8:0] <= lfsr[9:1];
			lfsr[9] <= lfsr[0]^lfsr[3];
		end
	end
	
	assign rand = lfsr[9];
endmodule