/**
Module Name:			opp.v
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

module opp(sypush, clk, rst, winrnd);
	//declaring inputs and outputs
	input sypush, clk, rst;
	output winrnd;
	
	//declaring wires and reg
	wire winrnd;
	reg detect;


	always@(posedge clk or posedge rst) begin
		//reset
		if (rst) detect <= 0;
		//set to sypush
		else detect <= sypush;
		end

	//gates for winrnd (sypush and NOT detect)
	assign winrnd = sypush & ~detect;
endmodule


