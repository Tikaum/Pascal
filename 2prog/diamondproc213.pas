program diamondproc213;

procedure PrintSpaces(count: integer);
var
b : integer;
begin
  for b := 1 to count do
  write(' ')
end;

procedure PrintOneDiamond(n, a: integer);
begin
  PrintSpaces(n+1-a);
  write('*');
  if a > 1 then
  begin
    PrintSpaces(2*a-3);
    write('*')
  end;
  writeln
end;

procedure PrintMoreDiamonds(n, a, k: integer);
var
i : integer;
begin

  if a = 1 then
  begin
{печатаем первую звезду первого ряда}
    PrintSpaces(n+1-a);
    write('*');
{печатаем остальные звезды первого ряда}
    for i:= 2 to k do 
    begin
      PrintSpaces(n*2+1);
      write('*')
    end;
  writeln
  end;

  if a > 1 then
  begin
{печатаем звезды второго и следующего ряда}
    PrintSpaces(n+1-a);
    write('*');
    PrintSpaces(2*a-3);
    write('*');

    for i:= 2 to k do
    begin
      PrintSpaces(2*n - 2*a + 3);
      write('*');
      PrintSpaces(2*a-3);
      write('*');
    end;
  writeln
  end
end;

procedure PrintStar(n, a, k: integer);
begin
  if k > 1 then
    PrintMoreDiamonds(n, a, k)
  else
    PrintOneDiamond(n, a);
end;

var 
  h, n, a, kol: integer; 
begin
  write('Vvedite visoty almaza: ');
  readln(h);
  write('Vvedite chislo almazov: ');
  readln(kol);

  n := h div 2;
{печать верхней части}
  for a := 1 to (n+1) do
    PrintStar(n, a, kol);

{печать нижней части}
  for a := n downto 1 do
    PrintStar(n, a, kol);
end.
