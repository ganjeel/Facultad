program elecciones;

type
    _intendente = record
        localidad :string;
        apellido : string;
        votos :integer;
        votantes :integer;
    end;

    _max = record
        apellido :string;
        votos :integer;
        porcentaje :real;
    end;

    procedure leer(var intendente:_intendente);
    begin
        with intendente do
            begin
                write('Ingrese la localidad: ');
                readln(localidad);
                write('Ingrese el apellido: ');
                readln(apellido);
                write('Ingrese la cantidad de votos: ');
                readln(votos);
                write('Ingrese la cantidad de votantes: ');
                readln(votantes);
            end;
    end;

    procedure comprobarVotos(var max:_max; intendente:_intendente);
    begin
        if (intendente.votos >= max.votos) then
            with intendente do
                begin
                    max.apellido := apellido;
                    max.votos := votos;
                end;
    end;    

    procedure comprobarPorcentaje(var max:_max; intendente:_intendente);
        function calcularPorcentaje(votos, votantes:integer):real;
        begin
            calcularPorcentaje := votos / votantes;
        end;
    var
        porcentaje :real;
    begin
        with intendente do
            begin
                porcentaje := calcularPorcentaje(votos, votantes);
                if (porcentaje >= max.porcentaje) then
                    begin
                        max.apellido := apellido;
                        max.porcentaje := porcentaje;
                    end;
            end;
    end;

var
    intendente :_intendente;
    maxVotos,maxPorcentaje :_max;

begin

    maxVotos.votos := 0;
    maxPorcentaje.porcentaje := 0;
    
    repeat
        leer(intendente); // Registro datos

        comprobarVotos(maxVotos, intendente); // Cumple cond1
        comprobarPorcentaje(maxPorcentaje, intendente); // Cumple cond2


    until (intendente.localidad = 'Zárate');

    writeln(
        'El intendente ', maxVotos.apellido, 
        ' obtuvo la mayor cantidad de votos con ', 
        maxVotos.votos, ' votos.'
    );
    
    writeln(
        'El intendente ', maxPorcentaje.apellido,
        ' obtuvo el mayor porcentaje de votos con ',
        maxPorcentaje.porcentaje, '%.'
    );

end.