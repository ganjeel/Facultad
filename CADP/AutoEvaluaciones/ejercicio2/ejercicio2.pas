program autoevaluacion;

var
    indice, letra  : char;
    cant : integer;

begin
    writeln('Ingrese una letra: '); 
    readln(letra);

    cant := 0;

    for indice := 'a' to letra do
        cant := cant + 2;

    writeln(cant);

end.