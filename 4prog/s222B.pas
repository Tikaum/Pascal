program s222B;
var
  s: string;
  c: char;
  i, b, n, plen: integer;
  haveprint: boolean;
begin
	for i:= 1 to ParamCount do
	begin
		haveprint := true;
		s := ParamStr(i);
		plen := Length(s);
		for b := 1 to plen do
		begin
			c := s[b];
			for n := b + 1 to plen do
			begin
				if c = s[n] then
				begin
					haveprint := false;
					break
				end
			end
		end;
		if haveprint then
			writeln(ParamStr(i));
	end
end.
