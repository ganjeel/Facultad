Program ejercicio6;

Var
    montoDolares, 
    tasa, 
    comision, 
    montoPesos
    :real;

Begin

    write('Ingrese el monto de la transacción en dólares: ');
    readln(montoDolares);
    write('Ingrese la tasa de cambio del dólar: ');
    readln(tasa);
    write('Ingrese la comisión del banco (en %): ');
    readln(comision);

    montoPesos := montoDolares * tasa * ( 1 + comision/100 );

    writeln(
        'La transacción será de ', montoPesos:4:2, ' pesos argentinos.'
    );

end.