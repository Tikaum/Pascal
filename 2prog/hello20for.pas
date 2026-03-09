program star24;
var 
  a, i : integer;
  s : string;
begin
  s := '*';
  a := 0;
  while a < 24 do
  begin
    for i := 1 to a do
    begin
      write(' ');
    end
    writeln(s);   
    a := a +1;
  end
end.
