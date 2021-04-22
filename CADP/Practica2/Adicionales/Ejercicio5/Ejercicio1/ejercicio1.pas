program ejercicio1;

    function calcularMontoAcumulado(cantidadInversiones: integer):real;
    var
        inversion :integer;
        montoAcumulado, montoInversion :real;
    begin
        for inversion:=1 to cantidadInversiones do
            begin
                write('Ingrese el monto dedicado a la inversión ', inversion, ': ');
                readln(montoInversion);
                montoAcumulado := montoAcumulado + montoInversion;
            end;
        calcularMontoAcumulado := montoAcumulado;
    end;

    procedure comprobarInversionesAltas(monto :real; var contador:integer);
    begin
        if ( monto > 50000 ) then
            contador := contador + 1;
    end;

    procedure comprobarMaximo(
        monto :real; 
        codigo :integer; 
        var montoMaximo :real;
        var codigoEmpresaMayorMonto :integer
    );
    begin
        if ( monto >= montoMaximo ) then
            begin
                montoMaximo := monto;
                codigoEmpresaMayorMonto := codigo;
            end;
    end;

var
    codigoEmpresa,
    codigoEmpresaMayorMonto,
    cantidadInversiones,
    contadorEmpresasInvAltas,
    inversion
    :integer;

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

        montoAcumulado := calcularMontoAcumulado(cantidadInversiones);

        montoPromedio := montoAcumulado / cantidadInversiones;

        comprobarInversionesAltas(montoAcumulado, contadorEmpresasInvAltas);

        if ( montoAcumulado >= montoMaximo ) then
            begin
                montoMaximo := montoAcumulado;
                codigoEmpresaMayorMonto := codigoEmpresa;
            end;

        procedure comprobarMaximo(
            montoAcumulado, 
            codigoEmpresa, 
            montoMaximo, 
            codigoEmpresaMayorMonto
        );
        

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