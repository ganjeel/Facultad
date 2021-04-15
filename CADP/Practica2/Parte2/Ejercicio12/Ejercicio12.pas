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

    procedure noCumple(var estado:boolean);
    begin
        estado := false;
    end;

var
    caracter
    :char;

    i
    :integer;

    estado
    :boolean;

begin
    estado := true;

    for i := 1 to 4 do
        begin
            write('Ingrese un caracter: ');
            readln(caracter); 

            case i of
                1: if (not esVocal(caracter)) then noCumple(estado);
                2: if (caracter <> '$') then noCumple(estado);
                3: if (not esAlfanumerico(caracter)) then noCumple(estado);
                4: if (caracter <> '#') then noCumple(estado);
            end;

        end;

    if (estado) then
        writeln('Cumple')
    else
        writeln('No cumple');

end.
