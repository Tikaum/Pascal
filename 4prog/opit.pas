program abs;
uses crt;

var
  x, y: integer;
begin
	x := ScreenHeight;
	randomize;
	y := random(x);
    writeln(x);
    writeln(y)
end.
