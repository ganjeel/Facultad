program ejercicio12;


    function esVocal(caracter:char):boolean;
    begin
        esVocal := (caracter = 'A') 
            or (caracter = 'E') 
            or (caracter = 'I') 
            or (caracter = 'O') 
            or (caracter = 'U');
    end;

    function esAlfanumerico(caracter:char):boolean;
    begin
        esAlfanumerico := (caracter >= 'A') and (caracter <= 'Z') and (not esVocal(caracter));
    end;

var
    caracter
    :char;

    i
    :integer;

    cumple,
    proximoPaso,
    salir
    :boolean;

begin
    cumple := false;
    proximoPaso := false;
    salir := false;

    repeat
        write('Ingrese un caracter: ');
        readln(caracter);

        if (esVocal(caracter)) then
            cumple := true
        else
            if (caracter = '$') then 
                proximoPaso = true
            else
                begin
                    writeln('No se cumple la secuncia A');
                    cumple := false;
                end;

    until (proximoPaso or not cumple);


    while (not salir and cumple) do

    begin
        write('Ingrese un caracter: ');
        readln(caracter); 

        if (caracter = '#') then
            salir := true
        else 
            if (not esAlfanumerico(caracter)) then 
                begin
                    writeln('No se cumple en la secuencia B')
                    cumple := false;
                end;
    end;


    if (cumple) then
        writeln('Cumple')
end.
