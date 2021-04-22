program descompuesto;

var

   num : integer;

begin

    num := 32175;

    while (num <> 0) do begin

    num := num DIV 10;

    writeln(num MOD 10);

    end;

end.