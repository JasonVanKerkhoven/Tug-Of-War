//time scale
`timescale 1 ns/ 1ps


/***********************************************/
//Author:		Jason Van Kerkhoven
//Module:		DIV256.v
/***********************************************/

module DIV256(clk, rst, slowen);

	//declaring inputs/outputs
	input clk;
	input rst;
	output slowen;
	
	//declaring regs
	reg [7:0] count;
	
	always @(posedge clk or posedge rst) begin
		if (rst) count <= 0;
		else count <= count + 1;
	end
	assign slowen = &count;
	
endmodule