program espera;
type

    lista = ^nodo;

    nodo = record
        data:cliente;
        siguiente:lista;
    end;

    cliente = record
        dni:integer;
        numero:integer;
    end;

    procedure solicitarDNI(var dni:integer);
    begin
        write('Ingrese el dni del cliente: ');
        readln(dni);
    end;

    procedure recibirCliente(L:lista; dni:integer);
    begin
        if(L<>nil) then
            begin
                while(L^.siguiente<>nil) do
                    L:=L^.siguiente;
                L^.siguiente^.data.dni := dni;
                L^.siguiente^.data.numero := L^.data.numero + 1;
            end;
        else
            L^.data.dni := dni;
            L^.data.numero := 1;
    end;

    procedure atenderCliente(var L:lista; dni, numero:integer);
    begin
        dni := L^.data.dni;
        numero := L^.data.numero;
        L := L^.siguiente;
    end;

var
    clientes:lista;
    dni, numero:integer;
begin
    new(clientes);

    solicitarDNI(dni);

    while (dni <> 0) do
        begin
            recibirCliente(clientes, dni);
            solicitarDNI(dni);
        end;

    while(clientes <> nil) do
        begin
            atenderCliente(clientes, dni, numero);
            write('Paciente nro ', numero, ' con dni ', dni, ', es su turno.')
        end;
end;