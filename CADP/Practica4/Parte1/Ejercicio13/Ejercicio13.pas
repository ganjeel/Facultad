program IPCC;

const
    anioActual = 2021;

type
    paises = array[1..100] of real;
    anios = array[1..50] of paises;
    maximo = record
        anio :integer;
        temperatura :real;
    end;

    procedure leerAnio(var p:paises);
    var
        i :integer;
    begin
        for i:=1 to 100 do
            begin
                write('Ingrese la temperatura para el país ', i, ':');
                readln(p[i])
            end;
    end;

    procedure comprobarMax(var m:maximo; anio:integer; temperatura:real);
    begin 
        if (temperatura >= m.temperatura) then
            begin
                m.anio := anio;
                m.temperatura := temperatura;
            end;
    end;

var
    i, j, anio :integer;
    tempLocal ,tempTotal, tempMedia :real;
    a :anios;
    maximoLocal :maximo;
    maximoGlobal :maximo;

begin
    maximoLocal.temperatura := 0;
    maximoGlobal.temperatura := 0;

    for i:=1 to 50 do
        begin
            leerAnio(a[i]);
        end;

    for i:=1 to 50 do
        begin
            anio := (anioActual - 50 + i);
            tempTotal := 0;
            tempMedia := 0;
            for j:=1 to 100 do
                begin
                    tempLocal := a[i][j];
                    tempTotal := tempTotal + tempLocal;
                    comprobarMax(maximoLocal, anio, tempLocal);
                end;
            tempMedia := tempTotal / 100;
            comprobarMax(maximoGlobal, anio, tempMedia);
        end;
    
    writeln('EL año con la mayor temperatura media global fué: ', maximoGlobal.anio);
    writeln('El año con la mayor temperatura registrada local fue: ', maximoLocal.anio);

end.
