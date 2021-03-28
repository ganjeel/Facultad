Program ejercicio9;

Var
    operacion: char;
    numero, acumulador: integer;
    error, primeraIteracion: boolean;

Begin

    numero := 1;
    acumulador := 0;
    error := false;
    primeraIteracion := true;

    write('Ingrese un carácter: [+/-] ');
    readln(operacion);

    if operacion = '+' then
        while numero <> 0 do
            begin
               write('Ingrese un número entero: ');
                readln(numero);
                acumulador := acumulador + numero; 
            end

    else
        if operacion = '-' then
            while numero <> 0 do
                begin
                    write('Ingrese un número entero: ');
                    readln(numero);
                    acumulador := acumulador - numero; 
                    if primeraIteracion then
                        begin
                            acumulador := numero;
                            primeraIteracion := false;
                        end;
                end

        else
            begin
                error := true;
                writeln('ERROR: el carácter ingresado no se puede reconocer');
            end;

    if error <> true then
        write('El resultado de la operación es: ', acumulador);
end.