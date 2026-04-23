program create123;
type
	NamedPoint = record
		latitude, longitude: real;
		name: string[15];
	end;
const
	filename = '123.txt';
var 
	i: integer;
	f: file of NamedPoint;
	points: array[1..10] of NamedPoint = (
		(latitude: 54.7388; longitude: 55.9721; name: 'Ufa'),
		(latitude: 55.7558; longitude: 37.6173; name: 'Moscow'),
		(latitude: 59.9343; longitude: 30.3351; name: 'SPb'),
		(latitude: 56.8389; longitude: 60.6057; name: 'Yekaterin'),
		(latitude: 43.1155; longitude: 131.8855; name: 'Vladivost'),
		(latitude: 51.5336; longitude: 46.0343; name: 'Saratov'),
		(latitude: 48.4827; longitude: 135.0838; name: 'Khabarovsk'),
		(latitude: 56.3269; longitude: 44.0059; name: 'Nizhny'),
		(latitude: 45.0355; longitude: 38.9753; name: 'Krasnodar'),
		(latitude: 57.6266; longitude: 39.8938; name: 'Yaroslavl')
	);
begin
	assign(f, filename);
	rewrite(f);
	for i := 1 to 10 do
		write(f, points[i]);
	close(f)
end.