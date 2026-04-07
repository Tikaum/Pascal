program crt229;
uses crt; 
	
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

procedure MoveHash (var s: star; var deldur: integer; q: integer; var chan: boolean; var c: char);
var
	i: integer;
begin
	i := 1;
	while i <= (q * 4 + 4) do
	begin
		if KeyPressed then
		begin
			c := ReadKey;

			if c = #0 then
				c := ReadKey;

			if c = #27 then
				exit
			else if c = ' ' then
			begin
				chan := not chan;
				i := (q *4 + 4) - (i - 2)
			end
			else if c = #75 then
				deldur := deldur - 10
			else if c = #77 then
				deldur := deldur + 10
		end;

		if deldur <= 0 then
			deldur := 10;
		writeln(deldur);

		if (i >= 1) and (i <= (q + 1)) then
		begin
			HideHash(s);
			if chan then
				s.CurX := s.CurX + 1
			else
				s.CurY := s.CurY + 1;				
			ShowHash(s);
			i := i + 1;
			delay(deldur)
		end
		else if (i >=  (q + 2)) and (i <= (q * 2 + 2)) then
		begin
			HideHash(s);
			if chan then
				s.CurY := s.CurY + 1
			else
				s.CurX := s.CurX + 1;
			ShowHash(s);
			i := i + 1;
			delay(deldur)
		end
		else if (i >= (q * 2 + 3)) and (i <= (q * 3 + 3)) then
		begin
			HideHash(s);
			if chan then
				s.CurX := s.CurX - 1
			else 
				s.CurY := s.CurY - 1;
			ShowHash(s);
			i := i + 1;
			delay(deldur)
		end
		else
		begin
			HideHash(s);
			if chan then
				s.CurY := s.CurY - 1
			else
				s.CurX := s.CurX - 1;				
			ShowHash(s);
			i := i + 1;
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
	c: char;
	chan: boolean;
	quad, DelayDuration: integer;

begin	
	writeln(ScreenWidth, ' ', ScreenHeight);
	writeln('Введите четное число, равное стороне квадрата');
	write('Число должно быть меньше, чем меньшее из чисел наверху: ');

	readln(quad);
	while (quad mod 2 <> 0) do
	begin
		writeln('Введено нечетное число');
		write('Повторите ввод: ');
		readln(quad);
	end;

	if (ScreenWidth < (quad + 2)) or (ScreenHeight < (quad + 2)) then
	begin
		writeln('Размер квадрата не влазиет в экран!');
		exit
	end;
	
	clrscr;
	ShowQuadStars(quad);
	chan := true;	
	c := 'a';
	DelayDuration := 100;


	while true do
	begin
		HideHash(s);
		s.CurX := ((ScreenWidth div 2) - (quad div 2)) - 1;
		s.CurY := ((ScreenHeight div 2) - (quad div 2)) - 1;
		MoveHash(s, DelayDuration, quad, chan, c);
		if (c = #27) then
			break
	end;
		
	clrscr
end.
 
 
