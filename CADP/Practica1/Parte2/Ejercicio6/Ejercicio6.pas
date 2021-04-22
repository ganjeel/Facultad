program ejercicio6;

var
    i, 
    cantidadParesMayor16,
    codigoProducto,
    codigoPrimerBarato,
    codigoSegundoBarato
    :integer;

    precioProducto,
    precioPrimerBarato,
    precioSegundoBarato
    :real;

begin
    cantidadParesMayor16 := 0;

    codigoPrimerBarato := 0;
    codigoSegundoBarato := 0;

    precioPrimerBarato := 9999;
    precioSegundoBarato := 9999;

    for i:=1 to 200 do
        begin
            write('Ingrese el código del producto: ');
            readln(codigoProducto);
            write('Ingrese el precio del producto: ');
            readln(precioProducto);

            if precioProducto < precioPrimerBarato then
                begin
                    codigoSegundoBarato := codigoPrimerBarato;
                    codigoPrimerBarato := codigoProducto;

                    precioSegundoBarato := precioPrimerBarato;
                    precioPrimerBarato := precioProducto;
                end
            else
                if precioProducto < precioSegundoBarato then
                    begin
                        codigoSegundoBarato := codigoProducto;
                        precioSegundoBarato := precioProducto;
                    end;

            if ((precioProducto > 16) and (codigoProducto mod 2 = 0)) then
                cantidadParesMayor16 = cantidadParesMayor16 + 1;
        end; 

    write( 
        'El producto más barato es: ', codigoPrimerBarato,
        '; el segundo producto más barato es: ', codigoSegundoBarato,
        '; la cantidad de productos de más de 16 pesos con código par es: ', cantidadParesMayor16,
        '.'
    )
end.