program letter2152;

procedure PrintSpacesStar(count: integer);
var
b : integer;
begin
  for b := 1 to count do
    write(' ');
  write('*');
end;

procedure PrintStar(h, iter: integer);
var
b, i : integer;
begin
  for i:=1 to iter do
  begin
    for b := 1 to h do
      write('*');
    write(' ')
  end    
end;

procedure PrintSpaces(count: integer);
var
b : integer;
begin
  for b := 1 to count do
    write(' ');
end;

procedure Print1Letter(n, h: integer);
var 
a: integer;
begin
  for a := 1 to h do
  begin
{печать звездатой части}
    if ((a = 1) or (a = n+1) or (a = h)) then
    begin
      PrintStar(h, 1);
      writeln
    end
{печать однозвездной части}
    else
    begin
      PrintSpacesStar(h - a);  
      writeln
    end
  end
end;

procedure PrintElement(smesh, b, h, a, n: integer);
begin
  PrintSpaces(smesh * (b-2));
  PrintSpacesStar(h - a);  
  PrintSpaces(a+n);
  PrintSpacesStar(h - a);  
  writeln
end;

procedure PrintLetters(n, h, z: integer);
var 
a, b, smesh: integer;
begin
  smesh := h+1;
  for b := 1 to z do
  begin
    if (b = 1) then
    begin
      for a := 1 to (n+1) do
      begin
        if (a = 1) then
        begin
          PrintStar(h, 1);
	  writeln;
	end;
	if (a > 1) and (a <= n) then
	begin
	  PrintSpacesStar(h - a);  
	  writeln;
	end;
	if a = (n+1) then
	begin
          PrintStar(h, 2);
	  writeln;
	end;
      end
    end;
    if (b>1) and (b<z) then
    begin
      for a := (n+2) to (h-1) do
          PrintElement(smesh, b, h, a, n);
        PrintSpaces(smesh * (b-2));
        PrintStar(h, 3);
        writeln
    end;

    if b = z then
    begin
      for a := (n+2) to (h-1) do
          PrintElement(smesh, b, h, a, n);
        PrintSpaces(smesh * (b-2));
        PrintStar(h, 2);
        writeln;
      for a := (n+2) to (h-1) do
      begin
        PrintSpaces(smesh * (b-1));
        PrintSpacesStar(h - a);  
        writeln
      end;
      PrintSpaces(smesh * (b-1));
      PrintStar(h, 1);
      writeln
    end
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
  if z <= 1 then
    Print1Letter(n, h);
  if z > 1 then
    PrintLetters(n, h, z)  
end.
