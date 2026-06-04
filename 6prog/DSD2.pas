program Mult;
type
	itemptr = ^item;
	item = record
		data: integer;
		num: integer;
		next: itemptr;
	end;
var	
	x, n: integer;
	f: text;
	list: itemptr;
begin
	{$I-}
	if ParamCount < 1 then
	begin
		writeln('Please specify the file name');
		halt(1)
	end;
	assign(f, ParamStr(1));
	reset(f);
	if IOResult <> 0 then
	begin
		writeln('Could not open ', ParamStr(1));
		halt(1)
	end;
	n := 1;
	new(list);
	list^.num := 1;
	list^.next : nil;
	while not SeekEof(f) do
	begin 		
		while not SeekEoln(f) do
		begin
			read(f, x);
			list^.data := x;
			n := n + 1;
		end;
		readln(f);		
		
	end;
	close(f);
	writeln(sum:7:5)
end.
