`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:01:26 12/02/2020
// Design Name:   HW7LPCode
// Module Name:   C:/.Xilinx/HW7Compe475LP/HW7LPTest.v
// Project Name:  HW7Compe475LP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: HW7LPCode
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module HW7LPTest;

	// Inputs
	reg [31:0] portA;
	reg [31:0] portB;
	reg [1:0] op;
	reg [3:0] cmd;

	// Outputs
	wire [31:0] out;
	wire [3:0] flag;

	// Instantiate the Unit Under Test (UUT)
	HW7LPCode uut (
		.portA(portA), 
		.portB(portB), 
		.op(op), 
		.cmd(cmd), 
		.out(out), 
		.flag(flag)
	);

	initial begin
		// Initialize Inputs
		portA = 0;
		portB = 0;
		op = 0;
		cmd = 0;

		// Wait 100 ns for global reset to finish
		#100;
      portA = 32'h11111;
		portB = 32'h00001; 
		op=0;
		
		cmd = 1;
		#10;
		cmd = 2;
		#10;
		cmd = 3;
		#10;
		cmd = 4;
		#10;
		cmd = 4'b1100;
		#10;
		cmd = 4'b1010;
		#10;
		
		op=1;
		portA=15;
		portB=14;
		cmd=0;
		#10;
		cmd[3] = 1;
		
		#10;
		op=2;
		cmd=4'b0100;
		portA = 32'hFFFFFFFF;
		portB =10;
		
			

	end
      
endmodule

