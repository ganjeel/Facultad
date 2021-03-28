Program ejercicio3;
Var
    numero1, numero2, resultado : real;

Begin
    write('Ingrese el primer número: ');
    readln(numero1);
    write('Ingrese el segundo número: ');
    readln(numero2);

    resultado:= numero1/numero2;

    writeln(
        'El resultadoado de dividir ', numero1:2:1, 
        ' por ', numero2:2:1, 
        ' es: ', resultado:2:2, 
        '.'
    );
end.