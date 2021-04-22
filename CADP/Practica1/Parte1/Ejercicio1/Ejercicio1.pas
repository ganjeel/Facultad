Program ejercicio1;

Var
    numero1, numero2: integer;

Begin

    write('Ingrese el primer número: ');
    readln(numero1);

    write('Ingrese el segundo número: ');
    readln(numero2);

    if numero1 > numero2 then
        writeln('El primer número es el mayor.')
    else
        if numero2 > numero1 then
            writeln('El segundo número es el mayor.')
        else
            writeln('Los números leídos son iguales.');
            
end.