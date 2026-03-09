program diamondproc1;

function ChisloChetnoe(h: integer): boolean;
begin
  ChisloChetnoe := (h mod 2) = 0;
  if ChisloChetnoe then
    writeln('Введите нечетное число повторно.')
end;


procedure PrintSpaces(count: integer);
var
b : integer;
begin
  for b := 1 to count do
  write(' ')
end;

procedure PrintEnterStar(count: integer; z: char);
var
b : integer;
begin
  for b := 1 to count do
  write(z)
end;

procedure PrintStar(n, a: integer; s, z: char);
begin
  PrintSpaces(n+1-a);
  write(s);       
  if a > 1 then
  begin
    PrintEnterStar(2*a-3, z); 
    write(s);
  end;
  writeln
end;

var 
  h, n, a: integer;
  s, z : char;
  v: boolean;
begin
  repeat
  begin
    write('Vvedite visoty almaza: ');
    readln(h);
    v:= ChisloChetnoe(h);
  end
  until not v;

  write('Vvedite simbol dlya vnutry: ');
  readln(z);
  write('Vvedite simbol dlya naruji: ');
  readln(s);
  n := h div 2;
{печать верхней части}
  for a := 1 to (n+1) do
    PrintStar(n, a, s, z);
{печать нижней части}
  for a := n downto 1 do
    PrintStar(n, a, s, z);
end.
