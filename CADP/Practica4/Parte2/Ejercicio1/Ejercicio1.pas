program buscar;

const
    dimF = 500;

type
    vector = array[1..dimF] of integer;

    function buscar(n:vector; dimL:integer; ref:integer):boolean;
    var
        pos:integer; 
        esta:boolean;
    begin
        esta := false;
        pos := 1;
        while ((pos <= dimL) and (not esta)) do
            begin
                if (n[pos] = ref) then
                    esta := true
                else
                    pos := pos + 1;
            end;
        buscar := esta;
    end;

    function buscarOrdenado(n:vector; dimL:integer; ref:integer):boolean;
    var
        mitad, min, max:integer;
        encontrado :boolean;
    begin
        min := 1;
        max := dimL;
        mitad := (min + max) div 2;
        encontrado := ref = n[mitad];  // Si casualmente son iguales no entra al while
        while((min <= max) and (not encontrado)) do
            begin
                if (ref < n[mitad]) then
                    max := mitad - 1
                else
                    if( ref > n[mitad]) then
                        min := mitad + 1
                    else
                        encontrado := true;
                mitad := (min + max) div 2;
            end;
        buscarOrdenado := encontrado;
    end;

var
    n:vector;
    dimL:integer;
begin
    cargarDatos(n,dimL);    // Datos disponibles
end.