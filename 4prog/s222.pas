program s222;
var
  s: string;
  i, pprint, plen, pmax: integer;
begin
	pprint := 1;
	pmax := 1;
	plen := 1;
	for i:= 1 to ParamCount do
	begin
		s := ParamStr(i);
		plen := Length(s);
		if plen > pmax then
		begin
			pmax := plen;
			pprint := i;
		end;
	end;
	writeln(ParamStr(pprint));
	writeln(pmax)	
end.
