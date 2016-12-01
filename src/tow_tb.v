/**
Module Name:			tow_tb.v
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

module tow_tb();
	
	//inputs
	reg rst;
	reg clk;
	reg pbr;
	reg pbl;
	
	//outputs
	wire [6:0] led_out;
	
	
	// Instantiate the Unit Under Test (UUT)
	tow top(.rst(rst), .clk(clk), .pbr(pbr), .pbl(pbl), .led_out(led_out));
	
	
	//clock setup
	always #10 clk <= ~clk; 
	
	
	initial begin
		// Initialize Inputs 
		rst = 0;
		clk = 0;
		pbr = 0;
		pbl = 0; 
		
		// Wait 100 ns for global reset to finish
		#100; 
		$display("%t - Begining Tests...", $time); 
		
		//put the system in reset
		@(posedge clk); #1;
		rst = 1;
		wait(led_out == 7'b1111111); 
		$display("%t - Reset, ", $time,led_out);

		//remove system from reset
		@(posedge clk); #1;
		rst = 0;
		
		wait(led_out == 7'b0000000);
		$display("%t - All the lights come off, ", $time,led_out);
		
		wait(led_out == 7'b0001000);
		$display("%t - Middle light comes on. Ready to play, ", $time,led_out);
//===================================================================================		
//Test case 1: Left winning
		
		
		
		
		
		
		$finish; 
	end 
	
endmodule

