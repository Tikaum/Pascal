program PrintDigits;

procedure Print(n: integer);
begin
  if n > 0 then
  begin
    Print(n div 10);
    write(n mod 10, ' ')
  end
end;

var
  m : integer;
begin
  writeln('Введите число, которое нужно разложить на цифры');
  readln(m);
  Print(m);
  writeln();
end.
