program random;
uses crt;

const 
	DelayDuration = 20;
	ColorCount = 16;
	screenW = 123;
	screenH = 45;	

var
	AllColors: array [1..ColorCount] of word = 
	(
		Black, Blue, Green, Cyan, Red, Magenta, Brown, LightGray,
		DarkGray, LightBlue, LightGreen, LightCyan, LightRed, LightMagenta, Yellow, White
	);

var
	x, y, col: integer;
	SaveTextAttr: integer;
 
begin
	randomize;
	SaveTextAttr:= TextAttr;
	clrscr;
	while not KeyPressed do 
	begin
		x := random(screenW) + 1;
		y := random(screenH) + 1;
		if (x = screenW) and (y = screenH) then
			continue;
		col := random(ColorCount) + 1;
		GotoXY(x, y);
		TextColor(AllColors[col]);
		write('*');
		delay(DelayDuration)
	end;
	TextAttr :=	SaveTextAttr;
	clrscr
end.
