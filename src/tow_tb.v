`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:17:52 11/25/2016
// Design Name:   tow
// Module Name:   W:/Desktop/ToW/src/tow_tb.v
// Project Name:  ToW
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: tow
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

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

