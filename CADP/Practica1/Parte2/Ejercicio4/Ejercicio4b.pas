program ejercicio4b;

var
    numero,
    primerMinimo,
    segundoMinimo
    :integer;

begin
    primerMinimo := 32676;
    segundoMinimo := 32676;

    write('Ingrese un número: ');
    readln(numero);

    while (numero <> 0) do
        begin
            if numero < segundoMinimo then
                if numero < primerMinimo then
                    begin
                        segundoMinimo := primerMinimo;
                        primerMinimo := numero;
                    end
                else
                    segundoMinimo := numero;

            write('Ingrese un número: ');
            readln(numero);
        end;

    write(
        'El menor número leído es: ', primerMinimo,
        ', el segundo menor número leído es: ', segundoMinimo,
        '.'
    );
end.