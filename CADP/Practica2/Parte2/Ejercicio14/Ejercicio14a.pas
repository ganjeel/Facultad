program soja;

    function determinarRendimiento(zona :integer):real;
    begin
        case zona of
            1: determinarRendimiento := 6;
            2: determinarRendimiento := 2.6;
            3: determinarRendimiento := 1.4;
        else
            begin
                writeln('La zona ingresada es incorrecta...');
                determinarRendimiento := 0;
            end
        end;
    end;

    function calcularRendimiento(hectareas, precioSoja, rendimientoPorHa :real):real;
    begin
        calcularRendimiento := hectareas * rendimientoPorHa * precioSoja;
    end;

var
    hectareas, 
    precioSoja, 
    rendimientoPorHa,
    rendimiento
    :real;
    zona :integer;

begin

    write('Ingrese la cantidad de hectareas sembradas: ');
    readln(hectareas);
    write('Ingrese tipo de zona [1, 2, 3]: ');
    readln(zona);
    write('Ingrese el precio de la soja en USD: ');
    readln(precioSoja);

    rendimientoPorHa := determinarRendimiento(zona);

    rendimiento := calcularRendimiento(hectareas, precioSoja, rendimientoPorHa);

    writeln('El rendimiento es: ', rendimiento:8:2);

end.