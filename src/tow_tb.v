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
/*	
		//put the system in reset, then neutral
		@(posedge clk); #1;
		rst = 1;
		wait(led_out == 7'b1010101); 
		$display("%t - Reset, ", $time,led_out);
		@(posedge clk); #1; 
		rst = 0;
		wait(led_out == 7'b0000000);
		$display("%t - Entered dark state, ", $time,led_out);
		wait(led_out == 7'b0001000);
		$display("%t - Entered neutral state, ready to play", $time,led_out);


//===================================================================================		
//Test case 1: Left winning
		$display("%t - ==============================================", $time);
		$display("%t - Test case 1: Left pushing first from L2", $time);
		
		//go to L1 (only left push)
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		//wait(led_out == 7'b0010000);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0010000);
		$display("%t - Current led is at L1, led_out =  ", $time,led_out);
		
		//go to L2
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		//wait(led_out == 7'b0100000);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0100000);
		$display("%t - Current led is at L2, led_out =  ", $time,led_out);
		
		//go to L3 (left push before right)
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #2;
		pbr=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		//wait(led_out == 7'b1000000);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b1000000);
		$display("%t - Current led is at L3. led_out =  ", $time,led_out);
		
		//go to WL (left push before right)
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #2;
		pbr=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		//wait(led_out == 7'b1110000);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b1110000);
		$display("%t - Current led is at WL. led_out =  ", $time,led_out);


//===================================================================================		
//Test case 2: Right push from L2, then R until WR
		$display("%t - ==============================================", $time);
		$display("%t - Test case 2: Right push from L2, then right until WR", $time);
		
		//go to reset, then neutral
		@(posedge clk); #1;
		rst = 1;
		wait(led_out == 7'b1010101); 
		$display("%t - Reset, ", $time,led_out);
		@(posedge clk); #1;
		rst = 0;
		wait(led_out == 7'b0000000);
		$display("%t - Entered dark state, ", $time,led_out);
		wait(led_out == 7'b0001000);
		$display("%t - Entered neutral state, ready to play", $time,led_out);

		//go to L1 (only left push)
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0010000);
		$display("%t - Current led is at L1, led_out =  ", $time,led_out);
		
		//go to L2 (only left push)
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0100000);
		$display("%t - Current led is at L2, led_out =  ", $time,led_out);

		//go to L1 (right push before left)
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #2;
		pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0010000);
		$display("%t - Current led is at L1. led_out =  ", $time,led_out);
		
		//go to neutral (right push before left)
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #2;
		pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0001000);
		$display("%t - Current led is at N0. led_out =  ", $time,led_out);
		
		//go to R1 (right push before left)
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #2;
		pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0000100);
		$display("%t - Current led is at R1. led_out =  ", $time,led_out);
		
		//go to R2 (right push before left)
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #2;
		pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0000010);
		$display("%t - Current led is at R2. led_out =  ", $time,led_out);
		
		//go to R3 (right push, no left)
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0000001);
		$display("%t - Current led is at R3. led_out =  ", $time,led_out);
		
		//go to WR (right push before left)
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #2;
		pbr=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		//wait(led_out == 7'b1110000);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0000111);
		$display("%t - Current led is at WR. led_out =  ", $time,led_out);

//===================================================================================		
//Test case 3: Left push before Right at R3
		$display("%t - ==============================================", $time);
		$display("%t - Test case 3: Left push before Right at R3", $time);
		
		//go to reset, then neutral
		@(posedge clk); #1;
		rst = 1;
		wait(led_out == 7'b1010101); 
		$display("%t - Reset, ", $time,led_out);
		@(posedge clk); #1;
		rst = 0;
		wait(led_out == 7'b0000000);
		$display("%t - Entered dark state, ", $time,led_out);
		wait(led_out == 7'b0001000);
		$display("%t - Entered neutral state, ready to play", $time,led_out);
		
		//go to R1 (right push before left)
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #2;
		pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0000100);
		$display("%t - Current led is at R1. led_out =  ", $time,led_out);
		
		//go to R2 (right push before left)
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #2;
		pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0000010);
		$display("%t - Current led is at R2. led_out =  ", $time,led_out);
		
		//go to R3 (right push, no left)
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0000001);
		$display("%t - Current led is at R3. led_out =  ", $time,led_out);
		
		//go to R1 (left push before right)
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #2;
		pbr=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0000100);
		$display("%t - Current led is at R1. led_out =  ", $time,led_out);
		
		
//===================================================================================		
//Test case 4: Right jumping the gun on R1
		$display("%t - ==============================================", $time);
		$display("%t - Test case 4: Right jumping the gun on R2", $time);
		
		//go to reset, then neutral
		@(posedge clk); #1;
		rst = 1;
		wait(led_out == 7'b1010101); 
		$display("%t - Reset, ", $time,led_out);
		@(posedge clk); #1;
		rst = 0;
		wait(led_out == 7'b0000000);
		$display("%t - Entered dark state, ", $time,led_out);
		wait(led_out == 7'b0001000);
		$display("%t - Entered neutral state, ready to play", $time,led_out);
		
		//go to R1 (right push without left
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);			//not ready for input yet
		$display("%t - Current led is dark (score R1). led_out =  ", $time,led_out);
		$display("%t - right jumps the gun before prompted", $time);
		
		//right jumps gun, go to neutral (no left push)
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0001000);
		$display("%t - Current led is at N0. led_out =  ", $time,led_out);
		
		
//===================================================================================		
//Test case 5: Right jumping the gun on R3
		$display("%t - ==============================================", $time);
		$display("%t - Test case 5: Right jumping the gun on R3", $time);
		
		//go to reset, then neutral
		@(posedge clk); #1;
		rst = 1;
		wait(led_out == 7'b1010101); 
		$display("%t - Reset, ", $time,led_out);
		@(posedge clk); #1;
		rst = 0;
		wait(led_out == 7'b0000000);
		$display("%t - Entered dark state, ", $time,led_out);
		wait(led_out == 7'b0001000);
		$display("%t - Entered neutral state, ready to play", $time,led_out);
		
		//go to R1 (right push before left)
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #2;
		pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0000100);
		$display("%t - Current led is at R1. led_out =  ", $time,led_out);
		
		//go to R2 (right push before left)
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #2;
		pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0000010);
		$display("%t - Current led is at R2. led_out =  ", $time,led_out);
		
		//go to R3 (right push, no left)
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);		//not ready for input yet
		$display("%t - Current led is dark (score R3). led_out =  ", $time,led_out);
		$display("%t - Right jumps the gun before prompted", $time);
		
		//right jumps gun, go to R3 (no left push)
		@(posedge clk); #1;
		pbr=1; pbl=0;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0000010);
		$display("%t - Current led is at R2. led_out =  ", $time,led_out);
		
	
//===================================================================================		
//Test case 6: Left jumping the gun at L1
		$display("%t - ==============================================", $time);
		$display("%t - Test case 6: left jumping the gun at L1", $time);
		
		//go to reset, then neutral
		@(posedge clk); #1;
		rst = 1;
		wait(led_out == 7'b1010101); 
		$display("%t - Reset, ", $time,led_out);
		@(posedge clk); #1;
		rst = 0;
		wait(led_out == 7'b0000000);
		$display("%t - Entered dark state, ", $time,led_out);
		wait(led_out == 7'b0001000);
		$display("%t - Entered neutral state, ready to play", $time,led_out);
		
		//go to L1 (right push without left
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);			//not ready for input yet
		$display("%t - Current led is dark (score L1). led_out =  ", $time,led_out);
		$display("%t - Left jumps the gun before prompted", $time);
		
		//right jumps gun, go to neutral (no left push)
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0001000);
		$display("%t - Current led is at N0. led_out =  ", $time,led_out);
		
		
//===================================================================================		
//Test case 7: Left jumping the gun on L3
		$display("%t - ==============================================", $time);
		$display("%t - Test case 7: Left jumping the gun on L3", $time);
		
		//go to reset, then neutral
		@(posedge clk); #1;
		rst = 1;
		wait(led_out == 7'b1010101); 
		$display("%t - Reset, ", $time,led_out);
		@(posedge clk); #1;
		rst = 0;
		wait(led_out == 7'b0000000);
		$display("%t - Entered dark state, ", $time,led_out);
		wait(led_out == 7'b0001000);
		$display("%t - Entered neutral state, ready to play", $time,led_out);
		
		//go to L1 (left push before right)
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #2;
		pbr=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0010000);
		$display("%t - Current led is at L1. led_out =  ", $time,led_out);
		
		//go to L2 (left push before right)
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #2;
		pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0100000);
		$display("%t - Current led is at L2. led_out =  ", $time,led_out);
		
		//go to L3 (left push, no right)
		@(posedge clk); #1;
		pbr=0; pbl=1; 
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);		//not ready for input yet
		$display("%t - Current led is dark (score L3). led_out =  ", $time,led_out);
		$display("%t - Left jumps the gun before prompted", $time); 
		
		//left jumps gun, go to neutral (no right push)
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #1;
		pbr=0; pbl=0;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0100000); 
		$display("%t - Current led is at L2. led_out =  ", $time,led_out);
*/		

//===================================================================================		
//Test case 8: Holding left button
		$display("%t - ==============================================", $time);
		$display("%t - Test case 8: Holding left button", $time);
		
		//go to reset, then neutral
		@(posedge clk); #1;
		rst = 1;
		wait(led_out == 7'b1010101); 
		$display("%t - Reset, ", $time,led_out);
		@(posedge clk); #1;
		rst = 0;
		wait(led_out == 7'b0000000);
		$display("%t - Entered dark state, ", $time,led_out);
		wait(led_out == 7'b0001000);
		$display("%t - Entered neutral state, ready to play", $time,led_out);
		
		$display("%t - Test case 1: Left pushing first from L2", $time);
		
		//go to L1 (only left push leaving left on for 7 clks)
		@(posedge clk); #1;
		pbr=0; pbl=1;
		@(posedge clk); #1000;
		pbr=0; pbl=0;
		//wait(led_out == 7'b0010000);
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0010000);
		$display("%t - Current led is at L1, led_out =  ", $time,led_out);
		
//===================================================================================		
//Test case 9: Tie
		$display("%t - ==============================================", $time);
		$display("%t - Test case 9: Tie", $time);

		// testing tie state should stay at L1 
		@(posedge clk); #1;
		pbr = 1; pbl = 1;
		@(posedge clk); #1; 
		pbr = 0; pbl = 0; #50;
		wait(led_out == 7'b0000000);
		wait(led_out == 7'b0010000);
		$display("%t - Current led is at L1, led_out =  ", $time,led_out);
		 
		$finish; 
	end 
	
endmodule

