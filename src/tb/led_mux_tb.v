`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:38:49 11/25/2016
// Design Name:   led_mux
// Module Name:   W:/Desktop/ToW/src/tb/led_mux_tb.v
// Project Name:  ToW
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: led_mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module led_mux_tb;

	// Inputs
	reg [6:0] score;
	reg [1:0] led_ctrl;

	// Outputs
	wire [6:0] led_out;
	
	//other wires/regs
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	led_mux uut (
		.score(score), 
		.led_ctrl(led_ctrl), 
		.led_out(led_out)
	);
	
	// set up a clock that toggles every 10 ns
	always #10 clk <= ~clk;

	initial begin
		// Initialize Inputs
		score = 0;
		led_ctrl = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		//test with reset state input
		//================================================
		@(posedge clk); #1;
		led_ctrl = 2'b11;
		@(posedge clk); #1;
		if (led_out == 7'b1111111) $display("%t - SUCCESS. Output: %b", $time, led_out);
		else								$display("%t - FAILURE. Output: %b", $time, led_out);
		//reset back to zero
		led_ctrl = 2'b00;
		
		
		//test with score input
		//================================================
		@(posedge clk); #1;
		led_ctrl = 2'b10;
		score = 7'b1110000;
		@(posedge clk); #1;
		if (led_out == 7'b1110000) $display("%t - SUCCESS. Output: %b", $time, led_out);
		else								$display("%t - FAILURE. Output: %b", $time, led_out);
		
		
		//test with dark state input
		//================================================
		@(posedge clk); #1;
		led_ctrl = 2'b00;
		@(posedge clk); #1;
		if (led_out == 7'b0000000) $display("%t - SUCCESS. Output: %b", $time, led_out);
		else								$display("%t - FAILURE. Output: %b", $time, led_out);

	end
      
endmodule

