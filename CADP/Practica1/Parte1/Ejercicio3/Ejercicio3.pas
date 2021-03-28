Program ejercicio3;

Var
    numero1,
    numero2,
    numero3,
    primero,
    segundo,
    tercero
    :integer;

Begin

    write('Ingrese el primer numero: ');
    readln(numero1);
    write('Ingrese el segundo numero: ');
    readln(numero2);
    write('Ingrese el tercer numero: ');
    readln(numero3);

    if numero1 >= numero2 then

        if numero1 >= numero3 then

            begin
                primero := numero1;

                if numero2 >= numero3 then
                    begin
                        segundo := numero2;
                        tercero := numero3;
                    end
                else
                    begin
                        segundo := numero3;
                        tercero := numero2; 
                    end
            end
        else

            begin 
                primero := numero3;
                segundo := numero1;
                tercero := numero2;
            end

    else
        if numero2 >= numero3 then
            begin
                primero := numero2;
                if numero1 >= numero3 then
                    begin
                        segundo := numero1;
                        tercero := numero3;
                    end
                else
                    begin
                        segundo := numero3;
                        tercero := numero1;
                    end
            end
        else
            begin
                primero := numero3;
                segundo := numero2;
                tercero := numero1;
            end;

    writeln(
        'El resultado del ordenamiento es: '
        , primero, ', '
        , segundo, ', '
        , tercero, '.'
    );
end.