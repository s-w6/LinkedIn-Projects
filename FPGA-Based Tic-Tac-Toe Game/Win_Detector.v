/**************************/
/*                        */
/*    Winner Algorithm    */
/* Author: Lawrence Bloom */
/*                        */
/**************************/
module Win_Detector(symbol, endTurn, reset, winner);

	input[17:0] symbol;
	input endTurn, reset;
	output reg[1:0] winner;
	
	always @(negedge endTurn or negedge reset)
	begin
		if (!reset)
		begin
			winner[1] <= 0;
			winner[0] <= 0;
		end
		if (!endTurn)
		begin
		if (  (symbol[1] && symbol[3] && symbol[5]) || (symbol[7] && symbol[9] && symbol[11]) || (symbol[13] && symbol[15] && symbol[17])
			|| (symbol[1] && symbol[7] && symbol[13]) || (symbol[3] && symbol[9] && symbol[15]) || (symbol[5] && symbol[11] && symbol[17])
			|| (symbol[1] && symbol[9] && symbol[17]) || (symbol[13] && symbol[9] && symbol[5]))
			winner[1] <= 1;
		
		else if ((symbol[0] && symbol[2] && symbol[4]) || (symbol[6] && symbol[8] && symbol[10]) || (symbol[12] && symbol[14] && symbol[16])
			|| (symbol[0] && symbol[6] && symbol[12]) || (symbol[2] && symbol[8] && symbol[14]) || (symbol[4] && symbol[10] && symbol[16])
			|| (symbol[0] && symbol[8] && symbol[16]) || (symbol[12] && symbol[8] && symbol[4]))
			winner[0] <= 1;
		end
	end
	
endmodule
