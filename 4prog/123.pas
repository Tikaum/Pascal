program ertert;
uses crt;

var
	s, c, x, y: integer;
 
begin
	s := 123;
	c := 45;	

	randomize;
	x := random(s) + 1;
	y := random(c) + 1;
	write('*');
end.
