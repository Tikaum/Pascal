program task221;
{НИЧЕГО НЕ ИЗМЕНИЛ. НУЖНО ДОДЕЛАТЬ}
var
	c: char;
	n: integer;
	word: string;	
	itword: boolean;
begin
	itword := false;
	word := '';
	n := 0;
	
	while not eof do
	begin
		read(c);
		if c = #10 then 
		begin
			if itword and (n = 2) then
				write('(', word, ')');
			writeln();
			itword := false;
			n := 0;
			word := ''
		end
		
		else
		begin
			if (c <> ' ') then
			begin
				n := n + 1;		
				itword := true;
				word := word + c
			end
				
			else if itword then
			begin
				itword := false;
				if n = 2 then
					write('(', word, ') ');
				word := '';
				n := 0
			end			
		end	
	end
end.
