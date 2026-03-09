program powers;

procedure qube(var s2, s3, s4: longint; c: longint);
begin
  s2 := c*c;
  s3 := c*s2;
  s4 := c*s3
end;  

var 
  chislo, second, third, four: longint;
begin
  write('Введите число, которое нужно ввести в степени 2, 3 и 4: ');
  readln(chislo);
  qube( second, third, four, chislo);
  writeln (second, ', ', third, ', ', four)
end.
