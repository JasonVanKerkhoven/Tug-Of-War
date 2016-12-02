/**
Module Name:			pmod_controller.v
Project:					ToW
Author:					Jason Van Kerkhoven
							Connor Emery
Date of Update:		01/12/2016                                              
Version:           	1.0.0                                                      

Purpose:           	TODO
 
 
Update Log:				v1.0.0
								- null
*/
`timescale 1 ns / 1ps

module pmod_controller(rst, pbr, pbl, CLK_I, pmod_speaker, pmod_gain, pmod_enable);
	
	//module I/O
	input CLK_I;
	input rst;
	input	pbl;
	input pbr;
	output pmod_speaker;
	output pmod_gain;
	output pmod_enable;
	
	//constants
	//clock 100Mhz / 700Hz ---> get a 700Hz PWM using counter from 0-max
	parameter max = 100000000/700;
	
	//internal regs/wires
	reg [17:0] counter;
	reg pmod_speaker;
	reg pmod_gain;
	reg pmod_enable;
	wire pbl;
	wire pbr;
	wire rst;

	//generate waveform and play sounds
	always @(posedge CLK_I or posedge rst or posedge pbl or posedge pbr) 
	begin
	
		//play 700Hz sound when user presses rst or whe  the user wins
		if(rst == 1 || pbl == 1 || pbr == 1)
		begin
			pmod_gain <= 0;
			pmod_enable <= 1;
			pmod_speaker <= 1;
		end

		//reset counter to 0, flip pmod_speaker signal
		else if(counter == max) 
		begin 
			counter <= 0; 
			pmod_speaker <= ~pmod_speaker;
		end

		//inc counter
		else 
		begin
			counter <= counter+1;
			pmod_enable <= 0;
		end
	end
endmodule

