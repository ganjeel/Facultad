Program ejercicio4;
Const 
    pi=3.14;
Var
    diametro, radio, area, perimetro: real;

Begin

    write('Ingrese el diámetro del círculo: ');
    readln(diametro);

    radio := diametro / 2;
    area := pi * radio * radio;
    perimetro := pi * diametro;

    writeln(
        'El rádio del círculo es: ', radio:2:1,
        '; el área es: ', area:2:1,
        '; el perímetro es: ', perimetro:2:1
    );

end.