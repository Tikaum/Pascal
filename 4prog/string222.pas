program string3;
var
  s: string;
  z: char;
begin
	s := '';
	for z := 'A' to 'Z' do
		s := s + z;
	writeln(Length(s));
	writeln(s)
end.
