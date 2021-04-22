Program ejercicio8;
Var
    primero, segundo, tercero: char;
    cantidadVocales:integer;

Begin

    cantidadVocales := 0;

    write('Ingrese un caracter: ');
    readln(primero);

    write('Ingrese otro caracter: ');
    readln(segundo);

    write('Ingrese el último caracter: ');
    readln(tercero);

    if (
        (primero = 'a' ) 
        or (primero = 'e') 
        or (segundo = 'i') 
        or (primero = 'o')
        or (primero = 'u')
        ) then
        cantidadVocales := cantidadVocales + 1;

    if (
        (segundo = 'a' ) 
        or (segundo = 'e') 
        or (segundo = 'i') 
        or (segundo = 'o')
        or (segundo = 'u')
        ) then
        cantidadVocales := cantidadVocales + 1;

    if (
        (tercero = 'a' ) 
        or (tercero = 'e') 
        or (tercero = 'i') 
        or (tercero = 'o')
        or (tercero = 'u')
        ) then
        cantidadVocales := cantidadVocales + 1;

    if cantidadVocales > 1 then
        if cantidadVocales = 3 then
            writeln('Los tres son vocales')
        else
            writeln('Almenos un carácter no era vocal');

end.