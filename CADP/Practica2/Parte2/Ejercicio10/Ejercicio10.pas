program ejercicio10;

    function esPar(digito:integer):boolean;
    begin
        esPar := (digito MOD 2 = 0);
    end;

    function extraerDigito(numero:integer):integer;
    begin
        extraerDigito := numero MOD 10;
    end;

    function recortarDigito(numero:integer):integer;
    begin
        recortarDigito := numero DIV 10;
    end;

    procedure recorrerDigitos(numero:integer; var cantidadImpares, sumaPares :integer);
    var
        digito :integer;
    begin
        while (numero <> 0 ) do
            begin
                digito := extraerDigito(numero);

                if (esPar(digito)) then 
                    sumaPares := sumaPares + digito
                else
                    cantidadImpares := cantidadImpares + 1;

                numero := recortarDigito(numero);
            end;
    end;

var 
    numero,
    cantidadImpares,
    sumaPares
    :integer;

begin

    write('Ingrese un numero entero: ');
    readln(numero);

    while (numero <> 12345) do
        begin
            cantidadImpares := 0;
            sumaPares := 0;

            recorrerDigitos(numero, cantidadImpares, sumaPares);

            writeln('La cantidad de digitos impares es: ', cantidadImpares);
            writeln('La suma de los digitos pares es: ', sumaPares);

            write('Ingrese un numero entero: ');
            readln(numero);
        end;
end.