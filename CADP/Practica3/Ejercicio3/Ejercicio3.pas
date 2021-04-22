program educacion;

const DATO_UNESCO = 23.435;

type
    establecimiento = record
        cue :integer;
        nombre :string;
        cantidadDocentes: integer;
        cantidadAlumnos :integer;
        localidad :string;
        relacion :real;
    end;

    pico = record
        valor :real;
        nombre :string;
        cue: integer;
    end;

    minimos = record
        primero : pico;
        segundo : pico;
    end;

    procedure incrementar(var cantidad :integer);
    begin
        cantidad := cantidad + 1;
    end;

    procedure leer(var escuela :establecimiento);
    begin
        write('Ingrese el CUE: ');
        readln(escuela.cue);
        write('Ingrese el nombre del establecimiento: ');
        readln(escuela.nombre);
        write('Ingrese la cantidad de docentes: ');
        readln(escuela.cantidadDocentes);
        write('Ingrese la cantidad de alumnos: ');
        readln(escuela.cantidadAlumnos);
        write('Ingrese la localidad: ');
        readln(escuela.localidad);
    end;

    procedure relacion(var escuela :establecimiento);
    begin
        escuela.relacion := escuela.cantidadAlumnos / escuela.cantidadDocentes;
    end;

    function comprobarCondicion(escuela :establecimiento):boolean;
        function esLaPlata(localidad:string):boolean;
        begin
            esLaPlata := localidad = 'La Pata'
        end;
        function mayorUnesco(relacion :real):boolean;
        begin
            mayorUnesco := relacion > DATO_UNESCO;
        end;
    begin
        comprobarCondicion := (esLaPlata(escuela.localidad)) and ( mayorUnesco(escuela.relacion));
    end;

    procedure comprobarMinimos(escuela :establecimiento; var actuales :minimos);
    begin
        if (escuela.relacion <= actuales.primero.valor) then
            begin
                actuales.segundo.valor := actuales.primero.valor;
                actuales.segundo.nombre := actuales.primero.nombre;
                actuales.segundo.cue := actuales.primero.cue;
                actuales.primero.valor := escuela.relacion;
                actuales.primero.nombre := escuela.nombre;
                actuales.primero.cue := escuela.cue;
            end
        else
            if (escuela.relacion <= actuales.segundo.valor) then
                begin
                    actuales.segundo.valor := escuela.relacion;
                    actuales.segundo.nombre := escuela.nombre;
                    actuales.segundo.cue := escuela.cue;
                end;
    end;

var
    escuela :establecimiento;
    minimosActuales :minimos;
    i, contadorEscuelasCond:integer;

begin
    contadorEscuelasCond := 0;

    for i:=1 to 2400 do
        begin
            leer(escuela);

            relacion(escuela);

            if (comprobarCondicion(escuela)) then
                incrementar(contadorEscuelasCond);

            comprobarMinimos(escuela, minimosActuales);
        end;

    writeln('La cantidad de escuelas de La Plata con relación alumnos/docentes superior a la sugerida por UNESCO es: ', contadorEscuelasCond);    
    writeln('Las mejores dos escuelas son:');
    writeln('-Escuela: ', minimosActuales.primero.nombre, ' - CUE: ', minimosActuales.primero.cue); 
    writeln('-Escuela: ', minimosActuales.segundo.nombre, ' - CUE: ', minimosActuales.segundo.cue); 

end.