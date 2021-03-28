program ejercicio1;

var
    i, 
    numero, 
    suma, 
    mayores
    :integer;

begin
    suma := 0;
    mayores :=0;

    for i:=1 to 10 do
        begin
            write('Ingrese un número: ');
            readln(numero);

            suma += numero;

            if ( suma > 5 ) then
                mayores += 1;

        end;
    
    write(
        'Los suma total es ', suma,
        ' y la cantidad de números mayores a 5 es ', mayores
    )

end.
