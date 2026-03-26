program s224;

var
  s1, s2, s3, med: string;
  num1, num2, res: real;
  num3, code, i, a, b, dotpos: integer;
begin
	s1 := ParamStr(1);
	s2 := ParamStr(2);
	s3 := ParamStr(3);

	Val(s1, num1, code);
	if (code <> 0) then 
	begin
		writeln('Ошибка преобразования');
		Halt(1);
	end;
	Val(s2, num2, code);
	if (code <> 0) then 
	begin
		writeln('Ошибка преобразования');
		Halt(1);
	end;
	Val(s3, num3, code);
	if (code <> 0) then 
	begin
		writeln('Ошибка преобразования');
		Halt(1);
	end;
	
	res := num1 * num2;
	str(res:0:num3, med);
	writeln(med);	

	for i := 1 to Length(med) do
	begin
		if med[i] = '.' then
			dotpos := i			
	end;		

	a := 0;
	for i := Length(med) downto (dotpos + 1) do
	begin
		if med[i] = '0' then
			a := a + 1
		else
			break
	end;			

	b := Length(med) - a;
	if b = dotpos then
		b := dotpos - 1;
	
	SetLength(med, b);
	writeln(med)
end.
