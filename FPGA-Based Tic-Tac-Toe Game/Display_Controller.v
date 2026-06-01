/****************************/
/*                          */
/*  VGA Display Controller  */
/*  Author: Lawrence Bloom  */
/*                          */
/****************************/
module Display_Controller(
input [9:0] x,
input [9:0] y,
input [17:0] symbol,
input [1:0] winner,
output reg [3:0] red,
output reg [3:0] green,
output reg [3:0] blue);

parameter xOffset1 = 170;
parameter yOffset1 = 80;
parameter xOffset2 = 285;
parameter yOffset2 = 80;
parameter xOffset3 = 400;
parameter yOffset3 = 80;
parameter xOffset4 = 170;
parameter yOffset4 = 200;
parameter xOffset5 = 285;
parameter yOffset5 = 200;
parameter xOffset6 = 400;
parameter yOffset6 = 200;
parameter xOffset7 = 170;
parameter yOffset7 = 340;
parameter xOffset8 = 285;
parameter yOffset8 = 340;
parameter xOffset9 = 400;
parameter yOffset9 = 340;
parameter xOffset10 = 285;
parameter yOffset10 = 0;

always @(x||y||symbol)
begin
if(y>=305 && y<315 && x>=158 && x<482) // Bottom Bar
	begin
		red <= 4'hF;
		green <= 4'hF;
		blue <= 4'hF;
	end
	else if(y>=165 && y<175 && x>=158 && x<482) // Top Bar
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	else if(x>=258 && x<268 && y>=60 && y < 420) // Left Bar
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	else if(x>=370 && x<380 && y>=60 && y < 420) // Right Bar
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	//This creates an "X" in top left
	else if (((x>=10+xOffset1 && x <15+xOffset1 && y>=10+yOffset1 && y<15+yOffset1)
		|| (x>=15+xOffset1 && x <20+xOffset1 && y>=15+yOffset1 && y<20+yOffset1) || (x>=20+xOffset1 && x <25+xOffset1 && y>=20+yOffset1 && y<25+yOffset1)
		|| (x>=25+xOffset1 && x <30+xOffset1 && y>=25+yOffset1 && y<30+yOffset1) || (x>=30+xOffset1 && x <35+xOffset1 && y>=30+yOffset1 && y<35+yOffset1)
		|| (x>=35+xOffset1 && x <40+xOffset1 && y>=35+yOffset1 && y<40+yOffset1) || (x>=40+xOffset1 && x <45+xOffset1 && y>=40+yOffset1 && y<45+yOffset1)
		|| (x>=45+xOffset1 && x <50+xOffset1 && y>=45+yOffset1 && y<50+yOffset1) || (x>=50+xOffset1 && x <55+xOffset1 && y>=50+yOffset1 && y<55+yOffset1)
		|| (x>=10+xOffset1 && x <15+xOffset1 && y>=50+yOffset1 && y<55+yOffset1) || (x>=15+xOffset1 && x <20+xOffset1 && y>=45+yOffset1 && y<50+yOffset1)
		|| (x>=20+xOffset1 && x <25+xOffset1 && y>=40+yOffset1 && y<45+yOffset1) || (x>=25+xOffset1 && x <30+xOffset1 && y>=35+yOffset1 && y<40+yOffset1)
		|| (x>=30+xOffset1 && x <35+xOffset1 && y>=30+yOffset1 && y<35+yOffset1) || (x>=35+xOffset1 && x <40+xOffset1 && y>=25+yOffset1 && y<30+yOffset1)
		|| (x>=40+xOffset1 && x <45+xOffset1 && y>=20+yOffset1 && y<25+yOffset1) || (x>=45+xOffset1 && x <50+xOffset1 && y>=15+yOffset1 && y<20+yOffset1)
		|| (x>=50+xOffset1 && x <55+xOffset1 && y>=10+yOffset1 && y<15+yOffset1))&& (symbol[1] == 1))
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	//This creates an "O" in top left
	else if (((x>=25+xOffset1 && x<40+xOffset1 && y>=50+yOffset1 && y<55+yOffset1)
		|| (x>=20+xOffset1 && x<25+xOffset1 && y>=45+yOffset1 && y<50+yOffset1) || (x>=40+xOffset1 && x<45+xOffset1 && y>=45+yOffset1 && y<50+yOffset1)
		|| (x>=15+xOffset1 && x<20+xOffset1 && y>=40+yOffset1 && y<45+yOffset1) || (x>=45+xOffset1 && x<50+xOffset1 && y>=40+yOffset1 && y<45+yOffset1)
		|| (x>=10+xOffset1 && x<15+xOffset1 && y>=35+yOffset1 && y<40+yOffset1) || (x>=50+xOffset1 && x<55+xOffset1 && y>=35+yOffset1 && y<40+yOffset1)
		|| (x>=5+xOffset1 && x<10+xOffset1 && y>=20+yOffset1 && y<35+yOffset1) || (x>=55+xOffset1 && x<60+xOffset1 && y>=20+yOffset1 && y<35+yOffset1)
		|| (x>=10+xOffset1 && x<15+xOffset1 && y>=15+yOffset1 && y<20+yOffset1) || (x>=50+xOffset1 && x<55+xOffset1 && y>=15+yOffset1 && y<20+yOffset1)
		|| (x>=15+xOffset1 && x<20+xOffset1 && y>=10+yOffset1 && y<15+yOffset1) || (x>=45+xOffset1 && x<50+xOffset1 && y>=10+yOffset1 && y<15+yOffset1)
		|| (x>=20+xOffset1 && x<25+xOffset1 && y>=5+yOffset1 && y<10+yOffset1) || (x>=40+xOffset1 && x<45+xOffset1 && y>=5+yOffset1 && y<10+yOffset1)
		|| (x>=25+xOffset1 && x<40+xOffset1 && y>=0+yOffset1 && y<5+yOffset1)) && (symbol[0] == 1))
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	//This creates an "X" in top mid
	else if (((x>=10+xOffset2 && x <15+xOffset2 && y>=10+yOffset2 && y<15+yOffset2)
		|| (x>=15+xOffset2 && x <20+xOffset2 && y>=15+yOffset2 && y<20+yOffset2) || (x>=20+xOffset2 && x <25+xOffset2 && y>=20+yOffset2 && y<25+yOffset2)
		|| (x>=25+xOffset2 && x <30+xOffset2 && y>=25+yOffset2 && y<30+yOffset2) || (x>=30+xOffset2 && x <35+xOffset2 && y>=30+yOffset2 && y<35+yOffset2)
		|| (x>=35+xOffset2 && x <40+xOffset2 && y>=35+yOffset2 && y<40+yOffset2) || (x>=40+xOffset2 && x <45+xOffset2 && y>=40+yOffset2 && y<45+yOffset2)
		|| (x>=45+xOffset2 && x <50+xOffset2 && y>=45+yOffset2 && y<50+yOffset2) || (x>=50+xOffset2 && x <55+xOffset2 && y>=50+yOffset2 && y<55+yOffset2)
		|| (x>=10+xOffset2 && x <15+xOffset2 && y>=50+yOffset2 && y<55+yOffset2) || (x>=15+xOffset2 && x <20+xOffset2 && y>=45+yOffset2 && y<50+yOffset2)
		|| (x>=20+xOffset2 && x <25+xOffset2 && y>=40+yOffset2 && y<45+yOffset2) || (x>=25+xOffset2 && x <30+xOffset2 && y>=35+yOffset2 && y<40+yOffset2)
		|| (x>=30+xOffset2 && x <35+xOffset2 && y>=30+yOffset2 && y<35+yOffset2) || (x>=35+xOffset2 && x <40+xOffset2 && y>=25+yOffset2 && y<30+yOffset2)
		|| (x>=40+xOffset2 && x <45+xOffset2 && y>=20+yOffset2 && y<25+yOffset2) || (x>=45+xOffset2 && x <50+xOffset2 && y>=15+yOffset2 && y<20+yOffset2)
		|| (x>=50+xOffset2 && x <55+xOffset2 && y>=10+yOffset2 && y<15+yOffset2))&& (symbol[3] == 1))
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	//This creates an "O" in top mid
	else if (((x>=25+xOffset2 && x<40+xOffset2 && y>=50+yOffset2 && y<55+yOffset2)
		|| (x>=20+xOffset2 && x<25+xOffset2 && y>=45+yOffset2 && y<50+yOffset2) || (x>=40+xOffset2 && x<45+xOffset2 && y>=45+yOffset2 && y<50+yOffset2)
		|| (x>=15+xOffset2 && x<20+xOffset2 && y>=40+yOffset2 && y<45+yOffset2) || (x>=45+xOffset2 && x<50+xOffset2 && y>=40+yOffset2 && y<45+yOffset2)
		|| (x>=10+xOffset2 && x<15+xOffset2 && y>=35+yOffset2 && y<40+yOffset2) || (x>=50+xOffset2 && x<55+xOffset2 && y>=35+yOffset2 && y<40+yOffset2)
		|| (x>=5+xOffset2 && x<10+xOffset2 && y>=20+yOffset2 && y<35+yOffset2) || (x>=55+xOffset2 && x<60+xOffset2 && y>=20+yOffset2 && y<35+yOffset2)
		|| (x>=10+xOffset2 && x<15+xOffset2 && y>=15+yOffset2 && y<20+yOffset2) || (x>=50+xOffset2 && x<55+xOffset2 && y>=15+yOffset2 && y<20+yOffset2)
		|| (x>=15+xOffset2 && x<20+xOffset2 && y>=10+yOffset2 && y<15+yOffset2) || (x>=45+xOffset2 && x<50+xOffset2 && y>=10+yOffset2 && y<15+yOffset2)
		|| (x>=20+xOffset2 && x<25+xOffset2 && y>=5+yOffset2 && y<10+yOffset2) || (x>=40+xOffset2 && x<45+xOffset2 && y>=5+yOffset2 && y<10+yOffset2)
		|| (x>=25+xOffset2 && x<40+xOffset2 && y>=0+yOffset2 && y<5+yOffset2)) && (symbol[2] == 1))
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	//This creates an "X" in top right
	else if (((x>=10+xOffset3 && x <15+xOffset3 && y>=10+yOffset3 && y<15+yOffset3)
		|| (x>=15+xOffset3 && x <20+xOffset3 && y>=15+yOffset3 && y<20+yOffset3) || (x>=20+xOffset3 && x <25+xOffset3 && y>=20+yOffset3 && y<25+yOffset3)
		|| (x>=25+xOffset3 && x <30+xOffset3 && y>=25+yOffset3 && y<30+yOffset3) || (x>=30+xOffset3 && x <35+xOffset3 && y>=30+yOffset3 && y<35+yOffset3)
		|| (x>=35+xOffset3 && x <40+xOffset3 && y>=35+yOffset3 && y<40+yOffset3) || (x>=40+xOffset3 && x <45+xOffset3 && y>=40+yOffset3 && y<45+yOffset3)
		|| (x>=45+xOffset3 && x <50+xOffset3 && y>=45+yOffset3 && y<50+yOffset3) || (x>=50+xOffset3 && x <55+xOffset3 && y>=50+yOffset3 && y<55+yOffset3)
		|| (x>=10+xOffset3 && x <15+xOffset3 && y>=50+yOffset3 && y<55+yOffset3) || (x>=15+xOffset3 && x <20+xOffset3 && y>=45+yOffset3 && y<50+yOffset3)
		|| (x>=20+xOffset3 && x <25+xOffset3 && y>=40+yOffset3 && y<45+yOffset3) || (x>=25+xOffset3 && x <30+xOffset3 && y>=35+yOffset3 && y<40+yOffset3)
		|| (x>=30+xOffset3 && x <35+xOffset3 && y>=30+yOffset3 && y<35+yOffset3) || (x>=35+xOffset3 && x <40+xOffset3 && y>=25+yOffset3 && y<30+yOffset3)
		|| (x>=40+xOffset3 && x <45+xOffset3 && y>=20+yOffset3 && y<25+yOffset3) || (x>=45+xOffset3 && x <50+xOffset3 && y>=15+yOffset3 && y<20+yOffset3)
		|| (x>=50+xOffset3 && x <55+xOffset3 && y>=10+yOffset3 && y<15+yOffset3))&& (symbol[5] == 1))
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	//This creates an "O" in top right
	else if (((x>=25+xOffset3 && x<40+xOffset3 && y>=50+yOffset3 && y<55+yOffset3)
		|| (x>=20+xOffset3 && x<25+xOffset3 && y>=45+yOffset3 && y<50+yOffset3) || (x>=40+xOffset3 && x<45+xOffset3 && y>=45+yOffset3 && y<50+yOffset3)
		|| (x>=15+xOffset3 && x<20+xOffset3 && y>=40+yOffset3 && y<45+yOffset3) || (x>=45+xOffset3 && x<50+xOffset3 && y>=40+yOffset3 && y<45+yOffset3)
		|| (x>=10+xOffset3 && x<15+xOffset3 && y>=35+yOffset3 && y<40+yOffset3) || (x>=50+xOffset3 && x<55+xOffset3 && y>=35+yOffset3 && y<40+yOffset3)
		|| (x>=5+xOffset3 && x<10+xOffset3 && y>=20+yOffset3 && y<35+yOffset3) || (x>=55+xOffset3 && x<60+xOffset3 && y>=20+yOffset3 && y<35+yOffset3)
		|| (x>=10+xOffset3 && x<15+xOffset3 && y>=15+yOffset3 && y<20+yOffset3) || (x>=50+xOffset3 && x<55+xOffset3 && y>=15+yOffset3 && y<20+yOffset3)
		|| (x>=15+xOffset3 && x<20+xOffset3 && y>=10+yOffset3 && y<15+yOffset3) || (x>=45+xOffset3 && x<50+xOffset3 && y>=10+yOffset3 && y<15+yOffset3)
		|| (x>=20+xOffset3 && x<25+xOffset3 && y>=5+yOffset3 && y<10+yOffset3) || (x>=40+xOffset3 && x<45+xOffset3 && y>=5+yOffset3 && y<10+yOffset3)
		|| (x>=25+xOffset3 && x<40+xOffset3 && y>=0+yOffset3 && y<5+yOffset3)) && (symbol[4] == 1))
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	//This creates an "X" in mid left
	else if (((x>=10+xOffset4 && x <15+xOffset4 && y>=10+yOffset4 && y<15+yOffset4)
		|| (x>=15+xOffset4 && x <20+xOffset4 && y>=15+yOffset4 && y<20+yOffset4) || (x>=20+xOffset4 && x <25+xOffset4 && y>=20+yOffset4 && y<25+yOffset4)
		|| (x>=25+xOffset4 && x <30+xOffset4 && y>=25+yOffset4 && y<30+yOffset4) || (x>=30+xOffset4 && x <35+xOffset4 && y>=30+yOffset4 && y<35+yOffset4)
		|| (x>=35+xOffset4 && x <40+xOffset4 && y>=35+yOffset4 && y<40+yOffset4) || (x>=40+xOffset4 && x <45+xOffset4 && y>=40+yOffset4 && y<45+yOffset4)
		|| (x>=45+xOffset4 && x <50+xOffset4 && y>=45+yOffset4 && y<50+yOffset4) || (x>=50+xOffset4 && x <55+xOffset4 && y>=50+yOffset4 && y<55+yOffset4)
		|| (x>=10+xOffset4 && x <15+xOffset4 && y>=50+yOffset4 && y<55+yOffset4) || (x>=15+xOffset4 && x <20+xOffset4 && y>=45+yOffset4 && y<50+yOffset4)
		|| (x>=20+xOffset4 && x <25+xOffset4 && y>=40+yOffset4 && y<45+yOffset4) || (x>=25+xOffset4 && x <30+xOffset4 && y>=35+yOffset4 && y<40+yOffset4)
		|| (x>=30+xOffset4 && x <35+xOffset4 && y>=30+yOffset4 && y<35+yOffset4) || (x>=35+xOffset4 && x <40+xOffset4 && y>=25+yOffset4 && y<30+yOffset4)
		|| (x>=40+xOffset4 && x <45+xOffset4 && y>=20+yOffset4 && y<25+yOffset4) || (x>=45+xOffset4 && x <50+xOffset4 && y>=15+yOffset4 && y<20+yOffset4)
		|| (x>=50+xOffset4 && x <55+xOffset4 && y>=10+yOffset4 && y<15+yOffset4))&& (symbol[7] == 1))
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	//This creates an "O" in mid left
	else if (((x>=25+xOffset4 && x<40+xOffset4 && y>=50+yOffset4 && y<55+yOffset4)
		|| (x>=20+xOffset4 && x<25+xOffset4 && y>=45+yOffset4 && y<50+yOffset4) || (x>=40+xOffset4 && x<45+xOffset4 && y>=45+yOffset4 && y<50+yOffset4)
		|| (x>=15+xOffset4 && x<20+xOffset4 && y>=40+yOffset4 && y<45+yOffset4) || (x>=45+xOffset4 && x<50+xOffset4 && y>=40+yOffset4 && y<45+yOffset4)
		|| (x>=10+xOffset4 && x<15+xOffset4 && y>=35+yOffset4 && y<40+yOffset4) || (x>=50+xOffset4 && x<55+xOffset4 && y>=35+yOffset4 && y<40+yOffset4)
		|| (x>=5+xOffset4 && x<10+xOffset4 && y>=20+yOffset4 && y<35+yOffset4) || (x>=55+xOffset4 && x<60+xOffset4 && y>=20+yOffset4 && y<35+yOffset4)
		|| (x>=10+xOffset4 && x<15+xOffset4 && y>=15+yOffset4 && y<20+yOffset4) || (x>=50+xOffset4 && x<55+xOffset4 && y>=15+yOffset4 && y<20+yOffset4)
		|| (x>=15+xOffset4 && x<20+xOffset4 && y>=10+yOffset4 && y<15+yOffset4) || (x>=45+xOffset4 && x<50+xOffset4 && y>=10+yOffset4 && y<15+yOffset4)
		|| (x>=20+xOffset4 && x<25+xOffset4 && y>=5+yOffset4 && y<10+yOffset4) || (x>=40+xOffset4 && x<45+xOffset4 && y>=5+yOffset4 && y<10+yOffset4)
		|| (x>=25+xOffset4 && x<40+xOffset4 && y>=0+yOffset4 && y<5+yOffset4)) && (symbol[6] == 1))
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	//This creates an "X" in mid mid
	else if (((x>=10+xOffset5 && x <15+xOffset5 && y>=10+yOffset5 && y<15+yOffset5)
		|| (x>=15+xOffset5 && x <20+xOffset5 && y>=15+yOffset5 && y<20+yOffset5) || (x>=20+xOffset5 && x <25+xOffset5 && y>=20+yOffset5 && y<25+yOffset5)
		|| (x>=25+xOffset5 && x <30+xOffset5 && y>=25+yOffset5 && y<30+yOffset5) || (x>=30+xOffset5 && x <35+xOffset5 && y>=30+yOffset5 && y<35+yOffset5)
		|| (x>=35+xOffset5 && x <40+xOffset5 && y>=35+yOffset5 && y<40+yOffset5) || (x>=40+xOffset5 && x <45+xOffset5 && y>=40+yOffset5 && y<45+yOffset5)
		|| (x>=45+xOffset5 && x <50+xOffset5 && y>=45+yOffset5 && y<50+yOffset5) || (x>=50+xOffset5 && x <55+xOffset5 && y>=50+yOffset5 && y<55+yOffset5)
		|| (x>=10+xOffset5 && x <15+xOffset5 && y>=50+yOffset5 && y<55+yOffset5) || (x>=15+xOffset5 && x <20+xOffset5 && y>=45+yOffset5 && y<50+yOffset5)
		|| (x>=20+xOffset5 && x <25+xOffset5 && y>=40+yOffset5 && y<45+yOffset5) || (x>=25+xOffset5 && x <30+xOffset5 && y>=35+yOffset5 && y<40+yOffset5)
		|| (x>=30+xOffset5 && x <35+xOffset5 && y>=30+yOffset5 && y<35+yOffset5) || (x>=35+xOffset5 && x <40+xOffset5 && y>=25+yOffset5 && y<30+yOffset5)
		|| (x>=40+xOffset5 && x <45+xOffset5 && y>=20+yOffset5 && y<25+yOffset5) || (x>=45+xOffset5 && x <50+xOffset5 && y>=15+yOffset5 && y<20+yOffset5)
		|| (x>=50+xOffset5 && x <55+xOffset5 && y>=10+yOffset5 && y<15+yOffset5))&& (symbol[9] == 1))
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	//This creates an "O" in mid mid
	else if (((x>=25+xOffset5 && x<40+xOffset5 && y>=50+yOffset5 && y<55+yOffset5)
		|| (x>=20+xOffset5 && x<25+xOffset5 && y>=45+yOffset5 && y<50+yOffset5) || (x>=40+xOffset5 && x<45+xOffset5 && y>=45+yOffset5 && y<50+yOffset5)
		|| (x>=15+xOffset5 && x<20+xOffset5 && y>=40+yOffset5 && y<45+yOffset5) || (x>=45+xOffset5 && x<50+xOffset5 && y>=40+yOffset5 && y<45+yOffset5)
		|| (x>=10+xOffset5 && x<15+xOffset5 && y>=35+yOffset5 && y<40+yOffset5) || (x>=50+xOffset5 && x<55+xOffset5 && y>=35+yOffset5 && y<40+yOffset5)
		|| (x>=5+xOffset5 && x<10+xOffset5 && y>=20+yOffset5 && y<35+yOffset5) || (x>=55+xOffset5 && x<60+xOffset5 && y>=20+yOffset5 && y<35+yOffset5)
		|| (x>=10+xOffset5 && x<15+xOffset5 && y>=15+yOffset5 && y<20+yOffset5) || (x>=50+xOffset5 && x<55+xOffset5 && y>=15+yOffset5 && y<20+yOffset5)
		|| (x>=15+xOffset5 && x<20+xOffset5 && y>=10+yOffset5 && y<15+yOffset5) || (x>=45+xOffset5 && x<50+xOffset5 && y>=10+yOffset5 && y<15+yOffset5)
		|| (x>=20+xOffset5 && x<25+xOffset5 && y>=5+yOffset5 && y<10+yOffset5) || (x>=40+xOffset5 && x<45+xOffset5 && y>=5+yOffset5 && y<10+yOffset5)
		|| (x>=25+xOffset5 && x<40+xOffset5 && y>=0+yOffset5 && y<5+yOffset5)) && (symbol[8] == 1))
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	//This creates an "X" in mid right
	else if (((x>=10+xOffset6 && x <15+xOffset6 && y>=10+yOffset6 && y<15+yOffset6)
		|| (x>=15+xOffset6 && x <20+xOffset6 && y>=15+yOffset6 && y<20+yOffset6) || (x>=20+xOffset6 && x <25+xOffset6 && y>=20+yOffset6 && y<25+yOffset6)
		|| (x>=25+xOffset6 && x <30+xOffset6 && y>=25+yOffset6 && y<30+yOffset6) || (x>=30+xOffset6 && x <35+xOffset6 && y>=30+yOffset6 && y<35+yOffset6)
		|| (x>=35+xOffset6 && x <40+xOffset6 && y>=35+yOffset6 && y<40+yOffset6) || (x>=40+xOffset6 && x <45+xOffset6 && y>=40+yOffset6 && y<45+yOffset6)
		|| (x>=45+xOffset6 && x <50+xOffset6 && y>=45+yOffset6 && y<50+yOffset6) || (x>=50+xOffset6 && x <55+xOffset6 && y>=50+yOffset6 && y<55+yOffset6)
		|| (x>=10+xOffset6 && x <15+xOffset6 && y>=50+yOffset6 && y<55+yOffset6) || (x>=15+xOffset6 && x <20+xOffset6 && y>=45+yOffset6 && y<50+yOffset6)
		|| (x>=20+xOffset6 && x <25+xOffset6 && y>=40+yOffset6 && y<45+yOffset6) || (x>=25+xOffset6 && x <30+xOffset6 && y>=35+yOffset6 && y<40+yOffset6)
		|| (x>=30+xOffset6 && x <35+xOffset6 && y>=30+yOffset6 && y<35+yOffset6) || (x>=35+xOffset6 && x <40+xOffset6 && y>=25+yOffset6 && y<30+yOffset6)
		|| (x>=40+xOffset6 && x <45+xOffset6 && y>=20+yOffset6 && y<25+yOffset6) || (x>=45+xOffset6 && x <50+xOffset6 && y>=15+yOffset6 && y<20+yOffset6)
		|| (x>=50+xOffset6 && x <55+xOffset6 && y>=10+yOffset6 && y<15+yOffset6))&& (symbol[11] == 1))
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	//This creates an "O" in mid right
	else if (((x>=25+xOffset6 && x<40+xOffset6 && y>=50+yOffset6 && y<55+yOffset6)
		|| (x>=20+xOffset6 && x<25+xOffset6 && y>=45+yOffset6 && y<50+yOffset6) || (x>=40+xOffset6 && x<45+xOffset6 && y>=45+yOffset6 && y<50+yOffset6)
		|| (x>=15+xOffset6 && x<20+xOffset6 && y>=40+yOffset6 && y<45+yOffset6) || (x>=45+xOffset6 && x<50+xOffset6 && y>=40+yOffset6 && y<45+yOffset6)
		|| (x>=10+xOffset6 && x<15+xOffset6 && y>=35+yOffset6 && y<40+yOffset6) || (x>=50+xOffset6 && x<55+xOffset6 && y>=35+yOffset6 && y<40+yOffset6)
		|| (x>=5+xOffset6 && x<10+xOffset6 && y>=20+yOffset6 && y<35+yOffset6) || (x>=55+xOffset6 && x<60+xOffset6 && y>=20+yOffset6 && y<35+yOffset6)
		|| (x>=10+xOffset6 && x<15+xOffset6 && y>=15+yOffset6 && y<20+yOffset6) || (x>=50+xOffset6 && x<55+xOffset6 && y>=15+yOffset6 && y<20+yOffset6)
		|| (x>=15+xOffset6 && x<20+xOffset6 && y>=10+yOffset6 && y<15+yOffset6) || (x>=45+xOffset6 && x<50+xOffset6 && y>=10+yOffset6 && y<15+yOffset6)
		|| (x>=20+xOffset6 && x<25+xOffset6 && y>=5+yOffset6 && y<10+yOffset6) || (x>=40+xOffset6 && x<45+xOffset6 && y>=5+yOffset6 && y<10+yOffset6)
		|| (x>=25+xOffset6 && x<40+xOffset6 && y>=0+yOffset6 && y<5+yOffset6)) && (symbol[10] == 1))
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	//This creates an "X" in bot left
	else if (((x>=10+xOffset7 && x <15+xOffset7 && y>=10+yOffset7 && y<15+yOffset7)
		|| (x>=15+xOffset7 && x <20+xOffset7 && y>=15+yOffset7 && y<20+yOffset7) || (x>=20+xOffset7 && x <25+xOffset7 && y>=20+yOffset7 && y<25+yOffset7)
		|| (x>=25+xOffset7 && x <30+xOffset7 && y>=25+yOffset7 && y<30+yOffset7) || (x>=30+xOffset7 && x <35+xOffset7 && y>=30+yOffset7 && y<35+yOffset7)
		|| (x>=35+xOffset7 && x <40+xOffset7 && y>=35+yOffset7 && y<40+yOffset7) || (x>=40+xOffset7 && x <45+xOffset7 && y>=40+yOffset7 && y<45+yOffset7)
		|| (x>=45+xOffset7 && x <50+xOffset7 && y>=45+yOffset7 && y<50+yOffset7) || (x>=50+xOffset7 && x <55+xOffset7 && y>=50+yOffset7 && y<55+yOffset7)
		|| (x>=10+xOffset7 && x <15+xOffset7 && y>=50+yOffset7 && y<55+yOffset7) || (x>=15+xOffset7 && x <20+xOffset7 && y>=45+yOffset7 && y<50+yOffset7)
		|| (x>=20+xOffset7 && x <25+xOffset7 && y>=40+yOffset7 && y<45+yOffset7) || (x>=25+xOffset7 && x <30+xOffset7 && y>=35+yOffset7 && y<40+yOffset7)
		|| (x>=30+xOffset7 && x <35+xOffset7 && y>=30+yOffset7 && y<35+yOffset7) || (x>=35+xOffset7 && x <40+xOffset7 && y>=25+yOffset7 && y<30+yOffset7)
		|| (x>=40+xOffset7 && x <45+xOffset7 && y>=20+yOffset7 && y<25+yOffset7) || (x>=45+xOffset7 && x <50+xOffset7 && y>=15+yOffset7 && y<20+yOffset7)
		|| (x>=50+xOffset7 && x <55+xOffset7 && y>=10+yOffset7 && y<15+yOffset7))&& (symbol[13] == 1))
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	//This creates an "O" in bot left
	else if (((x>=25+xOffset7 && x<40+xOffset7 && y>=50+yOffset7 && y<55+yOffset7)
		|| (x>=20+xOffset7 && x<25+xOffset7 && y>=45+yOffset7 && y<50+yOffset7) || (x>=40+xOffset7 && x<45+xOffset7 && y>=45+yOffset7 && y<50+yOffset7)
		|| (x>=15+xOffset7 && x<20+xOffset7 && y>=40+yOffset7 && y<45+yOffset7) || (x>=45+xOffset7 && x<50+xOffset7 && y>=40+yOffset7 && y<45+yOffset7)
		|| (x>=10+xOffset7 && x<15+xOffset7 && y>=35+yOffset7 && y<40+yOffset7) || (x>=50+xOffset7 && x<55+xOffset7 && y>=35+yOffset7 && y<40+yOffset7)
		|| (x>=5+xOffset7 && x<10+xOffset7 && y>=20+yOffset7 && y<35+yOffset7) || (x>=55+xOffset7 && x<60+xOffset7 && y>=20+yOffset7 && y<35+yOffset7)
		|| (x>=10+xOffset7 && x<15+xOffset7 && y>=15+yOffset7 && y<20+yOffset7) || (x>=50+xOffset7 && x<55+xOffset7 && y>=15+yOffset7 && y<20+yOffset7)
		|| (x>=15+xOffset7 && x<20+xOffset7 && y>=10+yOffset7 && y<15+yOffset7) || (x>=45+xOffset7 && x<50+xOffset7 && y>=10+yOffset7 && y<15+yOffset7)
		|| (x>=20+xOffset7 && x<25+xOffset7 && y>=5+yOffset7 && y<10+yOffset7) || (x>=40+xOffset7 && x<45+xOffset7 && y>=5+yOffset7 && y<10+yOffset7)
		|| (x>=25+xOffset7 && x<40+xOffset7 && y>=0+yOffset7 && y<5+yOffset7)) && (symbol[12] == 1))
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	//This creates an "X" in bot mid
	else if (((x>=10+xOffset8 && x <15+xOffset8 && y>=10+yOffset8 && y<15+yOffset8)
		|| (x>=15+xOffset8 && x <20+xOffset8 && y>=15+yOffset8 && y<20+yOffset8) || (x>=20+xOffset8 && x <25+xOffset8 && y>=20+yOffset8 && y<25+yOffset8)
		|| (x>=25+xOffset8 && x <30+xOffset8 && y>=25+yOffset8 && y<30+yOffset8) || (x>=30+xOffset8 && x <35+xOffset8 && y>=30+yOffset8 && y<35+yOffset8)
		|| (x>=35+xOffset8 && x <40+xOffset8 && y>=35+yOffset8 && y<40+yOffset8) || (x>=40+xOffset8 && x <45+xOffset8 && y>=40+yOffset8 && y<45+yOffset8)
		|| (x>=45+xOffset8 && x <50+xOffset8 && y>=45+yOffset8 && y<50+yOffset8) || (x>=50+xOffset8 && x <55+xOffset8 && y>=50+yOffset8 && y<55+yOffset8)
		|| (x>=10+xOffset8 && x <15+xOffset8 && y>=50+yOffset8 && y<55+yOffset8) || (x>=15+xOffset8 && x <20+xOffset8 && y>=45+yOffset8 && y<50+yOffset8)
		|| (x>=20+xOffset8 && x <25+xOffset8 && y>=40+yOffset8 && y<45+yOffset8) || (x>=25+xOffset8 && x <30+xOffset8 && y>=35+yOffset8 && y<40+yOffset8)
		|| (x>=30+xOffset8 && x <35+xOffset8 && y>=30+yOffset8 && y<35+yOffset8) || (x>=35+xOffset8 && x <40+xOffset8 && y>=25+yOffset8 && y<30+yOffset8)
		|| (x>=40+xOffset8 && x <45+xOffset8 && y>=20+yOffset8 && y<25+yOffset8) || (x>=45+xOffset8 && x <50+xOffset8 && y>=15+yOffset8 && y<20+yOffset8)
		|| (x>=50+xOffset8 && x <55+xOffset8 && y>=10+yOffset8 && y<15+yOffset8))&& (symbol[15] == 1))
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	//This creates an "O" in bot mid
	else if (((x>=25+xOffset8 && x<40+xOffset8 && y>=50+yOffset8 && y<55+yOffset8)
		|| (x>=20+xOffset8 && x<25+xOffset8 && y>=45+yOffset8 && y<50+yOffset8) || (x>=40+xOffset8 && x<45+xOffset8 && y>=45+yOffset8 && y<50+yOffset8)
		|| (x>=15+xOffset8 && x<20+xOffset8 && y>=40+yOffset8 && y<45+yOffset8) || (x>=45+xOffset8 && x<50+xOffset8 && y>=40+yOffset8 && y<45+yOffset8)
		|| (x>=10+xOffset8 && x<15+xOffset8 && y>=35+yOffset8 && y<40+yOffset8) || (x>=50+xOffset8 && x<55+xOffset8 && y>=35+yOffset8 && y<40+yOffset8)
		|| (x>=5+xOffset8 && x<10+xOffset8 && y>=20+yOffset8 && y<35+yOffset8) || (x>=55+xOffset8 && x<60+xOffset8 && y>=20+yOffset8 && y<35+yOffset8)
		|| (x>=10+xOffset8 && x<15+xOffset8 && y>=15+yOffset8 && y<20+yOffset8) || (x>=50+xOffset8 && x<55+xOffset8 && y>=15+yOffset8 && y<20+yOffset8)
		|| (x>=15+xOffset8 && x<20+xOffset8 && y>=10+yOffset8 && y<15+yOffset8) || (x>=45+xOffset8 && x<50+xOffset8 && y>=10+yOffset8 && y<15+yOffset8)
		|| (x>=20+xOffset8 && x<25+xOffset8 && y>=5+yOffset8 && y<10+yOffset8) || (x>=40+xOffset8 && x<45+xOffset8 && y>=5+yOffset8 && y<10+yOffset8)
		|| (x>=25+xOffset8 && x<40+xOffset8 && y>=0+yOffset8 && y<5+yOffset8)) && (symbol[14] == 1))
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	//This creates an "X" in bot right
	else if (((x>=10+xOffset9 && x <15+xOffset9 && y>=10+yOffset9 && y<15+yOffset9)
		|| (x>=15+xOffset9 && x <20+xOffset9 && y>=15+yOffset9 && y<20+yOffset9) || (x>=20+xOffset9 && x <25+xOffset9 && y>=20+yOffset9 && y<25+yOffset9)
		|| (x>=25+xOffset9 && x <30+xOffset9 && y>=25+yOffset9 && y<30+yOffset9) || (x>=30+xOffset9 && x <35+xOffset9 && y>=30+yOffset9 && y<35+yOffset9)
		|| (x>=35+xOffset9 && x <40+xOffset9 && y>=35+yOffset9 && y<40+yOffset9) || (x>=40+xOffset9 && x <45+xOffset9 && y>=40+yOffset9 && y<45+yOffset9)
		|| (x>=45+xOffset9 && x <50+xOffset9 && y>=45+yOffset9 && y<50+yOffset9) || (x>=50+xOffset9 && x <55+xOffset9 && y>=50+yOffset9 && y<55+yOffset9)
		|| (x>=10+xOffset9 && x <15+xOffset9 && y>=50+yOffset9 && y<55+yOffset9) || (x>=15+xOffset9 && x <20+xOffset9 && y>=45+yOffset9 && y<50+yOffset9)
		|| (x>=20+xOffset9 && x <25+xOffset9 && y>=40+yOffset9 && y<45+yOffset9) || (x>=25+xOffset9 && x <30+xOffset9 && y>=35+yOffset9 && y<40+yOffset9)
		|| (x>=30+xOffset9 && x <35+xOffset9 && y>=30+yOffset9 && y<35+yOffset9) || (x>=35+xOffset9 && x <40+xOffset9 && y>=25+yOffset9 && y<30+yOffset9)
		|| (x>=40+xOffset9 && x <45+xOffset9 && y>=20+yOffset9 && y<25+yOffset9) || (x>=45+xOffset9 && x <50+xOffset9 && y>=15+yOffset9 && y<20+yOffset9)
		|| (x>=50+xOffset9 && x <55+xOffset9 && y>=10+yOffset9 && y<15+yOffset9))&& (symbol[17] == 1))
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	//This creates an "O" in bot right
	else if (((x>=25+xOffset9 && x<40+xOffset9 && y>=50+yOffset9 && y<55+yOffset9)
		|| (x>=20+xOffset9 && x<25+xOffset9 && y>=45+yOffset9 && y<50+yOffset9) || (x>=40+xOffset9 && x<45+xOffset9 && y>=45+yOffset9 && y<50+yOffset9)
		|| (x>=15+xOffset9 && x<20+xOffset9 && y>=40+yOffset9 && y<45+yOffset9) || (x>=45+xOffset9 && x<50+xOffset9 && y>=40+yOffset9 && y<45+yOffset9)
		|| (x>=10+xOffset9 && x<15+xOffset9 && y>=35+yOffset9 && y<40+yOffset9) || (x>=50+xOffset9 && x<55+xOffset9 && y>=35+yOffset9 && y<40+yOffset9)
		|| (x>=5+xOffset9 && x<10+xOffset9 && y>=20+yOffset9 && y<35+yOffset9) || (x>=55+xOffset9 && x<60+xOffset9 && y>=20+yOffset9 && y<35+yOffset9)
		|| (x>=10+xOffset9 && x<15+xOffset9 && y>=15+yOffset9 && y<20+yOffset9) || (x>=50+xOffset9 && x<55+xOffset9 && y>=15+yOffset9 && y<20+yOffset9)
		|| (x>=15+xOffset9 && x<20+xOffset9 && y>=10+yOffset9 && y<15+yOffset9) || (x>=45+xOffset9 && x<50+xOffset9 && y>=10+yOffset9 && y<15+yOffset9)
		|| (x>=20+xOffset9 && x<25+xOffset9 && y>=5+yOffset9 && y<10+yOffset9) || (x>=40+xOffset9 && x<45+xOffset9 && y>=5+yOffset9 && y<10+yOffset9)
		|| (x>=25+xOffset9 && x<40+xOffset9 && y>=0+yOffset9 && y<5+yOffset9)) && (symbol[16] == 1))
	begin
		red <= 4'hF;
		blue <=  4'hF;
		green <= 4'hF;
	end
	//This creates an "X" in the winner position
	else if (((x>=10+xOffset10 && x <15+xOffset10 && y>=10+yOffset10 && y<15+yOffset10)
		|| (x>=15+xOffset10 && x <20+xOffset10 && y>=15+yOffset10 && y<20+yOffset10) || (x>=20+xOffset10 && x <25+xOffset10 && y>=20+yOffset10 && y<25+yOffset10)
		|| (x>=25+xOffset10 && x <30+xOffset10 && y>=25+yOffset10 && y<30+yOffset10) || (x>=30+xOffset10 && x <35+xOffset10 && y>=30+yOffset10 && y<35+yOffset10)
		|| (x>=35+xOffset10 && x <40+xOffset10 && y>=35+yOffset10 && y<40+yOffset10) || (x>=40+xOffset10 && x <45+xOffset10 && y>=40+yOffset10 && y<45+yOffset10)
		|| (x>=45+xOffset10 && x <50+xOffset10 && y>=45+yOffset10 && y<50+yOffset10) || (x>=50+xOffset10 && x <55+xOffset10 && y>=50+yOffset10 && y<55+yOffset10)
		|| (x>=10+xOffset10 && x <15+xOffset10 && y>=50+yOffset10 && y<55+yOffset10) || (x>=15+xOffset10 && x <20+xOffset10 && y>=45+yOffset10 && y<50+yOffset10)
		|| (x>=20+xOffset10 && x <25+xOffset10 && y>=40+yOffset10 && y<45+yOffset10) || (x>=25+xOffset10 && x <30+xOffset10 && y>=35+yOffset10 && y<40+yOffset10)
		|| (x>=30+xOffset10 && x <35+xOffset10 && y>=30+yOffset10 && y<35+yOffset10) || (x>=35+xOffset10 && x <40+xOffset10 && y>=25+yOffset10 && y<30+yOffset10)
		|| (x>=40+xOffset10 && x <45+xOffset10 && y>=20+yOffset10 && y<25+yOffset10) || (x>=45+xOffset10 && x <50+xOffset10 && y>=15+yOffset10 && y<20+yOffset10)
		|| (x>=50+xOffset10 && x <55+xOffset10 && y>=10+yOffset10 && y<15+yOffset10))&& (winner[1] == 1))
	begin
		red <= 4'hF;
		blue <=  0;
		green <= 4'hF;
	end
	//This creates an "O" in the winner position
	else if (((x>=25+xOffset10 && x<40+xOffset10 && y>=50+yOffset10 && y<55+yOffset10)
		|| (x>=20+xOffset10 && x<25+xOffset10 && y>=45+yOffset10 && y<50+yOffset10) || (x>=40+xOffset10 && x<45+xOffset10 && y>=45+yOffset10 && y<50+yOffset10)
		|| (x>=15+xOffset10 && x<20+xOffset10 && y>=40+yOffset10 && y<45+yOffset10) || (x>=45+xOffset10 && x<50+xOffset10 && y>=40+yOffset10 && y<45+yOffset10)
		|| (x>=10+xOffset10 && x<15+xOffset10 && y>=35+yOffset10 && y<40+yOffset10) || (x>=50+xOffset10 && x<55+xOffset10 && y>=35+yOffset10 && y<40+yOffset10)
		|| (x>=5+xOffset10 && x<10+xOffset10 && y>=20+yOffset10 && y<35+yOffset10) || (x>=55+xOffset10 && x<60+xOffset10 && y>=20+yOffset10 && y<35+yOffset10)
		|| (x>=10+xOffset10 && x<15+xOffset10 && y>=15+yOffset10 && y<20+yOffset10) || (x>=50+xOffset10 && x<55+xOffset10 && y>=15+yOffset10 && y<20+yOffset10)
		|| (x>=15+xOffset10 && x<20+xOffset10 && y>=10+yOffset10 && y<15+yOffset10) || (x>=45+xOffset10 && x<50+xOffset10 && y>=10+yOffset10 && y<15+yOffset10)
		|| (x>=20+xOffset10 && x<25+xOffset10 && y>=5+yOffset10 && y<10+yOffset10) || (x>=40+xOffset10 && x<45+xOffset10 && y>=5+yOffset10 && y<10+yOffset10)
		|| (x>=25+xOffset10 && x<40+xOffset10 && y>=0+yOffset10 && y<5+yOffset10)) && (winner[0] == 1))
	begin
		red <= 4'hF;
		blue <=  0;
		green <= 4'hF;
	end
	else if ((/*W begin*/(x>=20 && x<25 && y>=10 && y<20) || (x>=25 && x<30 && y>=20 && y<30)
		 || (x>=30 && x<35 && y>=30 && y<40)  || (x>=35 && x<40 && y>=40 && y<50)
		 || (x>=40 && x<45 && y>=30 && y<40)  || (x>=45 && x<50 && y>=20 && y<30)
		 || (x>=50 && x<55 && y>=30 && y<40)  || (x>=55 && x<60 && y>=40 && y<50)
		 || (x>=60 && x<65 && y>=30 && y<40)  || (x>=65 && x<70 && y>=20 && y<30)
		 || (x>=70 && x<75 && y>=10 && y<20)/*W end*/
		 || /*I begin*/(x>=85 && x<90 && y>=25 && y<50)  || (x>=85 && x<90 && y>=10 && y<15) /*I end*/
		 || /*N begin*/(x>=100 && x<105 && y>=10 && y<50)
		 || (x>=105 && x<110 && y>=15 && y<25) || (x>=110 && x<115 && y>=25 && y<35)
		 || (x>=115 && x<120 && y>=35 && y<45) || (x>=120 && x<125 && y>=10 && y<50) /*N end*/ 
		 ) && (winner[0] || winner[1]))
	begin
		red <= 4'hF;
		blue <=  0;
		green <= 4'hF;
	end
	else if ((/*T begin*/(x>=20 && x<40 && y>=10 && y<15)
		 || (x>=28 && x<32 && y>=10 && y<50)/*T end*/
		 || /*I begin*/(x>=50 && x<55 && y>=25 && y<50)  || (x>=50 && x<55 && y>=10 && y<15) /*I end*/
		 || /*E begin*/(x>=65 && x<70 && y>=10 && y<50)  || (x>=65 && x<85 && y>=10 && y<15) 
		 || (x>=65 && x<80 && y>=28 && y<32) || (x>=65 && x<85 && y>=45 && y<50) /*E end*/
		 ) && ((symbol[0] || symbol[1]) && (symbol[2] || symbol[3]) && (symbol[4] || symbol[5]) && (symbol[6] || symbol[7]) && (symbol[8] || symbol[9])
		   && (symbol[10] || symbol[11]) && (symbol[12] || symbol[13]) && (symbol[14] || symbol[15]) && (symbol[16] || symbol[17]))
			&& (winner[0] == 0 && winner[1] == 0)
			)
	begin
		red <= 4'hF;
		blue <=  0;
		green <= 4'hF;
	end
	else 
	begin
		red <= 0;
		green <= 0; //Black background
		blue <= 0;
	end

end



endmodule