program amazon;

const
    dimF = 500;

type

// Registros
    _fecha = record
        dia:1..31;
        mes:1..12;
        anio:integer;
    end; 

    _cliente = record
        fechaAlta:_fecha;
        categoria:'A'..'F';
        ciudad:1..2400;
        monto:real;
    end;

    // Registro utilizado para almacenar el año con mayor cantidad de contratos
    _maximo = record
        cantidad:integer;
        anio:integer;
    end;

    // Registro utilizado para almacenar la referencia y la cantidad de contratos del mes y el año que se están recorriendo
    _actual = record
        cantidad:integer;
        anio:integer;
        mes:1..12;
    end;

// Vectores
    _clientes = array[1..dimF] of _cliente;

    _categorias = array['A'..'F'] of integer;

    _ciudades = array[1..2400] of integer;

// Modulos

    // Utilidades
    procedure incrementar(var cantidad:integer);
    begin
        cantidad := cantidad + 1;
    end;

    // Leer cliente
    procedure leer(var cliente:_cliente);
    begin
        write('Ingrese el día de alta: ');
        readln(cliente.fechaAlta.dia);
        write('Ingrese el mes de alta: ');
        readln(cliente.fechaAlta.mes);
        write('Ingrese el año de alta: ');
        readln(cliente.fechaAlta.anio)
        write('Ingrese la categoría del monotributo: ');
        readln(cliente.categoria);
        write('Ingrese la ciudad: ');
        readln(cliente.ciudad);
        wirte('Ingrese el monto acordado: ');
        readln(cliente.monto);
    end;

    procedure cargarClientes(var clientes:_clientes);
    var
        pos :integer;
    begin
        for pos:=1 to 500 do
            begin
                leer(clientes[pos]);
            end;
    end;

    // Actualizar el año con mayor cantidad de contratos si el nuevo lo supera
    procedure comprobarMaximo(var maximo:_maximo; nuevo:_actual);
    begin
        if (nuevo.cantidad > maximo.cantidad) then
            begin
                maximo.cantidad := nuevo.cantidad;
                maximo.anio := nuevo.anio;
            end;
    end;
    

var
    clientes:_clientes;
    categorias:_categorias;
    ciudades:_ciudades;
    maximo:_maximo;
    mesActual, anioActual:_actual
    montoPromedio:real;
    pos, posAux, cantidadMes, cantidadMontoProm:integer;
    cat:char;

begin

    // Leo los 500 clientes
    cargarClientes(clientes);

    // Inicializo la cantidad maxima de contratos en 0
    maximo.cantidad := 0;
    // Inicializo las cantidades de clientes por tipo de monotributo
    for char:='A' to 'F' do
        categorias[char] := 0;
    // Inicializo las cantidades de clientes por ciudad
    for pos:=1 to 2400 do
        ciudades[pos] := 0;
    // Reestablezco la posición a 1
    pos := 1;

    // Recorro los 500 clientes y proceso la información de los mismos
    while(pos <= 500) do
        begin
            //---------> COMPRUEBO AÑO
            // Reiniciar/Inicializar los valores del año actual
            anioActual.anio := clientes[pos].fechaAlta.anio;
            anioNuevo.cantidad := 0;
            while(
                (pos <= 500) 
                and (clientes[pos].fechaAlta.anio = anioActual.anio)
                ) do
                begin
                    //---------> COMPRUEBO MES
                    // Reiniciar/Inicializar los valores del mes actual
                    mesActual.mes := clientes[pos].fechaAlta.mes;
                    mesActual.cantidad := 0;

                    // Inicializo la cantidad total de clientes del mes
                    cantidadMes := 0;
                    // Inicializo la cantidad de clientes que superan el monto promedio mensual
                    cantidadMontoProm := 0;
                    // Inicializo el acumulador para el monto promedio
                    montoPromedio := 0;
                    while(
                        (pos <= 500) 
                        and (clientes[pos].fechaAlta.mes = mesActual.mes) 
                        and (clientes[pos].fechaAlta.anio = anioActual.anio)
                        )do
                        begin
                            // Incremento la posición y las cantidades
                            incrementar(mesActual.cantidad);
                            incrementar(anioActual.cantidad);

                            // Incremento la cantidad de clientes para la categoría del monotributo
                            incrementar(categorias[clientes[pos].categoria]);
                            // Incremento la cantidad de clientes para la ciudad
                            incrementar(ciudades[clientes[pos].ciudad]);
                            // Monto promedio
                                // Incremento el acumulador para el monto promedio
                            montoPromedio := montoPromedio + clientes[pos].monto;
                                // Incremento la cantidad de clientes del mes
                            cantidadMes := cantidadMes + 1;

                            pos := pos + 1;
                        end;
                    // Cuando el mes cambia...
                        // Informar la cantidad de contratos firmados en el mes
                    writeln(
                        'La cantidad de contratos firmados en el mes ', mesActual.mes, 
                        ' del año ', anioActual.anio,
                        ' es: ', mesActual.cantidad, 
                        '.'
                    );
                        // Calcular el monto mensual promedio
                        montoPromedio := montoPromedio / cantidadMes;
                        // Buscar clientes que superen dicho monto
                        for posAux:=(pos-cantidadMes) to pos do
                            if (clientes[posAux].monto >= montoPromedio) then
                                cantidadMontoProm := cantidadMontoProm + 1;
                        // Informar cantidad de clientes que superaron el monto promedio
                        writeln(
                            'La cantidad de clientes que superaron el monto promedio de $', montoPromedio:8:2,
                            ' en el mes ', mesActual.mes, ' del año ', anioActual.anio, ' es: ',
                            cantidadMontoProm, 
                            '.'
                        );

                    //---------< COMPRUEBO MES
                end;
            // Cuando el año cambia...
                // Comprobar maximo
            comprobarMaximo(maximo, anioActual);
                // Informar la cantidad de contratos firmados en el año
            writeln(
                'La cantidad de contratos firmados en el año ', anioActual.anio, 
                ' es ', anioActual.cantidad, 
                '.'
            );
            //---------< COMPRUEBO AÑO
        end;
end.