program crt236;
uses crt;
const 
	DelayDuration = 100;
	
type 
	star = record
		CurX, CurY, dx, dy, stepa: integer;
		uzepress: boolean;
		arr: char;
	end;

procedure ShowStar (s: star);
begin
	GotoXY(s.CurX, s.CurY);
	write('*');
	GotoXY(1, 1)
end;

procedure HideStar (s: star);
begin
	GotoXY(s.CurX, s.CurY);
	write(' ');
	GotoXY(1, 1)
end;

procedure RandChan(var s: star);
var
	b, olddx, olddy: integer;
	chan: boolean;
begin
	olddx := s.dx;
	olddy := s.dy;
	chan := false;
	repeat
		b := random(4);
		if (b = 0) then
		begin
			s.dx := -1;
			s.dy := 0
		end
		else if (b = 1) then
		begin
			s.dx := 1;
			s.dy := 0
		end
		else if (b = 2) then
		begin
			s.dx := 0;
			s.dy := -1
		end
		else if (b = 3) then
		begin
			s.dx := 0;
			s.dy := 1
		end;
		if (olddx <> s.dx) or (olddy <> s.dy) then
		begin
			if (olddx = s.dx) or (olddy = s.dy) then
				chan := false
			else
				chan := true		
		end
	until chan			
end;

procedure ManuChan(var s: star);
var
	c: char;
begin
	if s.uzepress then
	begin
		c := s.arr;
		s.arr := 'a';
		s.uzepress := false
	end
	
	else
	begin
		c := ReadKey;
		if c = #0 then
			c := ReadKey
	end;	
	
	case c of
		#75:
		begin
			s.dx := -1;
			s.dy := 0
		end;
		#77:
		begin
			s.dx := 1;
			s.dy := 0
		end;	
		#72:
		begin
			s.dx := 0;
			s.dy := -1
		end;
		#80:
		begin
			s.dx := 0;
			s.dy := 1
		end
	end
end;

procedure MoveStar (var s: star; var goex: boolean);
var
	a: integer;
	c: char;
begin
	HideStar(s);

	if KeyPressed then
	begin
		c := ReadKey;
		if (c = #27) or (c = ' ') then
			goex := true
	end;		

	if KeyPressed and (s.stepa > 9) then
	begin
		ManuChan(s);
		s.stepa := 0
	end

	else
	begin
		if KeyPressed then
		begin
			s.uzepress := true;
			c := ReadKey;
			if c = #0 then
				c := ReadKey;
			s.arr := c
		end;	
		a := random(10);	
		if (a = 5) then
			RandChan(s);
		s.stepa := s.stepa + 1		
	end;
	
	s.CurX := s.CurX + s.dx;
	if s.CurX > ScreenWidth then
		s.CurX := 1
	else if s.CurX < 1 then
		s.CurX := ScreenWidth;
	s.CurY := s.CurY + s.dy;
	if s.CurY > ScreenHeight then
		s.CurY := 1
	else if s.CurY < 1 then
		s.CurY := ScreenHeight;
	ShowStar(s)
end;

var
	s: star;
	goex: boolean;

begin
	randomize;
	clrscr;
	s.CurX := ScreenWidth div 2;
	s.CurY := ScreenHeight div 2;
	s.dx := 0;
	s.dy := 1;
	goex := false;
	s.arr := 'a';
	s.uzepress := false;

	ShowStar(s);
	while not goex do
	begin
		MoveStar(s, goex);
		delay(DelayDuration)
	end;
	clrscr
end.
