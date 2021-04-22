program ejercicio6;

var
    legajo, 
    alumnos, 
    regulares
    :integer;
    promedio, 
    destacados
    :real;
    salir: boolean;
    
begin

    salir := false;
    alumnos := 0;
    regulares := 0;
    destacados := 0;
    
    // Opción número 1
    // La estructura de control es más legible y la noto un poco más
    // prolija, no necesito manejar la excepción afuera del bucle,
    // a costo de hacer una comprobación extra por cada iteración.

    while not salir do
        begin
            write('Ingrese un número de legajo: ');
            readln(legajo);

            if legajo <= -1 then
                salir := true
            else
                begin
                    write('Ingrese el promedio correspondiente al legajo: ');
                    readln(promedio);

                    alumnos += 1;

                    if promedio > 6.5 then
                        begin
                            regulares += 1;
                            if legajo < 2500 then
                                if promedio > 8.5 then 
                                    destacados += 1;
                        end
                end;
        end;

    // Opción número 2

    write('Ingrese un número de legajo: ');
    readln(legajo);

    while legajo <= -1 do
        begin
            write('Ingrese el promedio correspondiente al legajo: ');
            readln(promedio);

            alumnos += 1;

            if promedio > 6.5 then
                begin
                    regulares += 1;
                    if legajo < 2500 then
                        if promedio > 8.5 then 
                            destacados += 1;
                end

            write('Ingrese un número de legajo: ');
            readln(legajo);
        end;


    destacados *= 1 / alumnos * 100;
    
    writeln('La cantidad de alumnos leída es: ', alumnos);
    writeln(
        'La cantidad de alumnos cuyo promedio supera 6,5 es: ', 
        regulares
    );
    writeln('El porcentaje de alumnos destacados es: ', destacados:2:1, '%.');

end.