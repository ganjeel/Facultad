program aerolinea;

type
    _vuelo = record
        codigo :integer;
        salida :string;
        llegada :string;
        distancia :integer;
        ocupacion :real;
    end;

    _pico = record
        codigo :integer;
        acumuladorDistancia :integer;
        contadorPaises :integer;
    end;

    _picos = record
        primero: _pico;
        segundo: _pico;
    end;

    _actual = record
        codigo: integer;
        acumuladorDistancia :integer;
        pais :string;
        contadorPaises :integer;
    end;

    // Utilidades
    procedure acumular(var a:integer; val:integer);
    begin
        a := a + val;
    end;

    procedure incrementar(var c:integer);
    begin
        c := c + 1;
    end;

    // Datos
    procedure leerDatos(var vuelo:_vuelo);
    begin
        with vuelo do
            begin
                write('Ingrese el código del avión: ');
                readln(codigo);
                write('Ingrese el país de salida: ');
                readln(salida);
                write('Ingrese el país de llegada: ');
                readln(llegada);
                write('Ingrese la distancia recorrida en kms: ');
                readln(distancia);
                write('Ingrese el porcentaje de ocupación del vuelo: ');
                readln(ocupacion);                
            end;
    end;

    // Cond 1
    function mismoAvion(codigo, codigoActual:integer):boolean;
    begin
        mismoAvion := codigo = codigoActual;
    end;

    procedure reiniciarCond1(var avionActual:_actual; nuevoCodigo:integer);
    begin
        with avionActual do
            begin
                codigo := nuevoCodigo;
                acumuladorDistancia := 0;
            end;
    end;

    procedure comprobarCond1(var maximos, minimos :_picos; avionActual:_actual);
    begin
        with avionActual do
            begin
                if (acumuladorDistancia >= maximos.primero.acumuladorDistancia) then
                    begin
                        maximos.segundo.codigo := maximos.primero.codigo;
                        maximos.segundo.acumuladorDistancia := maximos.primero.acumuladorDistancia;
                        maximos.primero.codigo := codigo;
                        maximos.primero.acumuladorDistancia := acumuladorDistancia;                        
                    end
                else
                    if (acumuladorDistancia >= maximos.segundo.acumuladorDistancia) then
                        begin
                            maximos.segundo.codigo := codigo;
                            maximos.segundo.acumuladorDistancia := acumuladorDistancia;
                        end;
                if (acumuladorDistancia <= minimos.primero.acumuladorDistancia) then
                    begin
                        minimos.segundo.codigo := minimos.primero.codigo;
                        minimos.segundo.acumuladorDistancia := minimos.primero.acumuladorDistancia;
                        minimos.primero.codigo := codigo;
                        minimos.primero.acumuladorDistancia := acumuladorDistancia;
                    end
                else
                    if (acumuladorDistancia <= minimos.segundo.acumuladorDistancia) then
                        begin
                            minimos.segundo.codigo := codigo;
                            minimos.segundo.acumuladorDistancia := acumuladorDistancia;
                        end;
            end;
    end;

    // Cond 2
    function mismoPais(pais, paisActual:string):boolean;
    begin
        mismoPais := pais = paisActual;
    end;

    procedure reiniciarPais(var avionActual:_actual; nuevoPais:string);
    begin
        with avionActual do
            begin
                pais := nuevoPais;
                contadorPaises := 0;
            end;
    end;

    procedure comprobarCond2(var max:_pico; avionActual :_actual);
    begin
        if (avionActual.contadorPaises >= max.contadorPaises) then
            begin
                max.codigo := avionActual.codigo;
                max.contadorPaises := avionActual.contadorPaises;
            end;
    end;

    // Cond 3
    procedure comprobarCond3(var cantidad:integer; vuelo:_vuelo);
    begin
        with vuelo do
            begin
                if ((distancia > 5000) and (ocupacion > 60)) then
                    incrementar(cantidad);
            end;
    end;

    // Cond 4
    procedure comprobarCond4(var cantidad:integer; vuelo:_vuelo);
    begin
        with vuelo do
            begin
                if ((distancia < 10000) and ((llegada = 'Australia')or (llegada = 'Nueva Zelanda'))) then
                    incrementar(cantidad);
            end;
    end;

var
    vuelo :_vuelo;
    maximosCond1, minimosCond1 :_picos;
    maximoCond2 :_pico;
    avionActual :_actual;
    cantidadCond3, cantidadCond4 :integer;
begin
    avionActual.codigo := 0;

    maximosCond1.primero.acumuladorDistancia := 0;
    maximosCond1.segundo.acumuladorDistancia := 0;
    minimosCond1.primero.acumuladorDistancia := 0;
    minimosCond1.segundo.acumuladorDistancia := 0;

    maximoCond2.contadorPaises := 0;

    cantidadCond3 := 0;
    cantidadCond4 := 0;

    repeat

        leerDatos(vuelo);

        if (not mismoAvion(vuelo.codigo, avionActual.codigo)) then
            begin
                comprobarCond1(maximosCond1, minimosCond1, avionActual); // Cumple cond1
                reiniciarCond1(avionActual, vuelo.codigo);
            end;

        if (not mismoPais(vuelo.salida, avionActual.pais)) then
            begin
                comprobarCond2(maximoCond2, avionActual);   // Cumple cond2
                reiniciarPais(avionActual, vuelo.salida);
            end;

        acumular(avionActual.acumuladorDistancia, vuelo.distancia);
        incrementar(avionActual.contadorPaises);
        
        comprobarCond3(cantidadCond3, vuelo);   // Cumple cond3

        comprobarCond4(cantidadCond4, vuelo);   // Cumple cond4
        
    until (vuelo.codigo = 44);

    writeln(
        'Los aviones que más km recorrieron son: ', maximosCond1.primero.codigo,
        ' y ', maximosCond1.segundo.codigo, '.'
    );
    writeln(
        'Los aviones que menos km recorrieron son: ', maximosCond1.primero.codigo,
        ' y ', maximosCond1.segundo.codigo, '.'
    );
    writeln(
        'El avión que salió desde más países diferentes es: ',
        maximoCond2.codigo, '.'
    );
    writeln(
        'La cantidad de vuelos de más de 5.000 km que no alcanzaronel 60% de ocupación del avión es: ',
        cantidadCond3, '.'
    );
    writeln(
        'La cantidad de vuelos de menos de 10.000 km que llegarona Australia o a Nueva Zelanda.',
        cantidadCond4, '.'
    );
end.