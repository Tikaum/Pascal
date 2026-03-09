program task219B;
var
	c: char;	
	n, m, count: integer;
	itword: boolean;
begin
	n := 0;
	m := 0;
	count := 0;

	itword := false;

	while not eof do
	begin
		read(c);
		if c = #10 then 
		begin
			if itword then
			begin
				if (count mod 2 = 1) then
					n := n + 1
				else
					m := m + 1;
			end;
			writeln('Нечетных ', n, ', Четных ', m);
			itword := false;
			n := 0;
			m := 0;
			count := 0
		end
		
		else
		begin
			if (c <> ' ') and (c <> #10) then
			begin
				itword := true;
				count := count + 1
			end

			else if itword then
				begin
					if (count mod 2 = 1) then
						n := n + 1
					else
						m := m + 1;
					itword := false;
					count := 0
				end			
		end	
	end
end.
