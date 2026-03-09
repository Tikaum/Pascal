program task219G;
var
	c: char;	
	otkr, zakr: integer;
	res1: boolean;
begin
	otkr := 0;
	zakr := 0;
	res1 := false;

	while not eof do
	begin
		read(c);
		if c = #10 then 
		begin
			if (otkr = zakr) and res1 then
				writeln ('YES')
			else
				writeln ('NO');			
			otkr := 0;
			zakr := 0;
			res1 := true
		end
		
		else
		begin
			if (c = '(') then
				otkr := otkr + 1
				
			else if (c = ')') then
			begin
				zakr := zakr + 1;
				if zakr > otkr then
					res1 := false
				else
					res1 := true
			end
		end	
	end
end.
