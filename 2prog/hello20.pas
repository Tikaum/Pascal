program Hello20;
var 
  i : integer;
  s : string;
begin
  i := 0;
  s := 'Hello, Hello, world!';
  while i<20 do
  begin
    write(i);
    writeln(s);
    i:= i+1
  end
end.
