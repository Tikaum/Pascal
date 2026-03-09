program task219C;
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
				if (count <= 2) then
					n := n + 1
				else if (count > 7) then
					m := m + 1;
			end;
			writeln('Слов с длиной не более 2 букв: ', n,
			', слов с длиной более 7 букв: ', m);
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
					if (count <= 2) then
						n := n + 1
					else if (count > 7) then
						m := m + 1;
					itword := false;
					count := 0
				end			
		end	
	end
end.
