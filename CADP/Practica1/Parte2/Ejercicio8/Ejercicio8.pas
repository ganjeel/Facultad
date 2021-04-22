program ejercicio8;

var
    monto :real;

    dia,
    cantidadVentas,
    mayorCantidadVentas,
    diaMayorCantidadVentas
    :integer;

begin
    mayorCantidadVentas := 0;

    for dia:=1 to 31 do
        begin
            cantidadVentas := 0;

            writeln('Día ', dia, ':');

            write('Ingrese el monto de la venta: ');
            readln(monto);

            while (monto <> 0) do
                begin
                    cantidadVentas := cantidadVentas +1;

                    write('Ingrese el monto de la venta: ');
                    readln(monto);
                end;
                
            if cantidadVentas > mayorCantidadVentas then
                diaMayorCantidadVentas := dia;

            writeln(
                'La cantidad de ventas del día ', dia,
                ' es: ', cantidadVentas
            );
        end;
    
    write(
        'El día que se realizó la mayor cantidad de ventas fué el día',
        diaMayorCantidadVentas,
        '.'
    )
end.

