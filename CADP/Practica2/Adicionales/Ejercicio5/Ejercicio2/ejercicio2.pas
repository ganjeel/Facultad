program ejercicio2;

    procedure comprobarMaximos(
        valor, referencia :integer; 
        var valorMaxPrimero,
            valorMaxSegundo,
            referenciaMaxPrimero,
            referenciaMaxSegundo
        : integer
    );
    begin
        if valor >= valorMaxPrimero then
            begin
                referenciaMaxSegundo := referenciaMaxPrimero;
                valorMaxSegundo := valorMaxPrimero;
                referenciaMaxPrimero := referencia;
                valorMaxPrimero := valor;
            end
        else
            if valor >= valorMaxSegundo then
                begin
                    referenciaMaxSegundo := referencia;
                    valorMaxSegundo := valor;
                end;
    end;

    procedure incrementar(valor:integer);
    begin
        valor := valor + 1;
    end;

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

            incrementar(cantidadTotalAlumnos);

            write('Ingrese la condición [I/R]:');
            readln(condicion);

            for i:=1 to 5 do
            begin
                write('Ingrese la ', i,'° nota: ');
                readln(nota);
            
                if nota >= 4 then
                    begin
                        if nota = 10 then
                            incrementar(cantidadAuEvDiez);
                        incrementar(cantidadAuEvAprobadas);
                    end
                else
                    if nota = 0 then
                        incrementar(cantidadAuEvCero);

                totalNotas := totalNotas + nota;
                
            end;

            promedio := totalNotas / 5;

            if cantidadAuEvAprobadas >= 3 then
                case condicion of
                    'I': incrementar(cantidadIngresantes);
                    'R': incrementar(cantidadRecursantes);
                else
                    writeln('ERROR: No se ingresó una opción correcta.')
                end;

            if cantidadAuEvAprobadas = 5 then
                incrementar(cantidadAlumnosTodasAuEvAprobadas)
            else 
                if cantidadAuEvCero >= 1 then
                    incrementar(cantidadAlumnosConAuEvCero);
                    
            if promedio > 6.5 then
                incrementar(cantidadAlumnosPromedioAlto);

            comprobarMaximos(
                cantidadAuEvDiez,
                legajo,
                cantidadPrimerMaximo,
                cantidadSegundoMaximo,
                legajoPrimerMaximo,
                legajoSegundoMaximo
            );
            
            comprobarMaximos(
                cantidadAuEvCero,
                legajo,
                cantidadPrimerMinimo,
                cantidadSegundoMinimo,
                legajoPrimerMinimo,
                legajoSegundoMinimo
            );

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