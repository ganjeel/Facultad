program revistas;

const
    dimF = 3600;

type
    data = array[1..dimF] of usuario;

    lista = ^nodo;

    nodo = record
        data:usuario;
        siguiente:lista;
    end;

    usuario = record
        email:string;
        rol:1..4; 
        revista:string;
        ultimoAcceso:integer;
    end;

    _roles = array[1..4] of integer;

    procedure incrementar(var cantidad);
    begin
        cantidad := cantidad + 1;
    end;

    procedure insertarOrdenado(var L:lista; U:usuario);
    var
        nuevo, aux, ant:lista;
    begin
        new(nuevo);
        nuevo^.data := U;
        nuevo^.siguiente := nil;
        if (L = nil) then
            L := nuevo
        else
            begin
                aux := L;

                if (U.ultimoAcceso <= aux^.data.ultimoAcceso) then
                    begin
                        nuevo^.siguiente := aux;
                        L := nuevo;
                    end
                else
                    begin
                        while((aux <> nil) and (aux^.data.ultimoAcceso < U.ultimoAcceso)) do
                            begin
                                ant := aux;
                                aux := aux^.siguiente;
                            end;
                        ant^.siguiente := nuevo;
                        if (aux <> nil) then
                            nuevo^.siguiente := aux^.siguiente;
                    end;
            end;
    end;

    procedure buscarUltimos(L:lista; u1,u2:string);
    var
        ant:lista;
    begin
        while(L^.siguiente <> nil) do
            begin
                ant := L;
                L := L^.siguiente;
            end;
        u1 := L;
        u2 := ant;
    end;

var
    i:integer;
    usuarios:data;
    L,aux:lista;
    roles:_roles;
    usuario1, usuario2:string;
begin
    for i:= 1 to 4 do
        roles[i] := 0;

    cargar(usuarios); // Simulo carga

    for i:=1 to dimF do
        begin
            insertarOrdenado(L, usuarios[i]);
            incrementar(roles[usuarios[i].rol]);
        end;
    
    buscarUltimos(L, usuario1, usuario2);
    
    new(aux);
    aux := L;
    while (aux <> nil) do
        writeln(
            'El usuario ', 
            aux^.data.email, 
            ' no se conecta hace ', 
            aux^.data.ultimoAcceso,
            ' días.'
        );
    for i:=1 to 4 do
        writeln(
            'El rol ',
            i,
            ' tiene ',
            roles[i],
            ' usuarios.'
        );
    writeln(
        'Los usuarios ', 
        usuario1, 
        ' y ', 
        usuario2, 
        ' son los usuarios que llevan más tiempo sin ingresar.'
    );
end.