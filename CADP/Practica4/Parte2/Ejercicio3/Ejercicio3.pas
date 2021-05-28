program transporteCaudales;

const
    dimF = 200;

type
    _viaje = record 
        dia: 1..31;
        monto: real;
        distancia: real;
    end;

    arrViajes = array[1..dimF] of _viaje;

    procedure leer(var viaje:_viaje);
    begin
        write('Ingrese el día del mes: ');
        readln(viaje.dia);
        write('Ingrese el monto transportado: ');
        readln(viaje.monto);
        write('Ingrese la distancia recorrida: ');
        readln(viaje.distancia);
    end;

    // b)

    procedure procesar(viajes:arrViajes; dimL:integer);
    type
        arrViajesDia = array[1..31] of integer;
        procedure comprobarMinimo(var minimo:_viaje; viaje:_viaje);
        begin
            if (viaje.monto < minimo.monto) then
                begin
                    minimo.monto := viaje.monto;
                    minimo.distancia := viaje.distancia;
                    minimo.dia := viaje.dia;
                end;
        end;

    var
        pos:integer;
        montoPromedio:real;
        mininimo:_viaje;
        viajesDia:arrViajesDia;
    begin
        montoPromedio := 0;
        minimo.monto := 9999;

        for pos:=1 to 12 do
            viajesDia[pos] := 0;

        for pos:=1 to dimL do
            begin
                montoPromedio := montoPromedio + viajes[pos].monto;
                comprobarMinimo(minimo, viajes[pos]);
                viajesDia[viajes[pos].dia] := viajesDia[viajes[pos].dia] + 1;
            end;
        montoPromedio := montoPromedio / dimL;

        writeln('El monto promedio transportado es: ', montoPromedio);
        writeln('La distancia recorrida y el día en que se transprtó menos dinero son: ', minimo.distancia:8:2,' y ',minimo.dia, '.');
        for pos:=1 to 12 do
            begin
                writeln('La cantidad de viajes realizados en el mes ', pos, ' es: ', viajesDia[pos]);
            end;
    end;

    procedure eliminar(var viajes:arrViajes; var dimL:integer);
    var
        pos, aux:integer;
    begin
        pos:=1;
        while(pos<>dimL) then
            if (viajes[pos].distancia = 100) then
                begin
                    dimL := dimL - 1;
                    for aux:=pos to dimL do
                        viajes[aux] := viajes[aux+1];
                end;
    end;

var
    viaje:_viaje;
    viajes:arrViajes;
    pos :integer;

begin
    pos := 0;

    leer(viaje);
    while((pos < dimF) and (viaje.distancia <> 0)) do
        begin
            pos := pos + 1;
            viajes[pos] := viaje;
            leer(viaje);
        end;

    procesar(viajes, pos);
    eliminar(viajes, pos);
end.