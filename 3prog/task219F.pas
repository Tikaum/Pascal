program task219F;
var
	c: char;	
	long, space, count, countS : integer;
	itword, itspace: boolean;
begin
	long := 0;
	space := 0;
	count := 0;
	countS := 0;
	itword := false;
	itspace := true;

	while not eof do
	begin
		read(c);
		if c = #10 then 
		begin
			if count > long then
				long := count;
			write('Длина самого длинного слова ', long);
			if countS > space then
				space := countS;
			writeln('. Длина самого длинного пробела ', space);			
			
			itword := false;
			itspace := true;
			long := 0;
			count := 0;			
			space := 0;
			countS := 0
		end
		
		else
		begin
			if (c <> ' ') then
			begin
				itword := true;
				itspace := false;
				count := count + 1;
				if countS > space then
					space := countS;
				countS := 0;				
			end
				
			else if itword then
			begin
				itword := false;
				itspace := true;
				if count > long then
					long := count;
				count := 0;
				countS := 1;			
			end			

			else if itspace then
			begin
				countS := countS + 1;
				if countS > space then
					space := countS;	
			end
		end	
	end
end.
