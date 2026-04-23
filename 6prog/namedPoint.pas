program Point;
type
	NamedPoint = record
		latitude, longitude: real;
		name: string[15];
	end;
const
	filename = '123.txt';
var 
	f: file of NamedPoint;
	rec: NamedPoint;
begin
	rec.latitude := 34.43545;
	rec.longitude := 298.23421;
	rec.name := 'dsafsadfdsf';
	assign(f, filename);
	reset(f);
	seek(f, 4);
	write(f, rec)
end.