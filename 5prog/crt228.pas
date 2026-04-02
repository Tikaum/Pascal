program crt228;
uses crt;
const 
	DelayDuration = 50;
	
{type 
	star = record
		CurX, CurY: integer;
	end;

procedure ShowStar (var s: star);
begin
	GotoXY(s.CurX, s.CurY);
	write('*');
	GotoXY(1, 1)
end;

procedure HideStar (var s: star);
begin
	GotoXY(s.CurX, s.CurY);
	write(' ');
	GotoXY(1, 1)
end;

procedure MoveStar (var s: star; var tudasuda: boolean; var c: integer);
begin
	HideStar(s);
	if tudasuda then
	begin
		s.CurX := s.CurX + 1;
		if s.CurX >= ScreenWidth then
			tudasuda := false
	end
	else
	begin
		s.CurX := s.CurX - 1;
		if s.CurX <= 1 then
		begin
			tudasuda := true;
			c := c + 1
		end
	end;	
	ShowStar(s)
end;
}
procedure ShowQuadStars (quad: integer);
var
x, y, ix, iy: integer;
begin
	if (quad mod 2 = 0) then
	begin
		x := (ScreenWidth div 2) - (quad div 2);
		y := (ScreenHeight div 2) - (quad div 2);
		GotoXY(x, y);
		write('*');
		for ix := 0 to (quad - 1) do
		begin
			for iy := 0 to (quad - 1) do
			begin
				GotoXY(x + ix, y + iy);
				write('*')
			end
		end
	end
	else
		writeln('Введено нечетное число')
end;


var
{	s: star;}
	c, quad: integer;
	tudasuda: boolean;

begin
	clrscr;
	quad := 10;
{	s.CurX := 1;
	s.CurY := ScreenHeight div 2;
	ShowStar(s);
	c := 0;
	tudasuda := true;}

	while true do
	begin
		if not KeyPressed then
		begin
		{	writeln(ScreenWidth, ' ', ScreenHeight, ' ', c + 1);
			MoveStar(s, tudasuda, c);
			delay(DelayDuration);
			continue}
			ShowQuadStars(quad)
		end
		else
			break
	end;			
	clrscr
end.
