program s222E;
var
  s: string;
  c, q: char;
  print: boolean;
  i, b: integer;
begin
	for i:= 1 to ParamCount do
	begin
		print := true;
		s := ParamStr(i);
		c := s[1];
		for b := 2 to Length(s) do
		begin
			q := s[b];
			if (c <> q) then
			begin
				print := false;
				break
			end
		end;
		if print then
			writeln(ParamStr(i));
	end
end.
