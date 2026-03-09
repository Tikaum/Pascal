program task219E;
var
	c: char;	
	n, long, short, count: integer;
	itword: boolean;
begin
	n := 0;
	long := 0;
	short := 0;
	count := 0;
	itword := false;

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

				if n = 1 then
				begin
					short := count;
					long := count
				end
					
				else
				begin				
					if count < short then
						short := count;					
					if count >= long then
						long := count
				end;
				count := 0				
			end			
		end	
	end
end.
