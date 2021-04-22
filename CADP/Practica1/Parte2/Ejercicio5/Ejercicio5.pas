program ejercicio5

var
    numero,
    maximo,
    minimo,
    suma
    :integer;

begin
    suma := 0;
    minimo := 32767;
    maximo := -32767;

    repeat
        write('Ingrese un número: ');
        readln(numero)

        suma += numero;

        if numero < minimo then
            minimo := numero;

        if numero > maximo then
            maximo := numero;
            
    until (numero = 100);

    write(
        'La resultado de la suma de todos los números es: ', suma,
        '; el mínimo valor ingresado es: ', minimo,
        '; el máximo valor ingresado es: ', maximo,
        '.'
    );
end.