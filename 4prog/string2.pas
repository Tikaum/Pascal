program string2;
var
  s, z: string;
  i: integer;
begin
	z := '1234567890';
	for i := 1 to 100 do
		s := s + z;
	writeln(Length(s));
	writeln(s)
end.
