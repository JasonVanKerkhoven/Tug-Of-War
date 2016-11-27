//Jason Van Kerkhoven
//Connor Emery

`timescale 1ns / 1ps

module latch(trigger, clr, out);
	//declaring inputs/outputs
	input trigger, clr;
	output out;
	
	//declaring wires and regs
	wire interm;
	
	//gatewise logic
	assign interm = (trigger | out);
	assign out = (trigger & clr);
	
endmodule
