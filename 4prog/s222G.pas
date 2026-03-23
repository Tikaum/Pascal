program s222G;
var
  s1, s2: string;
  print: boolean;
  i, b, d: integer;
begin
	s1 := ParamStr(1);
	for i:= 2 to ParamCount do
	begin
		print := false;
		s2 := ParamStr(i);
		for b := 1 to Length(s2) do
		begin
			for d := 1 to Length(s1) do
			begin
				if (s2[b] = s1[d]) then
					print := true
			end
		end;
		if print then
			writeln(ParamStr(i));
	end
end.
