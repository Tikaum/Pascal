program s214;

procedure PrintSpacesStar(count: integer);
var
	b: integer;
begin
	for b := 1 to count do
		write(' ');
	write('*');
	writeln	
end;

procedure PrintStar(h: integer);
var
	b: integer;
begin
	for b := 1 to h do
		write('*');
	writeln	
end;

function IsOk(h: integer): boolean;
begin
	IsOk := (h mod 2 = 1) and (h > 5)
end;

var
	s1: string;
	h, a, code1: integer;
	code2: word;
begin
	code1 := ParamCount;
	s1 := ParamStr(1);
	val(s1, h, code2);

	if (code2 <> 0) or (code1 <> 1) then
	begin
		writeln('Введены некорректные данные.');
		writeln('Повторите запуск программы c одним параметром в виде целого числа');
		halt(1);
	end;

	if not IsOk(h) then
	begin
		writeln('Нужно ввести нечетное число больше 5!');
		halt(1)
	end;
		
	writeln('Рисуем букву z, высотой: ', h);

	for a := 1 to h do
	begin
		if (a=1) or (a=h) or (a = h div 2 + 1) then
			PrintStar(h)
		else
			PrintSpacesStar(h-a)
	end
end.
