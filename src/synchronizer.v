/**
*Module Name:		synchronizer.v
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

module synchronizer(push, clk, rst, sypush);
	//declaring inputs/outputs
	input push, clk, rst;
	output sypush;
	
	//declaring regs and wires
	reg sypush;
	
	always@(posedge clk or posedge rst) begin
		//reset to 0
		if (rst) sypush = 0;
		//set to push
		else sypush = push;
	end
	
endmodule

