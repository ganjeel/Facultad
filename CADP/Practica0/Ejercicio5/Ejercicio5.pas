Program ejercicio5;

Var
    caramelos, 
    clientes, 
    caramelosClientes, 
    caramelosKiosquero
    :integer;

    dinero: real;

Begin
    write('Ingrese la cantidad de caramelos que posee el kiosquero: ');
    readln(caramelos);
    write('Ingrese la cantidad de clientes: ');
    readln(clientes);

    caramelosClientes := caramelos div clientes;
    caramelosKiosquero := caramelos mod clientes;

    dinero := caramelosClientes * clientes * 1.6;

    writeln(
        'A cada cliente le corresponden ', caramelosClientes ,
        ' caramelos y el kiosquero se quedará con ', caramelosKiosquero,
        ' caramelo/s.'
    );

    writeln(
        'El kiosquero debe cobrar $', dinero:2:1, '.'
    )
end.
