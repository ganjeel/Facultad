program numeros;

type
    vector = array[1..100] of integer;
    ocurrencias = array[0..9] of integer;

    procedure leerVector(var v:vector; var dimL:integer);
    var
        n, i:integer;
    begin
        i := 1;
        write('Ingrese un número: ');
        readln(n);
        while (n <> -1) do
            begin
                while (n <> 0) do
                    begin
                        v[i] := n MOD 10;
                        n := n DIV 10;
                        i := i + 1;
                    end;
                write('Ingrese un número: ');
                readln(n);
            end;

        dimL := i;
    end;

    procedure contarOcurrencias(var o:ocurrencias; v:vector; dimL:integer);
    var
        i, digito :integer;
    begin
        for i:=1 to dimL do
            begin
                digito := v[i];
                o[digito] := o[digito] + 1;
            end;
    end;

    function mayor(o:ocurrencias):integer;
    var
        i, max, pos :integer;
    begin
        max := 0;
        for i:=0 to 10 do
            if (o[i] > max) then
                begin
                    max := o[i];
                    pos := i;
                end;
        mayor := pos;
    end;
    
var
    v :vector;
    o :ocurrencias;
    i, dimL :integer;

begin

    leerVector(v, dimL);
    contarOcurrencias(o,v,dimL);

    for i:=0 to 10 do
        if (o[i] <> 0) then
            writeln(
                'Número ', i,
                ': ', o[i], ' veces.'
            );

    writeln('El dígito más leído fue el ', mayor(o));

    write('Los dígitos que no tuvieron ocurrencias son: ');
    for i:=0 to 10 do
        if (o[i] = 0) then
            write(', ', i);
end.