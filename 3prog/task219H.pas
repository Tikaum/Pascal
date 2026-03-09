program task219H;
var
	c: char;	
	zakr: integer;
	res1: boolean;
begin
	zakr := 0;
	res1 := false;

	while not eof do
	begin
		read(c);
		if c = #10 then 
		begin
			writeln (zakr);
			res1 := false;
			zakr := 0
		end
		
		else
		begin
			if (c = '(') then
				res1 := true
				
			else if (c = ')') and res1 then
			begin
				zakr := zakr + 1;
				res1 := false
			end

			else
				res1 := false
		end	
	end
end.
