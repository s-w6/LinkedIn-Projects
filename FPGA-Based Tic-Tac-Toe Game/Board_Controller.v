/**************************/
/*                        */
/*    Board Controller    */
/* Author: Lawrence Bloom */
/*                        */
/**************************/
module Board_Controller(clk, reset, player, endTurn, section_selected, symbol);
	/*
	This circuit contains all the logic for the 9 board squares
	*/
	input clk, reset, player, endTurn;
	input [8:0] section_selected;
	output [17:0] symbol;
	
	Board_Square top_left(
		.clk(clk),
		.section_selected(section_selected[0]),
		.reset(reset),
		.player(player),
		.endTurn(endTurn),
		.symbol(symbol[1:0])
	);
	
	Board_Square top_mid(
		.clk(clk),
		.section_selected(section_selected[1]),
		.reset(reset),
		.player(player),
		.endTurn(endTurn),
		.symbol(symbol[3:2])
	);
	
	Board_Square top_right(
		.clk(clk),
		.section_selected(section_selected[2]),
		.reset(reset),
		.player(player),
		.endTurn(endTurn),
		.symbol(symbol[5:4])
	);
	
	Board_Square mid_left(
		.clk(clk),
		.section_selected(section_selected[3]),
		.reset(reset),
		.player(player),
		.endTurn(endTurn),
		.symbol(symbol[7:6])
	);
	
	Board_Square mid_mid(
		.clk(clk),
		.section_selected(section_selected[4]),
		.reset(reset),
		.player(player),
		.endTurn(endTurn),
		.symbol(symbol[9:8])
	);
	
	Board_Square mid_right(
		.clk(clk),
		.section_selected(section_selected[5]),
		.reset(reset),
		.player(player),
		.endTurn(endTurn),
		.symbol(symbol[11:10])
	);
	
	Board_Square bot_left(
		.clk(clk),
		.section_selected(section_selected[6]),
		.reset(reset),
		.player(player),
		.endTurn(endTurn),
		.symbol(symbol[13:12])
	);
	
	Board_Square bot_mid(
		.clk(clk),
		.section_selected(section_selected[7]),
		.reset(reset),
		.player(player),
		.endTurn(endTurn),
		.symbol(symbol[15:14])
	);
	
	Board_Square bot_right(
		.clk(clk),
		.section_selected(section_selected[8]),
		.reset(reset),
		.player(player),
		.endTurn(endTurn),
		.symbol(symbol[17:16])
	);
	
	
	
endmodule
