program allStar;
uses crt;

const 
	ColorCount = 16;

var
	AllColors: array [1..ColorCount] of word = 
	(
		Black, Blue, Green, Cyan, Red, Magenta, Brown, LightGray,
		DarkGray, LightBlue, LightGreen, LightCyan, LightRed, LightMagenta, Yellow, White
	);

var
	x: integer;
	SaveTextAttr: integer;
 
begin
	SaveTextAttr:= TextAttr;
	clrscr;

	for x := 1 to ColorCount do
	begin
		TextColor(AllColors[x]);
		writeln(x, ' ', AllColors[x], ' ##########@@@@@@@@');
	end;

	TextAttr :=	SaveTextAttr
end.
