program s224;

var
  s1, s2, s3, med, resstr: string;
  num1, num2, res: real;
  num3, code, i, a, b: integer;
  todot: boolean;
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

	a := 0;
	todot := false;

	for i := Length(med) downto (Length(med) - 10) do
	begin
		if med[i] = '0' then
			a := a + 1
		else if med[i] = '.' then
			todot := true
		else
			break
	end;			
	
	if (a > 0) and not todot then
		b := Length(med) - a
	else if todot then
		b := Length(med) - (a + 1);
	
	SetLength(med, b);
	
	writeln(med)
end.
