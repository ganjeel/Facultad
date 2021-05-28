program videojuegos;

type

    _dispositivos = ^_nodoD;

    _nodoD = record
        data:_dispositivo;
        siguiente:_dispositivos;
    end;

    _dispositivo = record
        version:string;
        display:real;
        ram:integer;
    end;

    _versiones = ^_nodoV;

    _nodoV = record
        data:_version;
        siguiente:_versiones;
    end;

    _version = record 
        version:string;
        cantidad:integer;
        siguiente:_versiones;
    end;

    procedure incrementar (var cantidad);
    begin
        cantidad := cantidad + 1;
    end;

    procedure comprobarVersion(var versiones:_versiones; version:string);
    var
        nueva, aux:_versiones;
    begin
        new(nueva);
        nueva^.version := version;
        nueva^.cantidad := 0;
        nueva^.siguiente := nil;

        if (versiones = nil) then
            versiones := nueva
        else
            begin
                aux := versiones;
                while((aux^.siguiente <> nil) and (aux^.data.version <> version)) do
                    aux := aux^.siguiente;
                if (aux^.data.version <> version) then
                    begin
                        aux^.siguiente := nueva;
                        aux := aux^.siguiente;
                    end;
                incrementar(aux^.data.cantidad);
            end;
    end;

var
    dispositivos, auxd:_dispositivos;
    versiones, auxv:_versiones;
    cantidadCondB, cantidadDispositivos:integer;
    tamanoPromedio, tamanoAcumulado:real;

begin
    cargarDispositivos(dispositivos); // Simulo la carga

    cantidadCondB := 0;
    cantidadDispositivos := 0;
    tamanoAcumulado := 0;
    tamanoPromedio := 0;

    new(auxd);
    auxd := dispositivos;

    while(auxd <> nil) do
        begin
            // a)
            comprobarVersion(versiones, auxd^.data.version);
            // b)
            if ((auxd^.data.ram > 3) and (auxd^.data.display >= 5)) then
                incrementar(cantidadCondB);
            // c)
            incrementar(cantidadDispositivos);
            tamanoAcumulado := tamanoAcumulado + auxd^.data.display;

            auxd := auxd^.siguiente;
        end;

    tamanoPromedio := tamanoAcumulado/cantidadDispositivos;

    new(auxv);
    auxv := versiones;

    while(auxv <> nil) do
        begin
            writeln(
                'La cantidad de dispositivos para la versión ', 
                auxv^.data.version, 
                ' es: ', 
                auxv^.data.cantidad;
            );
            auxv := auxv^.siguiente;
        end;

    writeln(
        'La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas es: ',
        cantidadCondB,
        '.'
    );

    writeln(
        'El tamaño promedio de los dispositivos es: ',
        tamanoPromedio:4:2
    );

end.