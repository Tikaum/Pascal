program task219D;
var
	c: char;	
	n: integer;
	itword, mendz: boolean;
begin
	n := 0;
	itword := false;
	mendz := false;

	while not eof do
	begin
		read(c);
		if c = #10 then 
		begin
			if mendz then
				n := n + 1;
			writeln(n);
			itword := false;
			mendz := false;
			n := 0;
		end
		
		else
		begin
			if (c = ' ') then
				itword := false
		
			else if (c = 'A') and not itword then
				itword := true

			else if (c = 'z') and itword then
				mendz := true

			else
				mendz := false;
				
			if mendz and (c = ' ') then
				begin
					n := n + 1;
					itword := false;
					mendz := false;
				end							
		end	
	end
end.
