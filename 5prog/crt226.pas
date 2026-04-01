program crt226;
uses crt;
const 
	DelayDuration = 30;
	
type 
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

var
	s: star;
	c: integer;
	tudasuda: boolean;

begin
	clrscr;
	c := 0;
	s.CurX := 1;
	s.CurY := ScreenHeight div 2;
	ShowStar(s);
	tudasuda := true;

	while c < 3 do
	begin
		writeln(ScreenWidth, ' ', ScreenHeight, ' ', c + 1);
		MoveStar(s, tudasuda, c);
		delay(DelayDuration)
	end;			
	clrscr
end.
