program task219F;
var
	c: char;	
	n, long, space, count, countS : integer;
	itword, itspace: boolean;
begin
	n := 0;
	long := 0;
	space := 0;
	count := 0;
	countS := 0;
	itword := false;
	itspace := false;

	while not eof do
	begin
		read(c);
		if c = #10 then 
		begin
			if itword then
				n := n + 1;
			if count > long then
				long := count;
			if (count < short) and (count > 0) then
				short := count;			
			writeln('Кол-во слов ', n, '. Длина длинного ', long,
			 '. Длина короткого ', short);
			itword := false;
			n := 0;
			long := 0;
			short := 0;
			count := 0			
		end
		
		else
		begin
			if (c <> ' ') then
			begin
				itword := true;
				count := count + 1
			end
				
			else if itword then
			begin
				n := n + 1;
				itword := false;
				if count > long then
					long := count;
				count := 0				
			end			
		end	
	end
end.
