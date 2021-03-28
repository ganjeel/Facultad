program ejercicio4a;

var
    numero,
    primerMinimo,
    segundoMinimo
    :integer;

begin
    primerMinimo := 32676;
    segundoMinimo := 32676;

    repeat
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

    until (numero = 0);

    write(
    'El menor número leído es: ', primerMinimo,
    ', el segundo menor número leído es: ', segundoMinimo,
    '.'
    );

end.