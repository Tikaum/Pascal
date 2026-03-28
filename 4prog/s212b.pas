program s212b;

procedure PrintChars(b: integer; c: char);
var
	a: integer;
begin
	for a := 1 to b do
		write(c);
end;

procedure PrintStar(n, a: integer; c, s: char);
begin
	if a = 1 then
		PrintChars(n * 2 + 1, s)
	else
	begin
		PrintChars(n + 2 - a, s);
		PrintChars(2 * a - 3, c);
		PrintChars(n + 2 - a, s)
	end;
	writeln	
end;

var
	st, sp: char;
	s: string;
	h, n, a, code1: integer;
	code2: word;
begin
	code1 := ParamCount;
	s := ParamStr(1);
	val(s, h, code2);
	if (code2 <> 0) or (code1 <> 1) then
	begin
		writeln('Введены некорректные данные.');
		writeln('Повторите запуск программы c одним параметром в виде целого числа');
		halt(1);
	end;
		
	writeln('Рисуем алмаз высотой: ', h);
	st := '*';
	sp := ' ';
	n := h div 2;

	for a := 1 to (n + 2) do
		PrintStar(n + 1, a, sp, st);
	for a := (n + 1) downto 1 do
		PrintStar(n + 1, a, sp, st)
end.
