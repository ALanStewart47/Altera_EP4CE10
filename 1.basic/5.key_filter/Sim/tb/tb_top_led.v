// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// *****************************************************************************
// This file contains a Verilog test bench template that is freely editable to  
// suit user's needs .Comments are provided in each section to help the user    
// fill out necessary details.                                                  
// *****************************************************************************
// Generated on "01/06/2024 15:43:39"
                                                                                
// Verilog Test Bench template for design : top_led
// 
// Simulation tool : ModelSim (Verilog)
// 

`timescale 1 ns/ 1 ns
module tb_top_led();


parameter T = 20;
// constants                                           
// general purpose registers

// test vector input registers
reg key;
reg sys_clk;
reg sys_rst_n;
reg	key_value;
// wires                                               
wire led;

// assign statements (if any)                          
top_led i1 (
// port map - connection between master ports and signals/registers   
	.key		(key),
	.led		(led),
	.sys_clk	(sys_clk),
	.sys_rst_n	(sys_rst_n)
);
initial                                                
begin                                                  
    key                          <= 1'b1;
    sys_clk                      <= 1'b0;
    sys_rst_n                    <= 1'b0; 
    #20           sys_rst_n      <= 1'b1;  //在第20ns的时候复位信号信号拉高 
    #30           key            <= 1'b0;  //在第50ns的时候按下按键
    #20           key            <= 1'b1;  //模拟抖动
    #20           key            <= 1'b0;  //模拟抖动
    #20           key            <= 1'b1;  //模拟抖动
    #20           key            <= 1'b0;  //模拟抖动
    #170          key            <= 1'b1;  //在第300ns的时候松开按键
    #20           key            <= 1'b0;  //模拟抖动
    #20           key            <= 1'b1;  //模拟抖动
    #20           key            <= 1'b0;  //模拟抖动
    #20           key            <= 1'b1;  //模拟抖动
    #170          key            <= 1'b0;  //在第550ns的时候再次按下按键
    #20           key            <= 1'b1;  //模拟抖动
    #20           key            <= 1'b0;  //模拟抖动
    #20           key            <= 1'b1;  //模拟抖动
    #20           key            <= 1'b0;  //模拟抖动
    #170          key            <= 1'b1;  //在第800ns的时候松开按键
    #20           key            <= 1'b0;  //模拟抖动
    #20           key            <= 1'b1;  //模拟抖动
    #20           key            <= 1'b0;  //模拟抖动
    #20           key            <= 1'b1;  //模拟抖动                    
end  

always	# (T/2) sys_clk <= ~sys_clk;                                            
                                                
endmodule

