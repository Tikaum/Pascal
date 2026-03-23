program s223;
var
  s: string;
  itword: boolean;
  n, i: integer;
begin
	if (ParamCount <> 1) then
	begin
		writeln('Параметров нет или более одного, давай ищо!');
		Halt(1)
	end;
		
	s := ParamStr(1);
	n := 0;
	itword := false;
	for i := 1 to Length(s) do
	begin
		if (s[i] <> ' ') and not itword then
		begin
			n := n + 1;
			itword := true
		end
		else if (s[i] = ' ') then
			itword := false
	end;
	writeln(n);
end.
