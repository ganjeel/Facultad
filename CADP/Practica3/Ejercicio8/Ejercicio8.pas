program memoria;

type

    docente = record
        dni :integer;
        nombre :string;
        apellido :string;
        email :string;
    end;

    escuela = record
        nombre :string;
        cantidadAlumnos :integer;
    end;

    proyecto = record
        codigo :integer;
        titulo :string;
        docente :docente;
        escuela :escuela;
        localidad :string;
    end;

    localidad = record
        nombre :string;
        cantidadEscuelas :integer;
    end;

    maximos = record
        primero :escuela;
        segundo :escuela;
    end;

    // Utilidades
    procedure incrementar(var c:integer);
    begin
        c := c + 1;
    end;

    // Lectura de datos
    procedure leerProyecto(var p:proyecto);
    begin
        write('Ingrese el código del proyecto: ');
        readln(p.codigo);
        write('Ingrese el título: ');
        readln(p.titulo);
        write('Ingrese el dni del docente: ');
        readln(p.docente.dni);
        write('Ingrese el nombre del docente : ');
        readln(p.docente.nombre);
        write('Ingrese el apellido del docente : ');
        readln(p.docente.apellido);
        write('Ingrese el email del docente : ');
        readln(p.docente.email);
        write('Ingrese la cantidad de alumnos: ');
        readln(p.escuela.cantidadAlumnos);
        write('Ingrese el nombre de la escuela: ');
        readln(p.escuela.nombre);
        write('Ingrese la localidad: ');
        readln(p.localidad);
    end;

    // Cond 1-2
    function mismaLocalidad(ref, val:string):boolean;
    begin
        mismaLocalidad := ref = val;
    end;

    procedure reiniciarLocalidad(var l:localidad; lNueva:string);
    begin
        l.nombre := lNueva;
        l.cantidadEscuelas := 0;
    end;

    procedure informarEscuelasEnLocalidad(l:localidad);
    begin   
        writeln(
            'La cantidad de escuelas en la localidad ', l.nombre, 
            ' es: ', l.cantidadEscuelas,
            '.'
        );
    end;

    // Cond 2
    procedure comprobarMaximos(var m:maximos; e:escuela);
    begin
        if (e.cantidadAlumnos >= m.primero.cantidadAlumnos) then
            begin
                m.segundo.nombre := m.primero.nombre;
                m.segundo.cantidadAlumnos := m.primero.cantidadAlumnos;
                m.primero.nombre := e.nombre;
                m.primero.cantidadAlumnos := e.cantidadAlumnos;
            end
        else
            if (e.cantidadAlumnos >= m.segundo.cantidadAlumnos) then
                begin
                    m.segundo.nombre := e.nombre;
                    m.segundo.cantidadAlumnos := e.cantidadAlumnos;
                end;
    end;

    // Cond 3
    procedure comprobarCond3(p :proyecto);
        function mismosDigitos(codigo :integer):boolean;
            var
                pares, impares :integer;
            begin
                pares := 0;
                impares := 0;

                while (codigo <> 0) do
                    begin 
                        if (codigo MOD 2 = 0) then
                            incrementar(pares)
                        else
                            incrementar(impares);
                        
                        codigo := codigo DIV 10;
                    end;
                mismosDigitos := pares = impares;
            end;
    begin
        if ((p.localidad = 'Daireaux') and mismosDigitos(p.codigo)) then
            begin
                writeln(
                    'El proyecto ', p.titulo, 
                    ' de la localidad de Daireaux tiene un código con igual',
                    ' cantidad de dígitos pares e impares.'    
                );
            end;
    end;

var

    p :proyecto;
    lActual :localidad;
    m:maximos;
    cantidadEscuelas :integer;

begin
    lActual.cantidadEscuelas := 0;
    cantidadEscuelas := 0;

    m.primero.nombre := ' ';
    m.primero.cantidadAlumnos := 0;
    m.segundo.nombre := ' ';
    m.segundo.cantidadAlumnos := 0;

    leerProyecto(p);
    reiniciarLocalidad(lActual, p.localidad);   // Inicialización del registro

    while (p.codigo <> -1) do // Condición de finalización
        begin
            if (not mismaLocalidad(lActual.nombre, p.localidad)) then   // Cambio de localidad
                begin
                    informarEscuelasEnLocalidad(lActual);   // Cumple cond1-2
                    reiniciarLocalidad(lActual, p.localidad);   // Limpia el registro para el nuevo valor
                end;

            incrementar(cantidadEscuelas);

            comprobarMaximos(m, p.escuela); // Cumple cond 2

            comprobarCond3(p);  // Cumple cond 3

            leerProyecto(p);
        end;
    

    writeln('La cantidad de escuelas que participan es: ', cantidadEscuelas);
    writeln(
        'Las escuelas con mayor cantidad de alumnos participantes son: ', m.primero.nombre, 
        ' y ', m.segundo.nombre, 
        '.'
    );
end.