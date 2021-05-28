program astronomia;

const
    dimF = 53;

type
    galaxia = record
        nombre :string;
        tipo :integer;
        masa :real;
        distancia :real;
    end;

    picos = record
        primero :galaxia;
        segundo :galaxia;
    end;
    
    galaxias = array[1..dimF] of galaxia;

    cantidades =  array[1..4] of integer;


    procedure leerGalaxia(var g:galaxia);
    begin
        writeln('Ingrese el nombre de la galaxia: ');
        readln(g.nombre);
        writeln('Ingrese el tipo(1.elíptica/2.espiral/3.lenticular/4.irregular): ');
        readln(g.tipo);
        writeln('Ingrese la masa: ');
        readln(g.masa);
        writeln('Ingrese la distancia: ');
        readln(g.distancia);
    end;

    // Cond 1
    procedure comprobarTipo(var c:cantidades; g:galaxia);
    var
        tipo :integer;
    begin
        tipo := g.tipo;
        c[tipo] := c[tipo] + 1;
    end;

    // Cond 2
    procedure comprobarPrincipales(var mPrincipales :real; g:galaxia);
    var
        nombre :string;
    begin
        nombre := g.nombre;
        if (
            (nombre = 'Vía Láctea') 
            or (nombre = 'Andrómeda') 
            or (nombre = 'Triángulo')
        ) then
            mPrincipales := mPrincipales + g.masa;
    end;

    // Cond 3

    procedure comprobarCond3(var cant:integer; g:galaxia);
    begin
        if ((g.tipo <> 4) and (g.distancia < 1000)) then
            cant := cant + 1;
    end;

    // Maximos y minimos(Cond 4)

    procedure reasignar(var actual:galaxia; nuevo:galaxia);
    begin
        actual.masa := nuevo.masa;
        actual.nombre := nuevo.nombre;
    end;
        // Maximos
    procedure comprobarMaximos(var m:picos; g:galaxia);
    begin
        if (g.masa >= m.primero.masa) then
            begin
                reasignar(m.segundo, m.primero);
                reasignar(m.primero, g);
            end
        else
            if(g.masa >= m.segundo.masa) then
                reasignar(m.segundo, g);
    end;
        // Minimos
    procedure comprobarMinimos(var m:picos; g:galaxia);
    begin
        if (g.masa <= m.primero.masa) then
            begin
                reasignar(m.segundo, m.primero);
                reasignar(m.primero, g);
            end
        else
            if (g.masa <= m.segundo.masa) then
                reasignar(m.segundo, g);
    end;

var
    i :integer;
    gs :galaxias;
    g:galaxia;
    maximos :picos;
    minimos :picos;
    cantidadCond1 :cantidades;
    cantidadCond3 :integer;
    masaPrincipales :real;
    masaTotal :real;

begin
    // Inicializo las cantidades por tipo
    for i:=1 to 4 do
        cantidadCond1[i] := 0;

    masaPrincipales := 0;
    masaTotal := 0;

    for i:=1 to dimF do
        begin
            leerGalaxia(gs[i]);
        end;

    for i:=1 to dimF do
        begin
            g := gs[i];
            comprobarTipo(cantidadCond1, g);
            comprobarPrincipales(masaPrincipales, g);
            comprobarCond3(cantidadCond3, g);
            comprobarMaximos(maximos,g);
            comprobarMinimos(minimos,g);
            masaTotal := masaTotal + g.masa;
        end;

    for i:=1 to 4 do
        writeln(
            'La cantidad de galaxias del tipo ', i,
            ' es ', cantidadCond1[i], '.'
        );
    
    writeln(
        'La masa acumulada de las principales es: ', masaPrincipales:8:2,
        ', ', ((masaPrincipales/masaTotal)*100):3:2, '% sobre el total.'
    );

    writeln(
        'La cantidad de galaxias no regulares que se encuentan a menos de 1000pc es:',
        cantidadCond3
    );

    writeln(
        'Las dos galaxias con menos masa son: ', 
        minimos.primero.nombre, ' y ', minimos.segundo.nombre, '.'
    );
    writeln(
        'Las dos galaxias con mayor masa son: ',
        maximos.primero.nombre, ' y ', maximos.segundo.nombre, '.'
    );

end.