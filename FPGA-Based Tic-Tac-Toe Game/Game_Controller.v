/**************************/
/*                        */
/*     Game Controller    */
/* Author: Lawrence Bloom */
/*                        */
/**************************/
module Game_Controller(sw, endTurn, reset, clk, section_selected, symbol, winner);
	input[3:0] sw; //4 switches for selecting position
	input endTurn; // End turn button
	input reset; //reset game button
	input clk; //clk input
	
	output[8:0] section_selected;
	output[17:0] symbol;
	output[1:0] winner;
	reg player;
	
	initial
	begin
		player <= 1;
	end
	
	always@ (negedge endTurn)
	begin
		player <= ~player;
	end
	
	Switch_Decoder decode(
		.sw(sw),
		.section_selected(section_selected)
	);
	
	Board_Controller board(
		.clk(clk),
		.reset(reset),
		.player(player),
		.endTurn(endTurn),
		.section_selected(section_selected),
		.symbol(symbol));
		
	Win_Detector win(
		.symbol(symbol),
		.endTurn(endTurn),
		.reset(reset),
		.winner(winner)
		);
	
endmodule
