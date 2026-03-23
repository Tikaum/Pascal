program s222D;
var
  s: string;
  c: char;
  print: boolean;
  i, b: integer;
begin
	for i:= 1 to ParamCount do
	begin
		print := true;
		s := ParamStr(i);
		for b := 1 to Length(s) do
		begin
			c := s[b];
			if not (c in ['0'..'9']) then
				print := false
		end;
		if print then
			writeln(ParamStr(i));
	end
end.
