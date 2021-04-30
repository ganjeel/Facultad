program enteros;

const dimF = 0;
const dimL = 0;

type
    vector = array[1..dimF] of integer;

    procedure imprimirVectorAscendente(v:vector; dimL:integer);
    var
        i :integer;
    begin
        for i:=1 to dimL do
            begin
                writeln(v[i]);
            end;
    end;

    procedure imprimirVectorDescendente(v:vector, dimL:integer);
    var
        i, final, posActual :integer;
    begin
        final := dimL - 1;
        for i:=0 to (final) do
            begin
                posActual := dimL - i;
                write(v[dimL-i]);
            end;
    end;

    procedure imprimirMitades(v:vector; dimL:integer);
    var
        i, mitad:integer;
    begin
        mitad := dimL DIV 2;

        for i:=0 to (mitad - 1) do
            begin
                write(v[mitad-i]);
            end;

        for i:=1 to (mitad) do
            begin
                write(v[mitad + i]);
            end;
    end;

    procedure imprimirXY(v:vector; x,y:integer);
    var
        i :integer;
    begin
        if (x <= y) do
            for i:= x to y do
                begin
                    write(v[i]);
                end
        else
            for i:= 0 to (x-y) do
                begin
                    write(v[x-i]);
                end;
    end;

    procedure imprimirVectorAscendente2(v:vector; dimL:integer);
    begin
        imprimirXY(v,1,dimL);
    end;

    procedure imprimirVectorDescendente(v:vector, dimL:integer);
    begin
        imprimirXY(v,diml,1);
    end;

    procedure imprimirMitades(v:vector, dimL:integer);
    begin
        imprimirXY(v, dimL DIV 2, 1);
        imprimirXY(v, (dimL DIV 2) + 1, dimL);
    end;


begin
    //    
end.