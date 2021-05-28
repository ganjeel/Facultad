program alumnosUNLP;


const
    dimF = 400;


type
    alumno = record
        inscripcion :integer;
        dni :integer;
        apellido :string;
        nombre :string;
        anio :integer;
    end;

    maximos = record
        primero :alumno;
        segundo :alumno;
    end;
    
    alumnos = array [1..dimF] of alumno;


    procedure leerAlumno(var a:alumno);
    begin
        write('Ingrese el nro de inscripción del alumno: ');
        readln(a.inscripcion);
        write('Ingrese el apellido del alumno: ');
        readln(a.apellido);
        write('Ingrese el nombre del alumno: ');
        readln(a.nombre);
        write('Ingrese el año de nacimiento del alumno: ');
        readln(a.anio);
    end;

    function comprobarDigPar(dni:integer):boolean;
    var
        digito :integer;
        cumple :boolean;
    begin
        cumple := true;

        repeat
            digito := dni MOD 10;
            dni := dni DIV 10;
            if (digito MOD 2 <> 0) then
                cumple := false;
        until (dni = 0);

        comprobarDigPar := cumple;
    end;

    procedure actualizarMaximo(var m:alumno; mNuevo:alumno);
    begin
        m.nombre := mNuevo.nombre;
        m.apellido := mNuevo.apellido;
        m.anio := mNuevo.anio;
    end;
    

var
    i, dimL, cantidadAlumnosPar :integer;
    porcentajeAlumnosPar :real;
    a :alumnos;
    aActual :alumno;
    m :maximos;

begin
    m.primero.anio := 2021;
    m.segundo.anio := 2021;
    cantidadAlumnosPar := 0;
    dimL := 0;
    i := 1;

    // Cargar alumnos
    leerAlumno(aActual);
    a[i] := aActual;
    while((a[i].dni <> -1) and (i<dimF)) do
        begin
            dimL := dimL + 1;
            leerAlumno(aActual);
            a[i] := aActual;
        end;

    // Procesar alumnos
    for i:=1 to dimL do
        begin
            // Digitos pares
            if (comprobarDigPar(a[i].dni)) then
                cantidadAlumnosPar := cantidadAlumnosPar + 1;
            
            // Maximos edades
            if (a[i].anio < m.primero.anio) then
                begin
                    actualizarMaximo(m.segundo, m.primero); // Guardo el primer maximo en el segundo
                    actualizarMaximo(m.primero, a[i]);  // Actualizo el primer máximo
                end
            else
                if (a[i].anio < m.segundo.anio) then
                    actualizarMaximo(m.segundo, a[i]);  // Actualizo el segundo máximo

        end;
    porcentajeAlumnosPar := cantidadAlumnosPar / dimL;

    writeln(
        'El porcentaje de alumnos con DNI compuesto solo por dígitos pares es: ', 
        porcentajeAlumnosPar
    );
    writeln(
        'Los dos alumnos de mayor edad son: ', 
        m.primero.nombre, ' ', m.primero.apellido, ' y ',
        m.segundo.nombre, ' ', m.segundo.apellido, '.'
    );
end.