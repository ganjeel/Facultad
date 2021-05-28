program becas;

type

    lista = ^nodo;

    nodo = record
        data:viaje;
        siguiente:lista;
    end;

    viaje = record 
        codigo:1..1300;
        dia:1..31;
        facultad:string;
        transporte:1..5;
    end;

    procedure leer(var v:viaje);
    begin
        write('Ingrese el código del alumno: ');
        readln(v.codigo);
        write('Ingrese el día de la semana: ');
        readln(v.dia);
        write('Ingrese la facultad: ');
        readln(v.facultad);
        write('Ingrese el medio de transporte: ');
        readln(v.transporte);
    end;

    procedure agregar(var viajes:lista; v:viaje);
    var
        aux:lista;
    begin
        new(aux);
        aux^.data := v;
        aux^.siguiente := viajes;
        viajes := aux;
    end;

var
    viajes, aux:lista;
    v:viaje;
begin
    new(viajes);
    leer(v);
    while(v.codigo <> -1) do
        begin
            agregar(viajes, v);
            leer(v);
        end;
    
    while((viajes <> nil) and ())

end.