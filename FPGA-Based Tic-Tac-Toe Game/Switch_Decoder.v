/**************************/
/*                        */
/*     Switch Decoder     */
/* Author: Lawrence Bloom */
/*                        */
/**************************/
module Switch_Decoder(sw,section_selected);
	/*
	Takes input from for switches (3,2,1,0)
	and sets output high for grid coordinate
	
	section_selected = high when selected by switches
	
	when switches at 0000 no section selected
	
	 1 | 2 | 3
	----------
	 4 | 5 | 6 
	----------
	 7 | 8 | 9 
	*/
	input[3:0] sw;
	output[8:0] section_selected;
	
	
	assign section_selected[0] = ~sw[3] & ~sw[2] & ~sw[1] & sw[0]; //1
	assign section_selected[1] = ~sw[3] & ~sw[2] & sw[1] & ~sw[0]; //2
	assign section_selected[2] = ~sw[3] & ~sw[2] & sw[1] & sw[0];  //3
	assign section_selected[3] = ~sw[3] & sw[2] & ~sw[1] & ~sw[0]; //4
	assign section_selected[4] = ~sw[3] & sw[2] & ~sw[1] & sw[0];  //5
	assign section_selected[5] = ~sw[3] & sw[2] & sw[1] & ~sw[0];  //6
	assign section_selected[6] = ~sw[3] & sw[2] & sw[1] & sw[0];   //7
	assign section_selected[7] = sw[3] & ~sw[2] & ~sw[1] & ~sw[0]; //8
	assign section_selected[8] = sw[3] & ~sw[2] & ~sw[1] & sw[0];  //9
	

endmodule
