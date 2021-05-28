program canonical;

const
    dimF = 10000;

type
    _computadora = record
        codigo:integer;
        version:string;
        paquetes:integer;
        usuarios:integer;
    end;

    _computadoras = array[1..dimF] of _computadora;


    procedure leer(var computadora:_computadora);
    begin
        write('Ingrese el código de la computadora: ');
        readln(computadora.codigo);
        write('Ingrese la versión del os: ');
        readln(computadora.version);
        write('Ingrese la cantidad de paquetes: ');
        readln(computadora.paquetes);
        write('Ingrese la cantidad de usuarios: ');
        readln(computadora.usuarios);
    end;
    
    function buscarPosicion(computadora:_computadora ;computadoras:_computadoras; dimL:integer):integer;
    var
        encontrado :boolean;
        mitad, min, max:integer;
    begin
        encontrado := false;
        min := 1;
        max := dimL;
        mitad := (min + max) div 2;

        while((min <= max) and (not encontrado)) do
            begin
                if (computadora.codigo < computadora[mitad].codigo) then
                    max := mitad - 1
                else
                    if (computadora.codigo > computadoras[mitad].codigo) then
                        min := mitad + 1
                    else
                        encontrado := true;
            end;

        buscarPosicion := mitad;
    end;

    procedure cargarOrdenado(var computadoras:_computadoras; var dimL:integer);
    var
        computadora:_computadora;
    begin
        leer(computadora);

        while((dimL <= dimF) and (computadora.codigo <> -1)) do
            begin
                pos := buscarPosicion(computadora, computadoras, dimL);
                insertar(computadoras, dimL, computadora, pos);

                leer(computadora);
            end;
    end;

    procedure insertar(var computadoras:_computadoras; var dimL:integer; computadora:_computadora; objetivo:integer);
    var
        pos:integer;
    begin
        for pos:=dimL down to objetivo do
            computadoras[pos+1] := computadoras[pos];
        computadoras[objetivo] := computadora;
        dimL := dimL + 1;
    end;

    procedure eliminar(var computadoras:_computadoras; var dimL:integer; objetivo:integer);
    var
        pos:integer;
    begin
        for pos:=objetivo to dimL do
            computadoras[pos] := computadoras[pos + 1];
        dimL := dimL - 1;
    end;

var
    computadoras:_computadoras;
    computadora, maximo:_computadora;
    dimL, pos, cantidadVersiones:integer;
    promedioUsuarios :real;

begin
    dimL := 1;
    
    cargarOrdenado(computadoras, dimL);

    cantidadVersiones := 0;
    promedioUsuarios := 0;
    maximo.cantidad := 0;

    for pos := 1 to dimL do
        begin
            // a)
            if ((computadora.version = '18.04') or (computadora.version = '16.04')) then
                cantidadVersiones := cantidadVersiones + 1;
            // b)
            promedioUsuarios := computadoras[pos].usuarios;
            // c)
            if (computadoras[pos].paquetes >= maximo.cantidad) then
                begin
                    maximo.cantidad := computadoras[pos].paquetes;
                    maximo.version := computadoras[pos].version;
                end;
            // d)
            if ((computadoras[pos].codigo >= 0) and (computadoras[pos].codigo <= 500)) then
                eliminar(computadoras, dimL, pos);
        end;
end.