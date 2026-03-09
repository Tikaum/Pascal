program task219E;
var
	c: char;	
	n: integer;
	itword: boolean;
begin
	n := 0;
	itword := false;

	while not eof do
	begin
		read(c);
		if c = #10 then 
		begin
			if itword then
				n := n + 1;
			writeln(n);
			itword := false;
			n := 0;
		end
		
		else
		begin
			if (c <> ' ') then
				itword := true
			else if itword then
			begin
				n := n + 1;
				itword := false
			end			
		end	
	end
end.
