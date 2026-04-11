program crt232;
uses crt; 
const
	ColorCount = 16;
	BGColCou = 8;
var
	AllColors: array [1..ColorCount] of word = 
	(
		Black, Blue, Green, Cyan, Red, Magenta, Brown, LightGray,
		DarkGray, LightBlue, LightGreen, LightCyan, 
		LightRed, LightMagenta, Yellow, White
	);
	
procedure ShowQuadStars(var c: char; var a, b: word);
var
x, y, ix, iy: integer;
begin
	if KeyPressed then
	begin
		c := ReadKey;
		if (c = #27) or (c = ' ') then
			exit;
		if c = #0 then
			c := ReadKey;
		case c of
			#75:
			begin
				b := b + 1;		{лево}
				if (b > BGColCou) then
					b := 1
			end;
			#77:
			begin			
				b := b - 1;		{право}
				if (b < 1) then
					b := BGColCou
			end;				
			#72:
			begin
				a := a + 1;		{вверх}
				if (a > ColorCount) then
					a := 1
			end;				
			#80:
			begin
				a := a - 1;		{вниз}
				if (a < 1) then
					a := ColorCount
			end
		end		
	end;
	TextColor(AllColors[a]);
	TextBackground(AllColors[b]);
	x := ((ScreenWidth div 2) - 2);
	y := ((ScreenHeight div 2) - 2);
	GotoXY(x, y);
	for ix := 1 to 5 do
	begin
		for iy := 1 to 5 do
		begin
			GotoXY(x + ix, y + iy);
			write('*')
		end
	end
end;

var
	c: char;
	a, b: word;
	SaveTextAttr: integer;

begin	
	SaveTextAttr := TextAttr;
	clrscr;
	c := 'a';
	a := 1;
	b := 1;

	while true do
	begin
		ShowQuadStars(c, a, b);
		if (c = #27) or (c = ' ') then
			break
	end;
	TextAttr := SaveTextAttr;
	clrscr
end.
