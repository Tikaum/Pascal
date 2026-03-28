program s213;

procedure PrintSpaces(b: integer);
var
	a: integer;
begin
	for a := 1 to b do
		write(' ');
end;

procedure PrintOneDia(n, a: integer);
begin
	PrintSpaces(n+1-a);
	write('*');
	if (a > 1) then
	begin
		PrintSpaces(2*a-3);
		write('*')
	end;
	writeln
end;

procedure PrintMoreDia(n, a, k: integer);
var
	i: integer;
begin
	if (a = 1) then
	begin	
		PrintSpaces(n+1-a);
		write('*');
		for i := 2 to k do
		begin
			PrintSpaces(n*2+1);
			write('*')
		end;
	writeln
	end;

	if (a > 1) then
	begin	
		PrintSpaces(n+1-a);
		write('*');
		PrintSpaces(2*a-3);
		write('*');
		for i := 2 to k do
		begin
			PrintSpaces(2*n - 2*a + 3);
			write('*');
			PrintSpaces(2*a-3);
			write('*')
		end;
		writeln
	end
end;

procedure PrintStar(n, a, k: integer);
begin
	if (k > 1) then
		PrintMoreDia(n, a, k)
	else 
		PrintOneDia(n, a)
end;
		
var
	s1, s2: string;
	h, n, a, kol, code1: integer;
	code2, code3: word;
begin
	code1 := ParamCount;
	s1 := ParamStr(1);
	val(s1, h, code2);
	s2 := ParamStr(2);
	val(s2, kol, code3);

	if (code2 <> 0) or (code3 <> 0) or (code1 <> 2) then
	begin
		writeln('Введены некорректные данные.');
		writeln('Повторите запуск программы c двумм параметрами в виде целого числа');
		halt(1);
	end;
		
	writeln('Рисуем ', kol, ' алмазов, высотой: ', h);
	n := h div 2;

	for a := 1 to (n + 1) do
		PrintStar(n, a, kol);
	for a := n  downto 1 do
		PrintStar(n, a, kol)
end.
