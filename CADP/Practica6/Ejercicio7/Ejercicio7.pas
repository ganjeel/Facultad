program esa;

type

    _sondas = ^nodo;

    nodo = record
        data:_sonda;
        sig:_sondas;

    _sonda = record 
        nombre:string;
        duracion:real;
        costoConstruccion:real;
        costoMantenimiento:real;
        rangoEM:1..7;
    end;

    _maximo = record
        costoTotal: real;
        nombre:string;
    end;
    
    _estudios = array[1..7] of integer;

    procedure incrementar(var cantidad:integer);
    begin
        cantidad := cantidad + 1;
    end;

    function calcularCostoTotal(sonda:_sonda):real;
    begin
        calcularCostoTotal := sonda.costoConstruccion + sonda.costoMantenimiento;
    end;

    procedure leerSonda(var sonda:_sonda);
    begin
        write('Ingrese el nombre de la sonda: ');
        readln(sonda.nombre);
        write('Ingrese la duración de la misión: ');
        readln(sonda.duracion);
        write('Ingrese el costo de construcción: ');
        readln(sonda.costoConstruccion);
        write('Ingrese el costo de mantenimento: ');
        readln(sonda.costoMantenimiento);
    end;

    procedure cargarSondas(sondas:_sondas; var ultima:_sondas; var duracionPromedio, costoPromedio :real);
    var
        aux:_sondas;
        sonda:_sonda;
        cantidad:integer;
    begin
        cantidad := 0;
        repeat
            leerSonda(sonda);
            duracionPromedio := duracionPromedio + sonda.duracion;
            costoPromedio := costoPromedio + calcularCostoTotal(sonda);
            incrementar(cantidad);

            new(aux);
            aux^.data := sonda;
            aux^.sig := nil;
            sondas^.siguiente := aux;
            sondas := aux;
        until(sonda.nombre = 'GAIA');
        duracionPromedio := duracionPromedio / cantidad;
        costoPromedio := costoPromedio / cantidad;
        ultima := sondas;
    end;

    procedure comprobarMaximo(var maximo:_maximo, sonda:_sonda);
    var
        costoTotal:real;
    begin
    costoTotal := calcularCostoTotal(sonda);
        if (costoTotal >= maximo.costoTotal) then
            begin
                maximo.costoTotal := costoTotal;
                maximo.nombre := sonda.nombre;
            end;
    end;

    // EJERCICIO 7

    function comprobarRequerimientos(sonda:_sonda):boolean;
    begin
        comprobarRequerimientos := (
            (sonda.costoMantenimiento < sonda.costoConstruccion) 
            and (sonda.rangoEM <> 1)
        );
    end;

    procedure filtrar(var cumplen, noCumplen:_sondas; sondas:_sondas);
    var
        priC, priNC:_sondas;
    begin
        new(priC);
        new(priNC);
        while (sondas <> nil) do
            begin
                if (comprobarRequerimientos(sondas.data)) then
                    begin
                        priC := cumplen;
                        cumplen^.data := sondas^.data;
                        cumplen := cumplen^.sig;
                    end
                else
                    begin
                        priNC := noCumplen;
                        noCumplen^.data := sondas^.data;
                        noCumplen := noCumplen^.sig;
                    end;
                sondas := sondas^.sig;
            end;
        cumplen := priC;
        noCumplen := priNC;
    end;

    function calcularCostoPrivados(noCumplen:_sondas):integer;
    var
        costoTotal:integer;
    begin
        while (noCumplen <> nil) do
            begin
                costoTotal := calcularCostoTotal(noCumplen^.data);
                noCumplen := noCumplen^.sig;
            end;
    end;

    // EJERCICIO 7

var
    sondas, ultima:_sondas;
    masCostosa:_maximo;
    cantidadEstudios:_estudios;
    i, cantidadDuracionProm, cantidadCostoProm:integer;
    duracionPromedio, costoPromedio :real;
begin
    for i:=1 to 7 do
        cantidadEstudios[i] := 0;
    duracionPromedio := 0;
    costoPromedio := 0;
    maximo.costoTotal := 0;
    cantidadDuracionProm := 0;
    cantidadCostoProm := 0;

    cargarSondas(sondas, ultima, duracionPromedio, costoPromedio);

    while (sondas <> nil) do
        begin
            comprobarMaximo(maximo, sondas^.data);
            incrementar(cantidadEstudios[sodas^.data.rangoEM]);
            
            if (sondas^.data.duracion > duracionPromedio) then
                incrementar(cantidadDuracionProm);
            
            if (calcularCostoTotal(sondas^.data) > costoPromedio) then
                writeln('La sonda ', sondas^.data.nombre, ' supera el costo promedio.');
        end;

    writeln('La sonda más costosa es: ', maximo.nombre, '.');
    writeln('La cantidad de sondas que realizarán estudios para cada rango del espectro es: ')
    for i:=1 to 7 do
        writeln(i, ':       ', cantidadEstudios[i] );
    wirteln('La cantidad de sondas cuya duración supera el promedio es: ', cantidadDuracionProm);
end.