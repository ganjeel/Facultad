program ejercicio4;

var
    i,
    numero,
    primerMinimo,
    segundoMinimo
    :integer;

begin
    primerMinimo := 32676;
    segundoMinimo := 32676;

    for i:=1 to 10 do
        begin
            write('Ingrese un número: ');
            readln(numero);

            if numero < segundoMinimo then
                if numero < primerMinimo then
                    begin
                        segundoMinimo := primerMinimo;
                        primerMinimo := numero;
                    end
                else
                    segundoMinimo := numero;
        end;

        write(
            'El menor número leído es: ', primerMinimo,
            ', el segundo menor número leído es: ', segundoMinimo,
            '.'
        );

end.