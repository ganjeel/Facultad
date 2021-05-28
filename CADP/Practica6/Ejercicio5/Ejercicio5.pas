program supermercado;

type
    _productos = ^_nodo;

    _producto = record
        codigo:integer;
        descripcion:string;
        stockActual:integer;
        stockMinimo:integer;
        precio:real;
    end;

    _nodo = record
        data:_producto;
        siguiente:_productos;
    end;

    _minimo = record
        precio:real;
        codigo:integer;
    end;

    _minimos = record 
        primero:_minimo;
        segundo:_minimo;
    end;



    procedure incrementar(var cantidad:integer);
    begin
        cantidad := cantidad + 1;
    end;

    procedure leerProducto(var producto:_producto);
    begin
        write('Ingresar el código: ');
        readln(producto.codigo);
        write('Ingrese la descripción: ');
        readln(producto.descripcion);
        write('Ingrese el stock actual: ');
        readln(producto.stockActual);
        write('Ingrese el stock mínimo: ');
        readln(producto.stockMinimo);
    end;

    procedure cargarProductos(var productos:_productos);
    var
        aux:_productos;
        producto:_producto;
    begin
        leerProducto(producto);
        while (producto.codigo <> -1) do
            begin
                new(aux);
                aux^.data := producto;
                aux^.siguiente := nil;
                productos^.siguiente := aux;
                leerProducto(producto);  
            end;
    end;

    function hayFaltante(producto:_producto):boolean;
    begin
        hayFaltante := producto.stockActual < producto.stockMinimo;
    end;

    function tieneTresPares(producto:_producto):boolean;
    var
        cantidadPares :integer;
        codigo :integer;
    begin
        cantidadPares := 0;
        codigo := producto.codigo;
        while (codigo <> 0) do
            begin
                if (codigo MOD 2 = 0) then
                    incrementar(cantidadPares);
                codigo := codigo DIV 2;
            end;
        tieneTresPares := cantidadPares = 3;
    end;

    procedure comprobarMinimos(var minimos:_minimos; producto:_producto);
    begin
        if (producto.precio <= minimos.primero.precio) then
            begin
                minimos.segundo.precio := minimos.primero.precio;
                minimos.segundo.codigo := minimos.primero.codigo;
                minimos.primero.precio := producto.precio;
                minimos.primero.codigo := producto.codigo;
            end
        else
            if (producto.precio <= minimos.segundo.precio) then
                begin
                    minimos.segundo.precio := producto.precio;
                    minimos.segundo.codigo := producto.codigo;
                end;
    end;

var
    productos:_productos;
    aux :_productos;
    cantidadFaltante, cantidadProductos:integer;
    porcentajeFaltante:real;
    minimos:_minimos;
begin
    cantidadProductos := 0;
    cantidadFaltante := 0;
    minimos.primero.precio := 9999;
    minimos.segundo.precio := 9999;

    cargarProductos(productos);

    aux := productos;
    while (aux <> nil) do
        begin
            incrementar(cantidadProductos);

            if (hayFaltante(aux^.data)) then
                incrementar(cantidadFaltante);

            if (tieneTresPares(aux^.data)) then
                writeln(aux^.data.descripcion);

            comprobarMinimos(minimos, aux^.data);
        end;

    if (cantidadProductos > 0) then
        begin
            porcentajeFaltante := cantidadFaltante / cantidadProductos;
            writeln(
                'El porcentaje de productos con faltante es: ', 
                porcentajeFaltante:2:2,
                '.'
            );
        end;

    writeln('Los dos productos más económicos son: ', minimos.primero.codigo, ' y ', minimos.segundo.codigo, '.');
end.