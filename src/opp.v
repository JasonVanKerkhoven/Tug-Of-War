//Jason Van Kerkhoven
//Connor Emery

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


