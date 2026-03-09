program diamondproc;

procedure PrintSpaces(z: char; count: integer);
begin
  if count > 0 then
  begin
    write(z);
    PrintSpaces(z, count -1);
  end  
end;

procedure PrintStar(n, a: integer; z,s: char);
begin
  PrintSpaces(z, n+1-a);
  write(s);       
  if a > 1 then
  begin
    PrintSpaces(z, 2*a-3); 
    write(s);
  end;
  writeln
end;

var 
  h, n, a: integer;
  z, s : char;
begin
  write('Vvedite visoty almaza: ');
  readln(h);
  write('Vvedite simbol dlya probela: ');
  readln(z);
  write('Vvedite simbol dlya zvezdy: ');
  readln(s);
  n := h div 2;
{печать верхней части}
  for a := 1 to (n+1) do
    PrintStar(n, a, z, s);
{печать нижней части}
  for a := n downto 1 do
    PrintStar(n, a, z, s);
end.
