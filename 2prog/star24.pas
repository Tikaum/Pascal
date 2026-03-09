program star24;
var 
  a, b, i : integer;
  s : string;
begin
  s := '*';
  write('Skolko nado: ');
  readln(b);
  for a := 1 to b do
  begin
    for i := 1 to (a-1) do
    begin
      write(' ');
    end;
    write(i);
    writeln(s);       
  end
end.
