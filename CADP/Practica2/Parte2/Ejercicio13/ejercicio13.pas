program ejercicio13;

    function cumpleA(caracter :char):boolean;
    begin
        cumpleA := caracter <> '$';
    end;

    function cumpleB(contadorA, contadorB, cantidadArroba :integer):boolean;
    begin
        cumpleB := (contadorA = contadorB) and (cantidadArroba > 3);
    end;

    function comprobarArroba(caracter :char):integer;
    begin
        if caracter = '@' then
            comprobarArroba := 1
        else 
            comprobarArroba := 0;
    end;
    
var
    contadorA,
    contadorB,
    cantidadArroba
    :integer;

    caracter:char;

    cumple,
    salir
    :boolean;

begin
    cumple := true;
    salir := false;

    contadorA := 0;
    contadorB := 0;
    cantidadArroba := 0;

    repeat
        
        write('Ingrese un caracter: ');
        readln(caracter);

        contadorA := contadorA + 1;

        if (not cumpleA(caracter)) then
                begin
                    cumple := false;
                    writeln('No se cumple la parte A.');
                end
        else
            if (caracter = '%') then
                salir := true;

    until(salir or not cumple);
    
    salir := false;

    while( not salir ) do
        begin

            write('Ingrese un caracter: ');
            readln(caracter);

            contadorB := contadorB + 1;

            cantidadArroba := cantidadArroba + comprobarArroba(caracter);
            
            if (caracter = '*') then
                salir := true;
        end;

    if cumpleB(contadorA, contadorB, cantidadArroba) then
        writeln('Cumple')
    else
        writeln('No se cumple la parte B.');
end.
