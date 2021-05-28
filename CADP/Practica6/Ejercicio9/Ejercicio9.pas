// a)
function estaOrdenada(L:lista):boolean;
var
    cumple:boolean;
begin
    cumple := true; // Inicialmente asumo que está ordenada

    // Compruebo si la lista está vacía
    if (L = nil) then
        cumple := false;

    while ((cumple) and (L^.sig<>nil)) do
        begin
            if (L^.num > L^.sig^.num) then
                cumple := false
            else
                L := L^.sig;
        end;
    estaOrdenada := cumple;
end;

// b)
procedure eliminar(var L:lista; n:integer); // Paso la lista por referencia por si hay
                                            // Que eliminar el primer elemento
var
    aux, ant:lista;
    salir:boolean;
begin
    new(aux);
    new(ant);

    if ((L<>nil) and (L^.num = n)) then // Si casualmente es el primero lo elimino
        L := L^.sig
    else
        begin
            ant := L;       // Guardo el anterior
            aux := L^.sig;  // Asigno el siguiente
            salir := false;
            while((not salir) and (aux <> nil)) do
                if (aux^.num = n) then
                    begin
                        if (aux^.sig <> nil) then
                            ant^.sig := aux^.sig
                        else
                            ant^.sig := nil;
                        dispose(aux);
                        salir := true;
                    end
                else
                    begin
                        ant := aux;
                        aux := aux^.sig;
                    end;
        end;
end;

//
procedure agregar(var L:lista; n:integer;);
var
    aux : lista;
begin
    new(aux);
    aux^.num := n;
    aux^.sig := L;
    L := aux;
end;
//

// c)
procedure sublista(var sublista:lista; L:lista; numA,numB:integer);
begin
    while(L<>nil) do
        begin
            if ((L^.num > numA) and (L^.num < numB)) then
                agregar(sublista, L^.num);
            L := L^.sig;
        end;
end;

// d)
procedure sublistaAscendente(var sublista:lista; L:lista; numA,numB:integer);
begin 
    while((L<>nil) and (L^.num < numB)) do
        begin
            if (L^.num > numA) then
                agregar(sublista, L^.num)
            L := L^.sig;
        end;
end;

// e)
procedure sublistaDescendente(var sublista:lista; L:lista; numA,numB:integer);
begin
    while((L<>nil) and (L^.num > numA)) do
        begin
            if (L^.num < numB) then
                agregar(sublista, L^.num);
            L := L^.sig;
        end;
end;
