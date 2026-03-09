program povtor;
var
	ch1, ch2, ch3: char;	
	s1, s2: string;
	a, b, c, v: integer;
	printed: boolean;
begin
	while not eof do
	begin
		s2 := '';
		printed := false;
		readln(s1);
		for a:=1 to Length(s1) do
		begin
			v := 0;
			printed := false;
			ch1 := s1[a];
			if (ch1 = ' ') then
				continue;
			for b := (a+1) to Length(s1) do
			begin
				ch2 := s1[b];
				if (ch1 = ch2) then
					v := v+1;
			end;
			if (v > 0) then
			begin
				for c := 1 to Length(s2) do
				begin
					ch3 := s2[c];
					if (ch1 = ch3) then
						printed := true;
				end;
				if not printed then
				begin
					s2 := s2 + ch1;
				end
			end
		end;
		writeln(s2)
	end
end.
