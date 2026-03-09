program fibo;

function Fibo(n: integer): longint;
var
i : integer;
p, q, r: longint;
begin
  if n <= 0 then
     Fibo := 0
  else
  begin
    q := 0;
    r := 1;
    for i := 2 to n do
    begin
      p := q;
      q := r;
      r := p + r;
    end;
  Fibo := r
  end
end;

var 
  n: integer;
  r: longint;
begin
  write('Nomer chisla Fibo: ');
  readln(n);
  if ((n>= 'A') and (n <= 'Z')) or ((n>= 'a') and (n <= 'z'))
    writeln('Введена буква');
  else
  begin
    r := Fibo(n-1);
    writeln(r)
  end
end.
