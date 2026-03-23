program s224;

var
  s1, s2, s3, med, resstr: string;
  num1, num2, res: real;
  num3, code, i, a, dotpos: integer;
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
	str(res:0:10, med);

	for i := 1 to Length(med) do
	begin
		if (med[i] = '.') then
			dotpos = i
	end;

	for i := dotpos + 1 to num3 do
	begin
		




		
	
	resstr := str(res:
	
end.
