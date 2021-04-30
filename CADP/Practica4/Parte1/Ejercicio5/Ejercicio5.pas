program enteros;
type
    vector = array[1..100] of integer;

    function posicion(v:vector; x:integer):integer;
    begin
        if ((x >= 1) and (x <= 100)) then
            obtenerX := v[x]
        else
            obtenerX := -1;
    end;

    procedure intercambio(v:vector; x,y:integer);
    var
        aux :integer;
    begin
        aux := v[x];
        v[x] := v[y];
        v[y] := aux;
    end;

    function sumarVector(v:vector):integer;
    var
        suma :integer;
    begin
        for i:= 1 to 100 do
            suma := suma + v[i];
        sumarVector := suma;
    end;

    function promedio(v:vector):real;
    begin
        promedio := sumarVector(v) / 100;
    end;

    function elementoMaximo(v:vector):integer;
    var
        maximo, pos :integer;
    begin
        maximo := 0;
        for i:=1 to 100 do
            if (v[i] >= maximo) then
                begin
                    maximo := v[i];
                    pos := i;
                end;
        elementoMaximo := pos;
    end;

    function elementoMinimo(v:vector):integer;
    var
        minimo, pos :integer;
    begin
        minimo := 999;
        for i := 1 to 100 do
            if (v[i] <= minimo) then
                begin
                    minimo := v[i];
                    pos := i;
                end;
        elementoMinimo := pos;
    end;
var
    v:vector;
    i, numero, maxPos, minPos :integer;

begin
    i := 1;

    repeat
        write('Ingrese un número: ');
        readln(numero);

        v[i] := numero;

        i := i + 1;
    until (numero = 0);

    maxPos := elementoMaximo(v);
    minPos := elementoMinimo(v);

    intercambio(v, maxPos, minPos);

    writeln(
        'El elemento máximo ', v[minPos],
        ' que se encontraba en la posición ', minPos,
        ' fue intercambiado con el elemento ', v[maxPos],
        ' que se encontraba en la posición ', minPos, 
        '.'
    );
end.