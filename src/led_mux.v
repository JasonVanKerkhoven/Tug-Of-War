`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:40 11/25/2016 
// Design Name: 
// Module Name:    led_mux 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module led_mux(score, led_ctrl, led_out);
	//declaring inputs
	input wire [6:0] score;			//7bit
	input wire [1:0] led_ctrl;		//2bit 
	
	//declaring outputs
	output reg [6:0] led_out;		//7bit
	
	
	//main mux logic
	always @(led_ctrl or score) begin
		case(led_ctrl)
			2'b11:		led_out = 7'b1111111;		//reset state
			2'b10:		led_out = score;				//shows current score
			2'b00:		led_out = 7'b0000000;		//dark state
			default:		led_out <= led_out;			//do nothing
		endcase
	end
	

endmodule
