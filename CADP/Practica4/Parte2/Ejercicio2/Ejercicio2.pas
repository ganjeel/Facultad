program nombresAlumnos;

const 
    dimF = 500;
type
    nombres: array[1..dimF] of string;


    // Utilidades

    procedure incrementar(var c:integer; cantidad:integer);
    begin
        c := c + cantidad; 
    end;    

    procedure leer(n:string);
    begin
        write('Ingrese el nombre del alumno: ');
        readln(n);
    end;

    // b.

    procedure buscarAlumno(var encontrado:boolean; var pos:integer; a:nombres; dimL:integer; n:string);
    var
        pos:integer;
    begin
        pos := 1;
        encontrado := a[pos] = nombre;
        while((pos <= dimL) and (not encontrado)) do
            begin
                if (a[pos] = nombre) then
                    encontrado := true
                else
                    incrementar(pos,1);
            end;
    end;

    procedure eliminarAlumno(var alumnos:nombres; var dimL:integer; objetivo:string);
    var
        pos:integer;
    begin
        for pos := objetivo to (dimL-1) do
            alumnos[pos] := alumnos[pos+1];
        incrementar(dimL,-1); // Decrementar
    end;

    // c.

    procedure insertar(var alumnos:nombres; var dimL:integer; nombre:string; objetivo:integer);
    var
        pos:integer;
    begin
        for pos := dimL down to objetivo do
            alumnos[pos+1] := alumnos[pos];
        alumnos[objetivo] := nombre;
    end;


var
    alumnos:nombres;
    dimL, pos:integer;
    nombre:string;
    encontrado:boolean;
begin
    dimL := 0;

    // Cargar nombres
    leer(nombre);
    while ((dimL <= dimF) and (nombre <> 'ZZZ')) do
        begin
            incrementar(dimL,1);
            alumnos[dimL] := nombre;
            leer(nombre);
        end;

    // Eliminar nombre  
    leer(nombre);
    buscarAlumno(encontrado, pos, alumnos, dimL, nombre);
    if encontrado then
        eliminarAlumno(alumnos, dimL, pos);

    // Insertar nombre
    if (dimL < dimF) then
        begin
            leer(nombre);
            insertar(alumnos, dimL, nombre, 4);
        end;

    // Agregar
    if (dimL < dimF) then
        begin
            leer(nombre);
            alumnos[dimL+1] := nombre;
        end;
end;