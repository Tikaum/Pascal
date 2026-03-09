program letterZ;

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

function IsNumberOk(h: integer): boolean;
begin
   IsNumberOk := (h mod 2 = 1) and (h > 5);
end;

var 
  h, a: integer;
begin
  repeat
  begin
    write('Введите высоту буквы: ');
    readln(h);
    if not IsNumberOk(h) then
      writeln('Было введено неверное число, введите его снова.')
  end
  until IsNumberOk(h);

  for a := 1 to h do
  begin
{печать звездатой части}
    if (a = 1) or (a = h) or (a = h div 2 + 1) then
      PrintStar(h)

{печать однозвездной части}
    else
      PrintSpacesStar(h - a);  
  end
end.
