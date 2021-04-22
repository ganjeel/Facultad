Program ejercicio2;
Var
    numero1, numero2, resultado: integer;
Begin
    write('Ingrese el primer número: ');
    readln(numero1);
    write('Ingrese el segundo número: ');
    readln(numero2);

    resultado := numero1 + numero2;

    writeln(
        'El resultadoado de la suma es sin utilizar otra variable es ' 
        , numero1 + numero2
    );

    writeln(
        'El resultadoado de la suma utilizando otra variable es ' 
        , resultado
    );
end.
