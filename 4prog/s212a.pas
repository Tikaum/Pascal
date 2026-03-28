program s212a;

procedure prints(n, a: integer; st, sp: char);
var
	b: integer;
begin
	for b := 1 to (n+1-a) do
		write(sp);
	write(st);
	if a > 1 then
	begin
		for b := 1 to (2 * a - 3) do
			write(sp);
		write(st)
	end;
	writeln
end;

var
	st, sp: char;
	s: string;
	h, n, d, code1: integer;
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
	st := '@';
	sp := ' ';
	n := h div 2;

	for d := 1 to (n + 1) do
		prints(n, d, st, sp);
	for d := n downto 1 do
		prints(n, d, st, sp)
end.
