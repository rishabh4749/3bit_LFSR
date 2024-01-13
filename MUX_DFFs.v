`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.12.2023 10:48:17
// Design Name: 
// Module Name: MUX_DFFs
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module two_to_one(input a0,input a1,input sel,output out);
assign out=(sel & a1)|(~sel & a0);
endmodule
module DFF(input d,input clk,output reg q);
always @ (posedge clk) begin
q<=d;
end
endmodule
module mux_dffs(input a0,input a1,input L,input clk,output reg Q);
wire wire1;
two_to_one mux(a0,a1,L,wire1);
DFF ff(wire1,clk,Q);
endmodule
module top(
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
	wire wire1,wire2,wire3,wire4;
	assign wire3=wire2 ^ Q;
	assign wire4=Q;
	initial begin
	Q=q_in;
	end
	mux_dffs set1(wire4,r_in,L,clk,wire1);
	mux_dffs set2(wire1,r_in,L,clk,wire2);
	mux_dffs set3(wire3,r_in,L,clk,wire4);
	
endmodule
