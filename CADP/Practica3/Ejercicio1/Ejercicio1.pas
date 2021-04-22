program Registros;

type
    str20 = string[20];

    alumnoDestacado = record
        nombre : str20;
        promedio : real;
    end;

    alumno = record 
        codigo : integer;
        nombre : str20;
        promedio : real;
        destacado : alumnoDestacado;
    end;

    procedure comprobarMaximo(var alu :alumno);
    begin
        if (alu.promedio >= alu.destacado.promedio)
            then
                begin
                    alu.destacado.promedio := alu.promedio;
                    alu.destacado.nombre := alu.nombre;
                end;
    end;

    procedure leer(var alu :alumno);
    begin
        writeln('Ingrese el código del alumno: ');
        readln(alu.codigo);
        if (alu.codigo <> 0 ) then
            begin
                writeln('Ingrese el nombre del alumno:');
                readln(alu.nombre);
                writeln('Ingrese el promedio del alumno: ');
                readln(alu.promedio);

                
            end;
    end;

var
    a :alumno;
    contadorAlumnos :integer;

begin

    contadorAlumnos := 0;

    leer(a);

    while ( a.codigo <> 0 ) do
        begin

            comprobarMaximo(a);

            contadorAlumnos := contadorAlumnos + 1;

            leer(a);
        end;
    
    writeln('La cantidad de alumnos leída es: ', contadorAlumnos);
    writeln('El alumno con el mayor promedio es: ', a.destacado.nombre);
end.