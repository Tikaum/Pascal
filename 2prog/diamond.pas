program diamond;
var 
  h, n, a, b : integer;
  s, p : string;
begin
  s := '*';
  p := ' ';
  write('Vvedite visoty almaza: ');
  readln(h);
  n := h div 2;
{печать верхней части}
  for a := 1 to (n+1) do
  begin
    for b := 1 to (n+1-a) do
      write(p);
    write(s);       
    if a > 1 then
    begin
      for b := 1 to (2*a-3) do
        write(p);
      write(s);
    end;
  writeln()
  end;
{печать нижней части}
  for a := n downto 1 do
  begin
    for b := 1 to (n+1-a) do
      write(p);
    write(s);       
    if a > 1 then
    begin
      for b := 1 to (2*a-3) do
        write(p);
      write(s);
    end;
  writeln()
  end
end.
