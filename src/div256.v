/**
*Module Name:		div256.v
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
`timescale 1 ns/ 1ps


module div256(clk, rst, slowen);

	//declaring inputs/outputs
	input clk;
	input rst;
	output slowen;
	
	//declaring regs
	reg [7:0] count;
	
	always @(posedge clk or posedge rst) begin
		if (rst) count <= 0;
		else count <= count + 1;
	end
	assign slowen = &count;
	
endmodule