program pares;

    function esMayor(numero1, numero2 :integer):boolean;
    begin
        esMayor := numero1 < numero2;
    end;

    procedure invertir(var numero1, numero2 :integer);
    var
        aux :integer;
    begin
        aux := numero1;
        numero1 := numero2;
        numero2 := aux;
    end;

    procedure calcular(desde, hasta :integer; var producto, suma :integer);
    var
        i :integer;
    begin
        for i := desde to hasta do
            begin
                suma := suma + i;
                producto := producto * i;
            end;
    end;

var 
    i, numeroX, numeroY, producto, suma: integer;

begin
    for i := 1 to 10 do
        suma := 0;
        producto := 1;

        begin
            write('Ingrese el primer número: ');
            readln(numeroX);
            write('Ingrese el segundo número: ');
            readln(numeroY);

            if esMayor(numeroX, numeroY) then
                invertir(numeroX, numeroY);
            
            calcular(numeroX, numeroY, producto, suma);

            writeln('La suma es ', suma);
            writeln('El producto es ', producto);
        end; 
end.