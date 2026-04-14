program crt237;
uses crt;
const 
	DelayDuration = 100;
	
type 
	star = record
		CurX, CurY, dx, dy, stepa: integer;
		uzepress: boolean;
		arr: char;
	end;
type 
	Goalp = record
		x, y: integer;
	end;
	
var
	Goalps: array[1..9]	of Goalp;

procedure ShowStar (s: star; var i: integer; var goex: boolean);
var 
	x, y: integer;
begin
	GotoXY(s.CurX, s.CurY);
	write('*');
	GotoXY(1, 1);
	write(i);
	i := i + 1;
	if (i >= 300) then
	begin
		clrscr;
		x := ((ScreenWidth div 2) - 13);
		y := ((ScreenHeight div 2) - 3);
		GotoXY(x, y);
		writeln('Вы не уложились в 300 шагов!');
		GotoXY(x, y + 1);
		writeln('И проиграли');
		GotoXY(x - 7, y + 2);
		writeln('Нажмите Enter чтобы закончить игру');
		readln;
		goex := true
	end	
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
	c := s.arr;	
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
	end;
	s.uzepress := false;
	s.arr := 'a'
end;

procedure ControlKey(var c: char; var HasKeyPress: boolean);
begin
	HasKeyPress := KeyPressed;
	if HasKeyPress then
	begin
		c := ReadKey;
		if c = #0 then
			c := ReadKey;
	end
	else
		c := #0
end;

procedure MoveStar (var s: star; var goex: boolean;
var Goalps: array of Goalp; var i: integer);
var
	a, g, x, y: integer;
	c: char;
	HasKeyPress: boolean;
begin
	HideStar(s);
	
	ControlKey(c, HasKeyPress);

	if HasKeyPress then
	begin
		if (c = #27) or (c = ' ') then
			goex := true
		else if c in [#75, #77, #72, #80] then
		begin
			if (s.stepa >= 10) then
			begin
				s.arr := c;
				ManuChan(s);
				s.stepa := 0
			end
			else
			begin
				s.arr := c;
				s.uzepress := true
			end
		end
	end;			

	if (s.stepa >= 10) and s.uzepress then
	begin
		ManuChan(s);
		s.stepa := 0;
	end
	else
	begin
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

	for g := 1 to 9 do
	begin
		if (s.CurX = Goalps[g].x) and (s.CurY = Goalps[g].y) then
		begin
			clrscr;		
			x := ((ScreenWidth div 2) - 3);
			y := ((ScreenHeight div 2) - 3);
			GotoXY(x, y);
			writeln('YOU WIN');
			GotoXY(x, y + 1);
			write('in step ', i);
			readln;
			goex := true
		end
	end;
					
	ShowStar(s, i, goex)
end;

procedure ShowGoal(var Goalps: array of Goalp);
var
	x, y, ix, iy, g: integer;
begin
	x := ((ScreenWidth div 2) - 2);
	y := ((ScreenHeight div 2) - 2);
	g := 1;
	GotoXY(x, y);
	for ix := 1 to 3 do
	begin
		for iy := 1 to 3 do
		begin
			GotoXY(x + ix, y + iy);
			write('@');
			Goalps[g].x := x + ix;
			Goalps[g].y := y + iy;
			g := g + 1
		end
	end
end;

var
	s: star;
	goex: boolean;
	i, x, y: integer;
begin
	randomize;
	clrscr;
	i := 1;
	s.CurX := 1;
	s.CurY := 1;
	s.dx := 1;
	s.dy := 0;
	goex := false;
	s.arr := 'a';
	s.uzepress := false;
	s.stepa := 10;
	x := ((ScreenWidth div 2) - 13);
	y := ((ScreenHeight div 2) - 3);
	GotoXY(x, y);
	writeln('Вам нужно победить за 300 шагов');
	GotoXY(x, y + 1);
	writeln('Приведите звездочку в цель');
	GotoXY(x + 6, y + 2);	
	writeln('в центре экрана!');
	GotoXY(x, y + 3);
	writeln('Нажмите Enter чтобы начать');
	readln;
	clrscr;
	ShowGoal(Goalps);
	while not goex do
	begin
		MoveStar(s, goex, Goalps, i);
		delay(DelayDuration)
	end;
	clrscr
end.
