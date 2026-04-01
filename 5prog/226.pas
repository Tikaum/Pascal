program crt226;
uses crt;
const 
	DelayDuration = 100;
	
type 
	star = record
		CurX, CurY, dx, dy: integer;
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

procedure MoveStar (var s: star; var tudasuda: boolean);
begin
	HideStar(s);
	if tudasuda then
	begin
		s.CurX := s.CurX + s.dx;
		if s.CurX = ScreenWidth then
			tudasuda := false
	end;
	if not tudasuda then
	begin
		s.CurX := s.CurX - s.dx;
		if s.CurX = 1 then
			tudasuda := true
	end;	
	ShowStar(s)
end;

var
	s: star;
	c, i, g: integer;
	tudasuda: boolean;

begin
	clrscr;
	s.CurX := 1;
	s.CurY := ScreenHeight div 2;
	s.dx := 0;
	s.dy := 0;
	c := 3;
	ShowStar(s);
	tudasuda := true;

	for i := 1 to c do
	begin
		s.dx := 1;
		if tudasuda then
		begin
			for g := 1 to ScreenWidth do
			begin
				MoveStar(s, tudasuda);
				delay(DelayDuration)
			end
		end
		else
		begin
			for g := ScreenWidth to 1 do
			begin
				MoveStar(s, tudasuda);
				delay(DelayDuration)
			end
		end
	end;			
	clrscr
end.
