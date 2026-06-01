/**************************/
/*                        */
/*      Board Square      */
/* Author: Lawrence Bloom */
/*                        */
/**************************/
module Board_Square(clk, section_selected, reset, player, endTurn, symbol);
	/*
	This module determines what symbol should be displayed for the given square
	symbol = 00; square should be empty
	symbol = 01; square should display a O
	symbol = 10; square should display a X
	symbol = 11; should never occur (invalid state)
	
	This result should be passed to the display driver for each square that will take the symbol and actually display it
	This result can also be passed to the winner module to keep track of a potential winner
	
	state machine is disabled when enable = 0
	state will not change until enable set to high
	can only be done by pressing reset button
	This will prevent two people from playing in the same square

	*/
	
	input clk, section_selected, player, reset, endTurn;
	output reg[1:0] symbol;
	
	reg[0:1] state;
	reg enable;
	
	parameter zero=0, one=1, two=2;
	
	initial
	begin
		enable <= 1;
	end
	
	always @(state) 
	begin
		case (state)
			zero:
				symbol = 2'b00;
			one:
				symbol = 2'b01;
			two:
				symbol = 2'b10;
			default:
				symbol = 2'b00;
		endcase
	end
	
	always @(posedge clk or negedge reset or negedge endTurn)
		begin
		if (!reset)
		begin
			state = zero;
			enable <= 1;
		end
		else if (!endTurn)
		begin
			if (section_selected)
				enable <= 0;
		end
		else
			if (!section_selected & enable)
				state = zero;
			else
			case (state)
				zero:
					if (player & enable)
						state = two;
					else if (~player & enable)
						state = one;
					else
						state = zero;
				one:
					if (player & enable)
						state = two;
					else if (~player & enable)
						state = one;
					else
						state = one;
				two:
					if (player & enable)
						state = two;
					else if (~player & enable)
						state = one;
					else
						state = two;
			endcase
		end
endmodule
