program s222F;
var
  s: string;
  c: char;
  print: boolean;
  i, b: integer;
begin
	for i:= 1 to ParamCount do
	begin
		print := false;
		s := ParamStr(i);
		for b := 1 to Length(s) do
		begin
			c := s[b];
			if  (c in ['a'..'z']) or (c in ['A'..'Z']) then
				print := true
		end;
		if print then
			writeln(ParamStr(i));
	end
end.
