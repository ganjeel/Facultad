program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

    procedure armarNodo(var L: lista; var ultimo:lista ; v: integer);
    var
        aux : lista;
    begin
        new(aux);
        aux^.num := v;
        aux^.sig := nil;
        L^.sig := aux;
        ultimo^ := aux;
    end;

    function maximo(L:lista):integer;
    var
        aux:lista;
        maximo:integer;
    begin
        max := 0;
        aux := L;
        while(aux <> nil) do
            begin
                if (aux.num >= max) then
                    max := aux.num;
                aux := aux.sig;
            end;
        maximo := max;
    end;

    function minimo(L:lista):integer;
    var
        aux:lista;
        min:integer;
    begin
        min := 9999;
        aux := L;
        while (aux <> nil) do
            begin
                if (aux.num <= min) then
                    min := aux.num;
                aux := aux.sig;
            end;
        minimo := min;
    end;

    function multiplos(L:lista; A:integer):integer;
    var
        aux:lista;
        cantidad:integer;
    begin
        cantidad := 0;
        aux := L;
        while (aux <> nil) do
            begin
                if (aux.num DIV A = 0) then
                    cantidad := cantidad + 1;
            end;
        multiplos := cantidad;
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
