Program ejercicio7;

Const
    DETENCION = 32767;

Var
    codigo: integer;
    precioActual, precioNuevo: real;

Begin
    codigo := 0;
    
    repeat
        write('Ingrese el código del producto: ');
        readln(codigo);
        write('Ingrese el precio actual: ');
        readln(precioActual);
        write('Ingrese el nuevo precio: ');
        readln(precioNuevo);

        if precioNuevo > (precioActual * 1.1) then
            writeln(
                'El aumento de precio del producto ', 
                codigo,
                ' es superior al 10%.'
            )
        else
            writeln(
                'El aumento de precio del producto ',
                codigo,
                ' no es superior al 10%.'
            );

    until (codigo = DETENCION);

end.