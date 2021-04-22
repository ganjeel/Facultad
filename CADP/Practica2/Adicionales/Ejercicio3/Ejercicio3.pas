program productos;

type
    id_producto = 0..100;

    function esPar(codigo :id_producto):boolean;
    begin
        esPar := codigo MOD 2 = 0;
    end;

    function esMenor(n1,n2 :real):boolean;
    begin
        esMenor := n1 <= n2;
    end;

    procedure comprobarMinimos(
        codigo :id_producto; 
        precio :real; 
        var codigoMinimoPrimero, codigoMinimoSegundo: id_producto;
        var precioMinimoPrimero, precioMinimoSegundo: real
    );
    begin
        if (esMenor(precio, precioMinimoPrimero)) then
            begin
                precioMinimoSegundo := precioMinimoPrimero;
                precioMinimoPrimero := precio;
                codigoMinimoSegundo := codigoMinimoPrimero;
                codigoMinimoPrimero := codigo;
            end
        else
            if (esMenor(precio, precioMinimoSegundo)) then
                begin
                    precioMinimoSegundo := precio;
                    codigoMinimoSegundo := codigo;
                end;
    end;

    procedure comprobarCondicion(
        codigo: id_producto; 
        precio:real; 
        var cantidadCond :integer
    );
    begin
        if (esPar(codigo) and (precio > 16)) then
            cantidadCond := cantidadCond +1;
    end;


var
    i,
    cantidadCond
    : integer;

    codigo,
    codigoMinimoSegundo,
    codigoMinimoPrimero
    : id_producto;

    precio,
    precioMinimoPrimero,
    precioMinimoSegundo
    :real;

begin
    cantidadCond := 0;
    codigoMinimoSegundo := 0;
    codigoMinimoPrimero := 0;
    precioMinimoPrimero := 999;
    precioMinimoSegundo := 999;

    for i:=1 to 200 do
        begin
            
            write('Ingrese el código del producto: ');
            readln(codigo);
            write('Ingrese el precio del producto: ');
            readln(precio);

            comprobarMinimos(
                codigo, 
                precio, 
                codigoMinimoPrimero, codigoMinimoSegundo,
                precioMinimoPrimero,precioMinimoSegundo
            );

            comprobarCondicion(codigo, precio, cantidadCond);
            
        end;

    writeln('Los dos productos más baratos son: ', codigoMinimoPrimero, ' y ', precioMinimoSegundo);
    writeln('La cantidad de productos de más de 16 pesos con código par es: ', cantidadCond);

end.