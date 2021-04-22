program telefonia;

type

    linea = record
        numero :integer;
        minutos :real;
        datos :real;
    end;

    cliente = record
        codigo :integer;
        cantidadLineas :integer;
        minutos :real;
        datos :real;
    end;

    procedure leerCliente(var c:cliente);
    begin
        write('Ingrese el código del cliente: ');
        readln(c.codigo);
        write('Ingrese la cantidad de líneas del cliente: ');
        readln(c.cantidadLineas);
    end;

    procedure leerLinea(var l :linea);
    begin
        write('Ingrese el número de telefono: ');
        readln(l.numero);
        write('Ingrese la cantidad de minutos consumidos: ');
        readln(l.minutos);
        write('Ingrese la cantidad de MBs consumidos: ');
        readln(l.datos);
    end;

    procedure procesarCliente(var c :cliente);
    var 
        i :integer;
        l :linea;
    begin
        for i := 1 to c.cantidadLineas do
            begin
                writeln('Procesando lína nro ', i);
                leerLinea(l);
                c.minutos := c.minutos + l.minutos;
                c.datos := c.datos + l.datos;
            end;
    end;

    function calcularFacturacion(c:cliente):real;
    begin
        calcularFacturacion := c.minutos * 3.4 + c.datos * 1.35;
    end;

var
    clienteActual :cliente;
    i :integer;
begin

    for i := 1 to 9300 do
        begin
            clienteActual.minutos := 0;
            clienteActual.datos := 0;
            leerCliente(clienteActual);
            procesarCliente(clienteActual);
            
            writeln('El cliente debe abonar $', calcularFacturacion(clienteActual):8:2);
        end;
end.