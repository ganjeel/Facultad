program ejercicio2;
    
type
    lista = ^nodo;

    persona = record
        dni: integer;
        nombre: string;
        apellido: string;
    end;

    nodo = record
        dato: persona;
        sig: lista;
    end;

    procedure leerPersona(p: persona);  // 8* Debería pasarse por referencia
    begin
        read(p.dni);
        if (p.dni <> 0) then
            begin 
                read(p.nombre);
                read(p.apellido);
            end;
    end;

    {Agrega unnodo a la lista}
    procedure agregarAdelante(l:lista; p:persona);  // 4* La lista debería pasarse por referencia
    var
        aux: lista;
    begin
        aux^.dato := p;
        aux^.sig := l;
        l:= aux;
    end

    {Carga la lista hasta que llega el dni 0}
    procedure generarLista(var l:lista);
    var
        p:nodo;
    begin
        leerPersona(p); // 1* Acá le está pasando el nodo, debería pasarle nodo^.dato
        while (p.dni <> 0) do   // 2* Como p es de tipo nodo tampoco tiene el campo dni
            begin
                agregarAdelante(l,p);   // 3* Debería pasar p.dato
                // 9* Debería llamarse a leerPersona nuevamente adentro del bucle
            end;
        end;

    procedure imprimirInformacion(var l:lista); // 5* La lista debería pasarse por valor
    begin
        while(l <> nil) do
            begin
                writeln('DNI: ', l^.dato.dni, 'Nombre:', l^.nombre, 'Apellido:', l^.apellido);  // 6 y 7* El nombre y el apellido no se estan accediendo
                                                                                                // correctamente, la lista no tiene esos campos
                                                                                                // Debería ser l^.dato.nombre y l^.dato.apellido
                l:= l^.sig; // Acá se perdería la referencia al primer elemento
            end;
    end;

    {Programa principal}
var 
    l:lista;
begin
    generarLista(l);
    imprimirInformacion(l);
end.