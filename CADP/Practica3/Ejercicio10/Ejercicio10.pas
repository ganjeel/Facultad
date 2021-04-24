program plantas;

type
    _planta = record
        nombre :string;
        longevidad :integer;
        tipo :string;
        clima :string;
        cantidadPaises :integer;
    end;

    _tipo = record
        tipo :string;
        acumulador :integer;
        contador :integer;
    end;

    _pico = record
        ref :string;
        val :integer;
    end;
    
    _maximos = record
        primero :_pico;
        segundo :_pico;
    end;

    // Utilidades
    procedure incrementar(var c:integer);
    begin
        c := c + 1;
    end;

    procedure acumular(var a:integer; val:integer);
    begin
        a := a + val;
    end;

    // Datos
    procedure leer(var planta:_planta);
    begin
        with planta do
        begin
            write('Ingrese el nombre de la planta: ');
            readln(nombre);
            write('Ingrese la longevidad en meses: ');
            readln(longevidad);
            write('Ingrese el tipo de planta: ');
            readln(tipo);
            write('Ingres el clima: ');
            readln(clima);
        end;
    end;

    procedure leerPais(var pais:string; var c:integer);
    begin
        write('Ingrese el nombre de un pais: ');
        readln(pais);
        incrementar(c);
    end;

    // Cond 1
    procedure comprobarCond1(var minimo:_pico; tipo:_tipo);
    begin
        if (tipo.contador <= minimo.val) then
            begin
                minimo.val := tipo.contador;
                minimo.ref := tipo.tipo;
            end;
    end;

    // Cond 2
    procedure informarCond2(tipo:_tipo);
    begin
        with tipo do
            begin
                writeln(
                    'El promedio de vida de las plantas del tipo ', tipo, 
                    ' es ', acumulador/contador:8:2,'.'
                );
            end;
    end;

    procedure reiniciarCond2(var tipo:_tipo; nuevoTipo:string);
    begin
        with tipo do
            begin
                tipo := nuevoTipo;
                acumulador := 0;
                contador := 0;
            end;
    end;

    // Cond 3
    procedure comprobarCond3(var max:_maximos; p:_planta);
    begin
        if (p.longevidad >= max.primero.val) then
            begin
                max.segundo.val := max.primero.val;
                max.segundo.ref := max.primero.ref;
                max.primero.val := p.longevidad;
                max.primero.ref := p.nombre;
            end
        else
            if (p.longevidad >= max.segundo.val) then
                begin
                    max.segundo.val := p.longevidad;
                    max.segundo.ref := p.nombre;
                end;
    end;

    // Cond 4
    procedure comprobarCond4(p :_planta; pais :string);
    begin
        if ((pais = 'Argentina') and (p.clima = 'Subtropical')) then
            writeln(
                'La planta ', p.nombre, 
                ' es nativa de Argentina y se encuentra en regiones con clima subtropical.'
            );
    end;

    // Cond 5
    procedure comprobarCond5(var max:_pico; p:_planta);
    begin
        if (p.cantidadPaises >= max.val) then
            begin
                max.val := p.cantidadPaises;
                max.ref := p.nombre;
            end;
    end;


var
    i :integer;
    planta :_planta;
    pais :string;
    tipoActual :_tipo;
    minimo :_pico;
    maximo :_pico;
    maximos :_maximos;

begin
    with tipoActual do
        begin
            tipo := ' ';
            acumulador := 0;
            contador := 0;
        end;

    minimo.val := 999;
    maximo.val := 0;
    maximos.primero.val := 0;
    maximos.segundo.val := 0;

    for i:=1 to 320 do
        begin
            leer(planta);
            leerPais(pais, planta.cantidadPaises);
            while (pais <> 'ZZZ') do 
                begin
                    comprobarCond4(planta,pais);
                    leerPais(pais, planta.cantidadPaises);
                end;
            
            // Manejo cambio de tipo
            if (planta.tipo <> tipoActual.tipo) then
                begin
                    comprobarCond1(minimo, tipoActual); // Cumple cond 1
                    informarCond2(tipoActual);  // Cumple cond 2
                    reiniciarCond2(tipoActual, planta.tipo);
                end;

            acumular(tipoActual.acumulador, planta.longevidad); //  Guardo los valores de longevidad del tipo
            incrementar(tipoActual.contador);   // Incremento contador de plantas del tipo

            comprobarCond3(maximos, planta); // Cumple cond 3

            comprobarCond5(maximo, planta); // Cumple cond 5

        end;
    
    writeln('EL tipo de planta con menor cantidad de plantas es : ', minimo.ref);
    writeln(
        'Las dos plantas más longevas son : ', maximos.primero.ref, 
        ' y ', maximos.segundo.ref, 
        '.'
    );
    writeln('La planta que se encuentra en más paises es: ', maximo.ref);
end.