program s222C;
var
  s: string;
  c: char;
  i, b, countdog, counttoch, plen: integer;
begin
	for i:= 1 to ParamCount do
	begin
		countdog := 0;
		counttoch := 0;		
		s := ParamStr(i);
		plen := Length(s);
		for b := 1 to plen do
		begin
			c := s[b];
			begin
				if c = '@' then
					countdog := countdog + 1;
				if c = '.' then
					counttoch := counttoch + 1
			end
		end;
		if (countdog = 1) and (counttoch > 0)  then
			writeln(ParamStr(i));
	end
end.
