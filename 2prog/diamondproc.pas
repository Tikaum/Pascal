program diamondproc;

procedure PrintSpaces(count: integer);
var
b : integer;
begin
  for b := 1 to count do
  write(' ')
end;

procedure PrintStar(n, a: integer; s: char);
begin
  PrintSpaces(n+1-a);
  write(s);       
  if a > 1 then
  begin
    PrintSpaces(2*a-3); 
    write(s);
  end;
  writeln
end;

var 
  h, n, a: integer;
  s : char;
begin
  write('Vvedite visoty almaza: ');
  readln(h);
  write('Vvedite luboi simbol: ');
  readln(s);
  n := h div 2;
{печать верхней части}
  for a := 1 to (n+1) do
    PrintStar(n, a, s);
{печать нижней части}
  for a := n downto 1 do
    PrintStar(n, a, s);
end.
