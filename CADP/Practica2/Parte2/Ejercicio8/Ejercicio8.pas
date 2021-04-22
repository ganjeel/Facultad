program ejercicio8;

    procedure incrementar(var cantidad:integer);
    begin
        cantidad := cantidad + 1;
    end;

    procedure acumular(precio: real; var precioTotal:real);
    begin
        precioTotal := precioTotal + precio;
    end;

    function esMenor(precio, referencia:real) :boolean;
    begin
        esMenor :=  (precio <= referencia);
    end;

    function esPantalon(tipo:string) :boolean;
    begin
        esPantalon := ((tipo = 'pantalon') or (tipo = 'pantalón') or (tipo = 'Pantalon') or (tipo = 'Pantalón'))
    end;

    procedure actualizarPrecio(var actual:real; nuevo: real);
    begin
        actual := nuevo;
    end;

    procedure actualizarCodigo(var actual:integer; nuevo: integer);
    begin
        actual := nuevo;
    end;

    procedure actualizarMinimos(
        precio: real;
        codigo: integer;
        var precioPrimerMinimo, precioSegundoMinimo :real;
        var codigoPrimerMinimo, codigoSegundoMinimo :integer
    );
    begin
        if (esMenor(precio, precioPrimerMinimo)) then
            begin
                actualizarPrecio(precioSegundoMinimo, precioPrimerMinimo);
                actualizarPrecio(precioPrimerMinimo, precio);
                actualizarCodigo(codigoSegundoMinimo, codigoPrimerMinimo);
                actualizarCodigo(codigoPrimerMinimo, codigo);
            end
        else
            if (esMenor(precio, precioSegundoMinimo)) then
                begin
                    actualizarPrecio(precioSegundoMinimo, precio);
                    actualizarCodigo(codigoSegundoMinimo, codigo);
                end;
    end;

var
    producto,
    codigo,
    codigoPrimerMinimo,
    codigoSegundoMinimo,
    codigoPantalonMaximo,
    cantidadProductos
    :integer;

    precio,
    precioPrimerMinimo,
    precioSegundoMinimo,
    precioPantalonMaximo,
    precioTotal
    :real;

    tipo
    :string;

begin
    precioPrimerMinimo := 9999;
    precioSegundoMinimo := 9999;

    codigoPrimerMinimo := 0;
    codigoSegundoMinimo := 0;

    precioPantalonMaximo := 0;
    codigoPantalonMaximo := 0;
    
    precioTotal := 0;
    cantidadProductos := 0;

    for producto:=1 to 5 do
        begin
            write('Ingres el precio: ');
            readln(precio);
            write('Ingrese el codigo: ');
            readln(codigo);
            write('Ingrese el tipo [pantalon, remera, camisa, medias, campera, etc.]: ');
            readln(tipo);
            writeln('');

            actualizarMinimos(
                precio, 
                codigo, 
                precioPrimerMinimo, 
                precioSegundoMinimo,
                codigoPrimerMinimo,
                codigoSegundoMinimo
            );

            if (esPantalon(tipo)) then
                if (not esMenor(precio, precioPantalonMaximo)) then
                    begin
                        actualizarPrecio(precioPantalonMaximo, precio);
                        actualizarCodigo(codigoPantalonMaximo, codigo);
                    end;

            acumular(precio, precioTotal);
            incrementar(cantidadProductos);

        end;
    writeln('');
    writeln('El codigo del producto mas barato es:', codigoPrimerMinimo);
    writeln('El codigo del segundo producto mas barato es: ', codigoSegundoMinimo);
    writeln('El codigo del pantalón mas caro es: ', codigoPantalonMaximo );
    writeln('El precio promedio es: ', precioTotal/cantidadProductos);
end.
