program crt228;
uses crt;
const 
	DelayDuration = 100;
	
type 
	star = record
		CurX, CurY: integer;
	end;

procedure ShowHash (var s: star);
begin
	GotoXY(s.CurX, s.CurY);
	write('#');
	GotoXY(1, 1)
end;

procedure HideHash (var s: star);
begin
	GotoXY(s.CurX, s.CurY);
	write(' ');
	GotoXY(1, 1)
end;

procedure MoveHash (var s: star; deldur, q: integer);
var
	i: integer;
begin
	for i := 1 to (q * 4 + 4) do
	begin
		if KeyPressed then
			break;		
		if (i >= 1) and (i <= (q + 2)) then
		begin
			HideHash(s);
			s.CurX := s.CurX + 1;
			ShowHash(s);
			delay(deldur)
		end
		else if (i >=  (q + 3)) and (i <= (q * 2 + 3)) then
		begin
			HideHash(s);
			s.CurY := s.CurY + 1;
			ShowHash(s);
			delay(deldur)
		end
		else if (i >= (q * 2 + 4)) and (i <= (q * 3 + 4)) then
		begin
			HideHash(s);
			s.CurX := s.CurX - 1;
			ShowHash(s);
			delay(deldur)
		end
		else
		begin
			HideHash(s);
			s.CurY := s.CurY - 1;
			ShowHash(s);
			delay(deldur)
		end
	end
end;		
			
procedure ShowQuadStars (quad: integer);
var
x, y, ix, iy: integer;
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
end;

var
	s: star;
	quad: integer;

begin	
	write('Введите четное число, равное стороне квадрата: ');
	readln(quad);
	while (quad mod 2 <> 0) do
	begin
		writeln('Введено нечетное число');
		write('Повторите ввод: ');
		readln(quad);
	end;
	
	clrscr;
	ShowQuadStars(quad);

	while not KeyPressed do
	begin
		HideHash(s);
		s.CurX := ((ScreenWidth div 2) - (quad div 2)) - 2;
		s.CurY := ((ScreenHeight div 2) - (quad div 2)) - 1;
		MoveHash(s, DelayDuration, quad)
	end;
		
	clrscr
end.
