Program ejercicio4;

Var 
    numero1, numero2: real;

Begin

    write('Ingrese un número real: ');
    readln(numero1);

    numero2 := numero1;

    while numero2 <> numero1 * 2 do
        begin
            write('Ingrese otro número real: ');
            readln(numero2);
        end;

end.