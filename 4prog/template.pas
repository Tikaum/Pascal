program s222;
var
  s: string;
  z: char;
  i: integer;
begin
	s := '';
	i := 0;
	i := ParamCount;
	writeln(i);
	s := ParamStr(3);
	writeln(s)	
end.
