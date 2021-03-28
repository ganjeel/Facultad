Program ejercicio2;

Var
    numero: real;

Begin

    write('Ingrese un número: ');
    readln(numero);

    if numero < 0 then
        numero := numero * (-1);
    
    writeln(
        'El valor absoluto del número ingresado es ', numero:2:2
    );

end.