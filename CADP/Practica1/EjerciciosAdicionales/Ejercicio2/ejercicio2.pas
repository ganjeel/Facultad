program ejercicio2;

var
    legajo,
    cantidadTotalAlumnos,
    cantidadIngresantes,
    cantidadRecursantes,
    cantidadAuEvAprobadas,
    cantidadAuEvCero,
    cantidadAuEvDiez,
    cantidadAlumnosTodasAuEvAprobadas,
    cantidadAlumnosConAuEvCero,
    cantidadAlumnosPromedioAlto,
    legajoPrimerMaximo,
    legajoSegundoMaximo,
    legajoPrimerMinimo,
    legajoSegundoMinimo,    
    cantidadPrimerMaximo,
    cantidadSegundoMaximo,
    cantidadPrimerMinimo,
    cantidadSegundoMinimo,
    i
    :integer;

    condicion
    :char;

    nota,
    totalNotas,
    promedio
    :real;

begin

    cantidadTotalAlumnos := 0;
    cantidadIngresantes := 0;
    cantidadRecursantes := 0;
    cantidadAlumnosTodasAuEvAprobadas := 0;
    cantidadAlumnosConAuEvCero := 0;
    cantidadAlumnosPromedioAlto := 0;

    legajoPrimerMaximo := 0;
    legajoSegundoMaximo := 0;
    legajoPrimerMinimo := 0;
    legajoSegundoMinimo := 0;

    cantidadPrimerMaximo := 0;
    cantidadSegundoMaximo := 0;
    cantidadPrimerMinimo := 0;
    cantidadSegundoMinimo := 0;

    write('Ingrese el número de legajo: ');
    readln(legajo);

    while (legajo <> -1) do
        begin
            cantidadAuEvAprobadas := 0;
            cantidadAuEvCero := 0;
            cantidadAuEvDiez := 0;

            totalNotas := 0;

            cantidadTotalAlumnos := cantidadTotalAlumnos + 1;

            write('Ingrese la condición [I/R]:');
            readln(condicion);

            for i:=1 to 5 do
            begin
                write('Ingrese la ', i,'° nota: ');
                readln(nota);
            
                if nota >= 4 then
                    begin
                        if nota = 10 then
                            cantidadAuEvDiez := cantidadAuEvDiez + 1;
                        cantidadAuEvAprobadas := cantidadAuEvAprobadas + 1;
                    end
                else
                    if nota = 0 then
                        cantidadAuEvCero := cantidadAuEvCero + 1;

                totalNotas := totalNotas + nota;
                
            end;

            promedio := totalNotas / 5;

            if cantidadAuEvAprobadas >= 3 then
                case condicion of
                    'I': cantidadIngresantes := cantidadIngresantes + 1;
                    'R': cantidadRecursantes := cantidadRecursantes + 1;
                else
                    writeln('ERROR: No se ingresó una opción correcta.')
                end;

            if cantidadAuEvAprobadas = 5 then
                cantidadAlumnosTodasAuEvAprobadas := cantidadAlumnosTodasAuEvAprobadas + 1
            else 
                if cantidadAuEvCero >= 1 then
                    cantidadAlumnosConAuEvCero := cantidadAlumnosConAuEvCero + 1;
                    
            if promedio > 6.5 then
                cantidadAlumnosPromedioAlto := cantidadAlumnosPromedioAlto + 1;

            if cantidadAuEvDiez >= cantidadPrimerMaximo then
                begin
                    legajoSegundoMaximo := legajoPrimerMaximo;
                    cantidadSegundoMaximo := cantidadPrimerMaximo;
                    legajoPrimerMaximo := legajo;
                    cantidadPrimerMaximo := cantidadAuEvDiez;
                end
            else
                if cantidadAuEvDiez >= cantidadSegundoMaximo then
                    begin
                        legajoSegundoMaximo := legajo;
                        cantidadSegundoMaximo := cantidadAuEvDiez;
                    end;
            
            if cantidadAuEvCero >= cantidadPrimerMinimo then
                begin
                    legajoSegundoMinimo := legajoPrimerMinimo;
                    cantidadSegundoMinimo := cantidadPrimerMinimo;
                    legajoPrimerMinimo := legajo;
                    cantidadPrimerMinimo := cantidadAuEvCero;
                end
            else
                if cantidadAuEvCero >= cantidadSegundoMinimo then
                    begin
                        legajoSegundoMinimo := legajo; 
                        cantidadSegundoMinimo := cantidadAuEvCero;
                    end;

            write('Ingrese el número de legajo: ');
            readln(legajo);
        end;

    writeln(
        'La cantidad de alumnos INGRESANTES que rinden el parcial es: ', cantidadIngresantes
    );
    writeln(
        'La cantidad de alumnos RECURSANTES que rinden el parcial es: ', cantidadRecursantes
    );
    writeln(
        'La cantidad de alumnos que aprobaron todas las autoevaluaciones es: ', cantidadAlumnosTodasAuEvAprobadas
    );
    writeln(
        'La cantidad de alumnos cuya nota promedio fue mayor a 6.5 es: ', cantidadAlumnosPromedioAlto
    );
    writeln(
        'La cantidad de alumnos que obtuvieron cero en almenos una autoevaluacion es: ', cantidadAlumnosConAuEvCero
    );
    writeln(
        'El alumno que obtuvo la mayor cantidad de autoevaluaciones con 10 es: ', legajoPrimerMaximo,
        ' ; y el alumno que obtuvo la segunda mayor cantidad es: ', legajoSegundoMaximo
    );
    writeln(
        'El alumno que obtuvo la mayor cantidad de autoevaluaciones con 0 es: ', legajoPrimerMinimo,
        ' ; y el alumno que obtuvo la segunda mayor cantidad es: ', legajoSegundoMinimo
    );

end.