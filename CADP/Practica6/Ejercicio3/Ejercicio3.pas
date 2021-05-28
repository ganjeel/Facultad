program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

    procedure armarNodo(L: lista; var ultimo:lista ; v: integer);
    var
        aux : lista;
    begin
        while(L.siguiente <> nil) do
            L := L.siguiente;
        new(aux);
        aux^.num := v;
        aux^.sig := nil;
        L^.sig := aux;
        ultimo^ := aux;
    end;

var
    pri : lista;
    valor : integer;
begin
    pri := nil;
    writeln(‘Ingrese un numero’);
    read(valor);
    while (valor <> 0) do
        begin
            armarNodo(pri, valor);
            writeln(‘Ingrese un numero’);
            read(valor);
        end;
end.
