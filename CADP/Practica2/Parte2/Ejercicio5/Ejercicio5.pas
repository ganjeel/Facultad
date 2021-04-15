program ejercicio5;

    procedure incrementarUno(var cantidad :integer);
    begin
        cantidad := cantidad + 1;
    end;

    function esParDoble(numeroA, numeroB :integer) : boolean;
    begin
        esParDoble := ( numeroB = (numeroA * 2) );
    end;

    function esParCeros(numeroA, numeroB :integer) : boolean;
    begin
        esParCeros := (numeroA = 0) and (numeroB = 0);
    end;

var

    numeroA,
    numeroB,
    cantidadTotal,
    cantidadDobles
    : integer;

begin

    cantidadTotal := 0;
    cantidadDobles := 0;

    write('Ingrese el primer número:');
    readln(numeroA);
    write('Ingrese el segundo número: ');
    readln(numeroB);

    while (not esParCeros(numeroA, numeroB)) do
        begin

            incrementarUno(cantidadTotal);

            if (esParDoble(numeroA, numeroB)) then
                incrementarUno(cantidadDobles);

            write('Ingrese el primer número:');
            readln(numeroA);
            write('Ingrese el segundo número: ');
            readln(numeroB);
            
        end;


    writeln('La cantidad total de pares es: ', cantidadTotal);
    writeln('La cantidad de pares en los que el numero B es el doble del A es: ', cantidadDobles);

end.