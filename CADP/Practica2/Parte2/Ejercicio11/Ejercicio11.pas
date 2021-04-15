program ejercicio11;

    function esMayor(numero, referencia :integer):boolean;
    begin
        esMayor := numero >= referencia;
    end;

    function esMenor(numero, referencia:integer):boolean;
    begin
        esMenor := numero <= referencia;
    end;

    function esPar(numero: integer):boolean;
    begin
        esPar := (numero MOD 2 = 0);
    end;

    procedure incrementar(var numero:integer);
    begin
        numero := numero + 1;
    end;

    procedure contardorPares(numero :integer; var cantidadPares :integer);
    begin
        if (esPar(numero)) then
            incrementar(cantidadPares);
    end;

    procedure nuevoPico(
        var picoActual, picoNuevo :integer; 
        var referenciaActual, referenciaNueva :string
    );
    begin
        picoActual := picoNuevo;
        referenciaActual := referenciaNueva;
    end;

    procedure calcularMinimos(
        inscripcion :integer;
        apellido :string; 
        var inscripcionMinimoPrimero, inscripcionMinimoSegundo :integer;
        var apellidoInscMinimoPrimero, apellidoInscMinimoSegundo :string
    );
    begin
        if (esMenor(inscripcion, inscripcionMinimoPrimero)) then
            begin
                nuevoPico(
                    inscripcionMinimoSegundo, inscripcionMinimoPrimero,
                    apellidoInscMinimoSegundo, apellidoInscMinimoPrimero 
                );
                nuevoPico(
                    inscripcionMinimoPrimero, inscripcion,
                    apellidoInscMinimoPrimero, apellido
                );
            end
        else 
            if (esMenor(inscripcion, inscripcionMinimoSegundo)) then
                nuevoPico(
                    inscripcionMinimoSegundo, inscripcion,
                    apellidoInscMinimoSegundo, apellido
                );
    end;

    procedure calcularMaximos(
        inscripcion:integer;
        nombre:string;
        var inscripcionMaximoPrimero, inscripcionMaximoSegundo :integer;
        var nombreInscMaximoPrimero, nombreInscMaximoSegundo :string
    );
    begin
        if (esMayor(inscripcion, inscripcionMaximoPrimero)) then
            begin
                nuevoPico(
                    inscripcionMaximoSegundo, inscripcionMaximoPrimero,
                    nombreInscMaximoSegundo, nombreInscMaximoPrimero
                );
                nuevoPico(
                    inscripcionMaximoPrimero, inscripcion,
                    nombreInscMaximoPrimero, nombre
                );
            end
        else
            if (esMayor(inscripcion, inscripcionMaximoSegundo)) then
                nuevoPico(
                    inscripcionMaximoSegundo, inscripcion,
                    nombreInscMaximoSegundo, nombre
                );
    end;

var
    inscripcion,
    inscripcionMinimoPrimero,
    inscripcionMinimoSegundo,
    inscripcionMaximoPrimero,
    inscripcionMaximoSegundo,
    cantidadTotal,
    cantidadPares
    :integer;

    apellido,
    apellidoInscMinimoPrimero,
    apellidoInscMinimoSegundo,
    nombre,
    nombreInscMaximoPrimero,
    nombreInscMaximoSegundo
    :string;

begin

    inscripcionMinimoPrimero := 0;
    inscripcionMinimoSegundo := 0;
    inscripcionMaximoPrimero := 0;
    inscripcionMaximoSegundo := 0;
    apellidoInscMinimoPrimero := '';
    apellidoInscMinimoSegundo := '';
    nombreInscMaximoPrimero := '';
    nombreInscMaximoSegundo := '';
    cantidadTotal := 0;
    cantidadPares := 0;

    repeat
        
        write('Ingrese el numero de inscripcion del alumno: ');
        readln(inscripcion);
        write('Ingrese el apellido: ');
        readln(apellido);
        write('Ingrese el nombre: ');
        readln(nombre);

        incrementar(cantidadTotal);
        contardorPares(inscripcion, cantidadPares);

        calcularMinimos(
            inscripcion,
            apellido,
            inscripcionMinimoPrimero,
            inscripcionMinimoSegundo,
            apellidoInscMinimoPrimero,
            apellidoInscMinimoSegundo
        );

        calcularMaximos(
            inscripcion,
            nombre,
            inscripcionMaximoPrimero,
            inscripcionMaximoSegundo,
            nombreInscMaximoPrimero,
            nombreInscMaximoSegundo
        );

    until (inscripcion <> 1200);

    writeln('El alumno con el nuemero de inscripcion mas grande es: ', inscripcionMaximoPrimero);
    writeln('El alumno con el segundo numero de inscripcion mas grande es: ', inscripcionMaximoPrimero);
    writeln('El alumno con el numero de inscripcion mas chico es: ', inscripcionMinimoPrimero);
    writeln('El alumno con el segundo numero de inscripcion mas chico es: ', inscripcionMinimoSegundo);
    writeln('El procentaje de alumnos con nro de inscripcion par es: ', (cantidadPares/cantidadTotal)*100, '%');

end.