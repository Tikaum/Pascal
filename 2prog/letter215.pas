program letter215;

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

procedure PrintStarsAnd(h, p: integer);
var
b, d : integer;
begin
  for d:=1 to p do
    begin
      for b := 1 to h do
        write('*');
      write(' ');
    end
end;

procedure PrintBegin(n, h: integer);
var 
a: integer;
begin
  for a := 1 to n do
  begin
{печать звездатой части}
    if (a = 1) then
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
  h, n, a, z, w, i: integer;
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
{полувысота равна}
  n:= h div 2;
{высота всех букв равна}
  w:= (z+1)*n + 1;
{количество тройных линий}
  i:= z - 2;

  begin
  for a := 1 to w do
    begin
      if (a = 1) then
        PrintStar(h);
      if (a>1) and (a<=n) then
        PrintSpacesStar(h - a);  
      if (a=n+1) or (a=w-n) then
      begin
        PrintStarsAnd(h, 2);
        writeln;
      end;
      if ((a = h) or ((a-h) mod 3 = 0)) and (i>0) then
        begin	
          PrintStarsAnd(h, 3);
	  writeln;
	  i:=i-1;
        end;	
    end
  end
end.
