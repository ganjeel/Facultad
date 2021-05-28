program catedra;

const
    dimF = 1000;

type
    _alumno = record
        numero :integer;
        apellido :string;
        nombre :string;
        asistencias :integer;
    end;

    _alumnos = array[1..dimF] of _alumno;


    procedure leer(var alumno:_alumno);
    begin
        write('Ingrese el código del alumno: ');
        readln(alumno.numero);
        write('Ingrese el apellido del alumno: ');
        readln(alumno.apellido);
        write('Ingrese el nombre del alumno: ');
        readln(alumno.nombre);
        write('Ingrese la cantidad de asistencias: ');
        readln(alumno.asistencias);
    end;

    function buscarAlumno(numero:integer; alumnos:_alumnos; dimL:integer):integer;
    var
        pos :integer;
    begin
        pos := 1;
        while ((pos <= dimL) and (alumnos[pos].numero <> numero)) do
            pos := pos + 1;
        buscarAlumno := pos;
    end;

    procedure insertarAlumno(var alumnos:_alumnos; var diml:integer; alumno:_alumno);
    var
        pos, i :integer;
        salir:boolean;
    begin
        pos := 1;
        salir := false;
        encontrado := false;
        while ((pos <= dimL ) and (not salir)) do
            begin
                
                if (alumnos[pos].numero >= alumno.numero) then
                    begin
                        if (dimL < dimF) then
                            begin
                                dimL := dimL + 1;
                                for i := (dimL) down to (pos+1) do
                                alumnos[i] := alumnos[i-1];
                                alumnos[pos] := alumno;
                            end;
                        salir := true;
                    end
                else
                    pos := pos + 1;
            end;
    end;

    procedure eliminarAlumnoPos(var alumnos:_alumnos; var dimL:integer; posEliminar:integer);
    var
        pos :integer;
    begin
        for pos:=posEliminar to dimL do
            alumnos[pos] := alumnos[pos+1];
        dimL := dimL - 1;
    end;

    procedure eliminarAlumnoNro(var alumnos:_alumnos; var dimL:integer; numeroEliminar:integer);
    var
        pos :integer;
        eliminado :boolean;
    begin
        pos := 1;
        eliminado := false;
        while ((pos <= dimL) and (not eliminado)) do
            begin
                if (alumnos[pos].numero = numeroEliminar) then
                    begin
                        eliminarAlumnoPos(alumnos, dimL, pos);
                        eliminado := true;
                    end
                else
                    pos := pos + 1;
            end;
    end;

    procedure eliminarAusentes(var alumnos:_alumnos; var dimL:integer);
    var
        pos :integer;
    begin
        pos := 1;

        while(pos <= dimL) do
            begin
                if (alumnos[pos].asistencias = 0) then
                    eliminarAlumnoPos(alumnos, dimL, pos)
                else
                    pos := pos + 1;
            end;
    end;
var
    alumnos :_alumnos;
    alumno :_alumno;
    dimL, pos, posEliminar, numeroEliminar :integer;
    

begin
    cargar(alumnos, dimL);  // Información ya disponible
    
    // a.
    leer(alumno);
    pos := buscarAlumno(alumno.numero, alumnos, dimL);

    // b.
    leer(alumno);
    insertarAlumno(alumnos, dimL, alumno);

    // c.
    write('Ingrese la posición: ');
    readln(posEliminar);
    eliminarAlumnoPos(alumnos, dimL, posEliminar);

    // d.
    write('Ingrese el numero de alumno a eliminar: ');
    readln(numeroEliminar);
    eliminarAlumnoNro(alumnos, dimL, numeroEliminar);

    // e.
    eliminarAusentes(alumnos, dimL);
end.