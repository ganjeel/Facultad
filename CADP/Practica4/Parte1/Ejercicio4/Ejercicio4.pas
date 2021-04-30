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
        maximo :integer;
    begin
        maximo := 0;
        for i:=1 to 100 do
            if (v[i] > maximo) then
                maximo := v[i];
        elementoMaximo := maximo;
    end;

    function elementoMinimo(v:vector):integer;
    var
        minimo :integer;
    begin
        minimo := 0;
        for i := 1 to 100 do
            if (v[i] < minimo) then
                minimo := v[i];
        elementoMinimo := minimo;
    end;

begin
    //
end.