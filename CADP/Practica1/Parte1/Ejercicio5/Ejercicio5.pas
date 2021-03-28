Program ejercicio4;

Var 
    numero1, numero2, iteracion: real;

Begin

    write('Ingrese un número real: ');
    readln(numero1);

    numero2 := numero1;
    iteracion := 0;

    while (numero2 <> numero1 * 2) and (iteracion <> 10) do
        begin
            write('Ingrese otro número real: ');
            readln(numero2);
            iteracion := iteracion + 1
        end;

    if iteracion = 10 then
        write('No se ha ingresado el doble de ', numero1:2:2);
end.