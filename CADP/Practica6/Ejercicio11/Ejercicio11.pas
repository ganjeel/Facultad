program premios;

type
    lista = ^nodo;

    nodo = record
        data:egresado;
        siguiente:lista:
    end;

    egresado = record
        numero:integer;
        apellido:string;
        promedio:real;
    end;

    procedure leerEgresado(var e:egresado);
    begin
        write('Ingrese el número de alumno: ');
        readln(e.numero);
        write('Ingrese el apellido: ');
        readln(e.apellido);
        write('Ingrese el promedio: ');
        readln(e.promedio);
    end;

    procedure cargarEgresados(var egresados:lista);
    var
        aux:lista;
        e:egresado;
    begin
        new(aux);
        leerEgresado(e);
        if (e.numero <> 0) then
            begin
                aux^.data := e;
                egresados := aux;
                aux := aux^.siguiente;
            end;
        leerEgresado(e);
        while(e.numero <> 0) do
            begin
                aux^.data := e;
                aux := aux^.siguiente;
                leerEgresado(e);
            end;
    end;

    procedure insertarOrdenado(var L:lista; e:egresado);
    var
        aux, actual, anterior:lista;
        salir :boolean;
    begin
        if (L = nil) then
            begin
                L^.data := e;
                L^.siguiente := nil;
            end
        else
            begin
                if (e.promedio >= L^.data.promedio) then
                    begin
                        new(aux);
                        aux^.data := e;
                        aux^.siguiente := L;
                        L := aux;
                    end
                else
                    begin
                        salir := false;
                        new(anterior);
                        new(actual);
                        anterior := L;
                        actual := L^.siguiente;
                        while((actual<>nil) and (e.promedio <= actual^.data.promedio)) do
                            begin
                                anterior := actual;
                                actual := actual^.siguiente;
                            end;
                        if (actual <> nil) then
                            begin
                                new(aux);
                                aux^.data := e;
                                aux^.siguiente := actual;
                                anterior^.siguiente := aux;
                                salir := true;
                            end
                        else
                    end;
            end;
    end;

    procedure ordernarEgresados(var egresados:lista);
    var
        aux, ordenados:lista;
    begin
        new(ordenados);
        while (egresados <> nil) do
            begin
                insertarOrdenado(ordenados, egresados^.data);
            end;
        egresados := ordenados;
    end;

    procedure imprimirTop(egresados:lista);
    var
        cantidad:integer;
    begin
        cantidad := 1;
        while ((egresados <> nil) and (cantidad <= 10)) do
            begin
                writeln('El puesto ',cantidad, ' lo ocupa: ', e^.data.apellido);
                cantidad := cantidad + 1;
            end;
    end;

var
    egresados:lista;
begin
    new(egresados);
    cargarEgresados(egresados);
    ordernarEgresados(egresados);
    imprimirTop(egresados);
end.
