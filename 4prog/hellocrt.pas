program hellocrt;
uses crt;
const
	TheMessage = 'Hello, world!';
	DelayDuration = 5000;
var
  x, y: integer;
begin
	clrscr;
	y := ScreenHeight div 2;
	x := (ScreenWidth - length(TheMessage)) div 2;
	GotoXY(x, y);
	write(TheMessage);
	GotoXY(1, 1);
	delay(DelayDuration);
	clrscr
end.
