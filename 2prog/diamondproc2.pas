program diamondproc2;

procedure PrintSpaces(count: integer);
var
b : integer;
begin
  for b := 1 to count do
  write(' ')
end;

procedure PrintExtStar(count: integer);
var
b : integer;
begin
  for b := 1 to count do
  write('*')
end;

procedure PrintStar(n, a: integer);
begin
  if a = 1 then
    PrintExtStar(n*2+1)
  else
  begin
    PrintExtStar(n+2-a); 
    PrintSpaces(2*a-3); 
    PrintExtStar(n+2-a); 
  end;
  writeln
end;

var 
  h, n, a: integer;
begin
  write('Vvedite visoty almaza: ');
  readln(h);
  n := h div 2;
{печать верхней части}
  for a := 1 to (n+2) do
    PrintStar(n+1, a);
{печать нижней части}
  for a := (n+1) downto 1 do
    PrintStar(n+1, a);
end.
