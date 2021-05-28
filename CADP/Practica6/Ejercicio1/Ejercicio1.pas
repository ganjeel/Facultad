

procedure imprimir(L:lista);
var
    aux:lista;
    num:integer;
begin
    aux := L;
    while (aux <> nil ) do
        begin
            writeln(aux^.num);
            aux := aux^.sig;
        end;
end;

procedure incrementar(var L:lista; valor:integer);
var
    aux:lista;
begin
    aux := L;
    while(aux <> nil) do
        begin
            aux^num := aux^.num + valor;
            aux := aux^.sig;
        end;
end;