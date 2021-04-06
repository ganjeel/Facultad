program ejercicio1;

var
    codigoEmpresa,
    codigoEmpresaMayorMonto,
    cantidadInversiones,
    contadorEmpresasInvAltas,
    inversion
    :integer;

    montoInversion,
    montoAcumulado,
    montoPromedio,
    montoMaximo
    :real;

begin
    contadorEmpresasInvAltas := 0;
    codigoEmpresaMayorMonto := 0;
    montoMaximo := 0;

    repeat

        write('Ingrese el código de la empresa: ');
        readln(codigoEmpresa);
        write('Ingrese la cantidad de inversiones: ');
        readln(cantidadInversiones);

        montoInversion := 0;
        montoAcumulado := 0;

        for inversion :=1 to cantidadInversiones do
            begin
                write('Ingrese el monto dedicado a la inversión ', inversion, ': ');
                readln(montoInversion);
                montoAcumulado := montoAcumulado + montoInversion;
            end;

        montoPromedio := montoAcumulado / cantidadInversiones;

        if ( montoAcumulado > 50000 ) then
            contadorEmpresasInvAltas := contadorEmpresasInvAltas + 1;

        if ( montoAcumulado >= montoMaximo ) then
            begin
                montoMaximo := montoAcumulado;
                codigoEmpresaMayorMonto := codigoEmpresa;
            end;

        writeln(
            'Resultado del análisis: Empresa ', codigoEmpresa,
            ' -> Monto promedio ', montoPromedio:8:2,
            '.'
        );
    
        writeln('');

    until (codigoEmpresa = 100);

    writeln('(Fin de la lectura)');
    writeln('');
    
    writeln(
        'La empresa ', codigoEmpresaMayorMonto,
        ' es la empresa que mayor dinero posee invertido ($', montoMaximo:8:2,
        ') .'
    );
    writeln(
        'Hay ', contadorEmpresasInvAltas,
        ' empresas con inversiones por más de $50000.'
    );

end.