program JugamosConListas;

type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;
    procedure armarNodo(L: lista; v: integer);
    var 
        aux : lista;
    begin
        while((L^.sig<>nil) and (L^.sig^.num >= v))) do
            L := L^.sig;
        new(aux);
        aux^.num := v;
        aux^.sig := L^.sig;
        L^.sig := aux;
    end;

var
    pri : lista;
    valor : integer;
begin
    pri := nil;
    writeln(‘Ingrese un numero’);
    read(valor);
    while(valor <> 0) do
    begin
        armarNodo(pri, valor);
        writeln(‘Ingrese un numero’);
        read(valor);
    end;
{ imprimir lista }
end.
