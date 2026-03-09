program letter2152;

procedure PrintSpacesStar(count: integer);
var
b : integer;
begin
  for b := 1 to count do
    write(' ');
  write('*');
  writeln
end;

procedure PrintStar(h: integer);
var
b : integer;
begin
  for b := 1 to h do
      write('*');
  writeln;
end;

procedure PrintNothing(h: integer);
var
b : integer;
begin
  for b := 1 to h do
      write('#');
  writeln;
end;

procedure Print1Letter(n, h: integer);
var 
a: integer;
begin
  for a := 1 to h do
  begin
{печать звездатой части}
    if ((a = 1) or (a = n+1) or (a = h)) then
      PrintStar(h)
{печать однозвездной части}
    else
      PrintSpacesStar(h - a);  
  end
end;

function IsNumberOk(h: integer): boolean;
begin
   IsNumberOk := (h mod 2 = 1) and (h > 5);
end;

var 
  h, n, z: integer;
begin
  repeat
  begin
    write('Введите высоту буквы (нечетное число, больше пяти): ');
    readln(h);
    if not IsNumberOk(h) then
      writeln('Было введено недопустимое число, введите его снова.')
  end
  until IsNumberOk(h);

  write('Введите количество букв: ');
  readln(z);
  n:= h div 2;
  Print1Letter(n, h);
  
end.
