program task221;
{НИЧЕГО НЕ ИЗМЕНИЛ. НУЖНО ДОДЕЛАТЬ}
var
	c: char;
	word: string;	
	itword: boolean;
begin
	itword := false;
	word:= '';
	
	while not eof do
	begin
		read(c);
		if c = #10 then 
		begin
			if itword then
				write('(', word, ') ');
			writeln();
			itword := false;
			word := ''
		end
		
		else
		begin
			if (c <> ' ') then
			begin
				itword := true;
				word := word + c
			end
				
			else if itword then
			begin
				itword := false;
				write('(', word, ') ');
				word := '' 
			end			

			else
				write(c)
		end	
	end
end.
