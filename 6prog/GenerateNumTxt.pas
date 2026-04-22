program GenerateNumTxt;
const
        name = 'numbers.txt';
		start = 1000;
		step = 1001;
		count = 100;
var
        f: text;
		i: integer;
		n: longint;
begin   
		{$I-}
        assign(f, name);
        rewrite(f);
		if IOResult <> 0 then
		begin
				writeln('Couldn''t open file ', name);
				halt(1)
		end;
		n := start;
		for i := 1 to count do
		begin
				writeln(f, n);
				n := n + step;
		end;
		if IOResult <> 0 then
		begin
				writeln('Couldn''t write to the file');
				halt(1)
		end;
        close(f);
end.
