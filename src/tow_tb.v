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
	always #2 clk <= ~clk;
	
	
	initial begin
		// Initialize Inputs
		rst = 0;
		clk = 0;
		pbr = 0;
		pbl = 0; 
		
		// Wait 100 ns for global reset to finish
		#100; 
		
		
		//put the system in reset
		rst = 1;
		wait(led_out == 7'b1101100); 
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
		$display("%t - ////////////////////////////////////////", $time);
		$display("%t - Test case 1: Left pushing first from L2. ", $time);
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0010000);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0010000);
		
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0100000);
		$display("%t - Current led is at L2, led_out =  ", $time,led_out);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0100000);
	
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b1000000);
		$display("%t - After left pushing first from L2, current led is at L3. led_out =  ", $time,led_out);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b1000000);
		
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0010000);
		$display("%t - After right pushing first from L3, current led is at L1 (favour the loser). led_out =  ", $time,led_out);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0010000);
		
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0100000);
		$display("%t - After left pushing first from L1, current led is at L2. led_out =  ", $time,led_out);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0100000);
		
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b1000000);
		$display("%t - After left pushing first from L2 again, current led is at L3. led_out =  ", $time,led_out);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b1000000);
		
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait (led_out == 7'b1110000);
		$display("%t - Left should win. led_out =  ", $time,led_out);
		#2;
		rst = 1;
			
//===================================================================================			   
//Test case 2: Right pushing first from L2
		
		wait(led_out == 7'b0011001); 
		@(posedge clk); #1;
		rst = 0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0001000);
		$display("%t - ////////////////////////////////////////", $time);
		$display("%t - Test case 2: Right pushing first from L2. ", $time);
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0010000);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0010000);
		
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0100000);
		$display("%t - Current led is at L2,led_out =  ", $time,led_out);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0100000);
	
		
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0010000);
		$display("%t - After right pushing first from L2, current led is at L1, led_out =  ", $time,led_out);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0010000);		
			
//===================================================================================		
//Test case 3: Left pushing first from R3
		rst = 1;
		wait(led_out == 7'b0011001); 
		@(posedge clk); #1;
		rst = 0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0001000);
		$display("%t - ////////////////////////////////////////", $time);
		$display("%t - Test case 3: Left pushing first from R3. ", $time);
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000100);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0000100);
		
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000010);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0000010);
	
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000001);
		$display("%t - Current led is at R3, led_out = , ", $time,led_out);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0000001);			
	
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000100);
		$display("%t - After left pushing first from R3, current led is at R1, led_out =  ", $time,led_out);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0000100);	

//===================================================================================		
//Test case 4: Right jumping the light from R3			
		$display("%t - ////////////////////////////////////////", $time);
		$display("%t - Test case 4: Right jumping the light from R3. ", $time);
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000010);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0000010);
		
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000001);
		$display("%t - Current led is at R3,led_out = ", $time,led_out);
		wait(led_out == 7'b0000000);
		
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000010);
		$display("%t - After right jumping the light from R3, current led is at R2, led_out = ", $time,led_out);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0000010);
			
//===================================================================================		
//Test case 5: Tie Push and Right pushing first from R3					
		$display("%t - ////////////////////////////////////////", $time);
		$display("%t - Test case 5: Tie Push and Right pushing first from R3. ", $time);
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000001);
		$display("%t - Current led is at R3, led_out = ", $time,led_out);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0000001);
		
		@(posedge clk); #1;
		pbr=1; pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000001);
		$display("%t - Tie Push. led_out = ", $time,led_out);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0000001);	
		
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000111);
		$display("%t - After right pushing first from R3, Right player is a WINNER, led_out = ", $time,led_out);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0000111);
		#10;
		$finish; 
	end 
	
endmodule

