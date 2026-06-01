/****************************************/
/*                                      */
/*           Tic Tac Toe Game           */
/*        Author: Lawrence Bloom        */
/* Source: habr.com/en/articles/707224/ */
/* *source was heavily modified         */
/*                                      */
/****************************************/
module TTT_Main(
   clock50MHz,
   switches,
   red,
	blue,
	green,
   hsync,
   vsync,
	endButton,
	resetButton,	
);
input  clock50MHz;  
input  [3:0] switches;
output[3:0]  red;
output[3:0]  blue;
output[3:0] green; 
input endButton;
input resetButton;
output hsync;   
output vsync;  

wire  isOverflowH;
wire  isOVerflowV;
wire  dat_act;
wire  clock25MHz;
wire isHorizontalActive;
wire isVerticalActive;
wire canDisplayImage;
wire [9:0] x;
wire [9:0] y;
wire[8:0] section_selected;
wire[17:0] symbol;
wire[1:0] winner;

clock_divider clock_divider(
clock50MHz, clock25MHz
);

Game_Controller game(
	.sw(switches),
	.endTurn(endButton),
	.reset(resetButton),
	.clk(clock50MHz),
	.section_selected(section_selected),
	.symbol(symbol),
	.winner(winner)
);

VGA VGA(clock25MHz, vsync, hsync, canDisplayImage, x, y);

Display_Controller display(x,y,symbol,winner,red,green,blue);

endmodule

