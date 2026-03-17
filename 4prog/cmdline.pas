program cmdline;
var
  x: integer;
begin
	for x := 0 to ParamCount do
		writeln('[', x, ']: ', ParamStr(x))
end.
