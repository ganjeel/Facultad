

program ae;

type 
    prueba = record
        a :integer;
        b :string;
    end;

var
    x,y:prueba;

begin
    
    x.a := 1;
    x.b := 'hola';

    y := x;

    if (y = x) then    
        writeln(y.b);

end.