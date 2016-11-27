/**
*Module Name:		tow_tb.v
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

module tow_tb;

	// Inputs
	reg pbr;
	reg pbl;
	reg CLK_I;
	reg rst;

	// Outputs
	wire [6:0] Led;

	// Instantiate the Unit Under Test (UUT)
	tow uut (
		.pbr(pbr), 
		.pbl(pbl), 
		.CLK_I(CLK_I), 
		.rst(rst), 
		.Led(Led)
	);

	initial begin
		// Initialize Inputs
		pbr = 0;
		pbl = 0;
		CLK_I = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

