program ejercicio3;

const
    DETENCION = 'ZidaneZinedine';

var
    nombre :string;

    nota,
    regulares,
    aprobados
    :integer;

begin
    regulares := 0;
    aprobados := 0;

    repeat
        write('Ingrese el nombre del estudiante: ');
        readln(nombre);
        write('Ingrese la nota del estudiante: ');
        readln(nota);

        if (nota >= 7) then
            begin
                regulares += 1;
                if ( nota >=8 ) then
                    aprobados += 1;
            end;

    until (nombre = DETENCION);

    write(
        'La cantidad de estudiantes aprobados es ', aprobados,
        ' y la cantidad de estudiantes con nota mayor a 7 es ', regulares,
        '.'
    );
end.