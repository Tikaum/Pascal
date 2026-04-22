program HelloFile;
const
        message1 = 'Hello, world!123';
        message2 = 'Hello, world!456';
        message3 = 'Hello, world!789';
        message4 = 'Hello, world! $ Fun yoU!!!';
        filename = 'hello.txt';
var
        f: text;
begin   
		{$I-}
        assign(f, filename);
		{reset(f);}
        {rewrite(f);}
		append(f);
		if IOResult <> 0 then
		begin
				writeln('Couldn''t open file ', filename);
				halt(1)
		end;
		writeln(f, message1);
		writeln(f, message3);
		writeln(f, message4);
		writeln(f, message2);
		if IOResult <> 0 then
		begin
				writeln('Couldn''t write to the file');
				halt(1)
		end;
        close(f);
end.
