program crt230;
uses crt; 
	
procedure ChangeQuad(var gor, vert: integer; var c: char);
begin
	if KeyPressed then
	begin
		c := ReadKey;
		if (c = #27) or (c = ' ') then
			exit;
		if c = #0 then
			c := ReadKey;
		case c of
			#75: 				{left}
				gor := gor - 1;
			#77:				{right}
				gor := gor + 1;
			#72:				{up}
				vert := vert + 1;
			#80:				{down}
				vert := vert - 1
		end;		
		clrscr
	end
end;		
			
procedure ShowFig(gor, vert: integer);
var
ix, iy, x, y: integer;
begin
	x := (ScreenWidth div 2) - (gor div 2);
	y := (ScreenHeight div 2) - (vert div 2);
	GotoXY(x, y);
	for ix := 1 to gor do
	begin
		for iy := 1 to vert do
		begin
			GotoXY(x + ix, y + iy);
			write('*')
		end
	end
end;

procedure Limit(var gor, vert: integer);
begin
	if (gor > (ScreenWidth div 2)) then
		gor := ScreenWidth div 2;
	if (gor < 1) then
		gor := 1;	
	if (vert > (ScreenHeight div 2)) then
		vert := ScreenHeight div 2;
	if (vert < 1) then
		vert := 1
end; 

var
	c: char;
	gor, vert: integer;
begin	
	writeln(ScreenWidth, ' ', ScreenHeight);
	
	clrscr;
	gor := 3;
	vert := 3;
	c := 'a';

	while true do
	begin
		GotoXY(1, 1);
		writeln('Ширина и длина прямоугольника');
		writeln('не могут быть больше половины');
		writeln('ширины и длины экрана!');
		Limit(gor, vert);		
		ShowFig(gor, vert);
		ChangeQuad(gor, vert, c);
		if (c = #27) or (c = ' ') then
			break
	end;
		
	clrscr
end.
 
 
