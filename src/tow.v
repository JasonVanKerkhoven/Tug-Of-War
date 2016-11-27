/**
*Module Name:		tow.v
*Project:			ToW
*Author:			Jason Van Kerkhoven
*					Connor Emery
*Date of Update:	27/11/2016                                              
*Version:           1.0.0                                                      

*Purpose:           TODO
* 
* 
*Update Log:		v1.0.0
						- intial commit
*/
`timescale 1ns / 1ps

module tow(
    input pbr,
    input pbl,
    input CLK_I,
    input rst,
    output [6:0] Led
    );
//Complete wire signals needed below ???


//Slower Clock from 100Mhz to 500Hz -Given DO NOT remove 
clk_div createCLKdivide(.CLK_I(CLK_I),.rst(rst), .clk(clk));

//----------------------------------------------------------------------
//Instantiate PBL Sync OPP ??? 


//----------------------------------------------------------------------
//Instantiate scorer Led_Mux pushCounter


//----------------------------------------------------------------------
//Div256 LFSR MC speed_controller
div256 createSLOWEN(clk,rst,slowen, slowen1024, slowen64);
lfsr createRAND(clk,rst,rand, randFake, randSpeed);
mc createMASTERCONTROLLER(winrnd,slowen,rand,randFake,randSpeed,clk,rst,speed_exit,winspeed,speed_round,leds_on,clear,led_control, fake);
speed_controller speed_controller(clk,rst,slowen, slowen1024,slowen64,speed_round,speed_tie,speed_right,speed_led,winspeed,speed_exit);

endmodule
