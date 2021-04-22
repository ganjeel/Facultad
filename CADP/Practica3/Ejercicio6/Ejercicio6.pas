program ejercicio6;

type    
    procesador = record
        marca :string;
        linea :string;
        nucleos :integer;
        reloj :real;
        escala :integer;
    end;

    actual = record
        marca :string;
        cantidad :integer;
    end;

    maximos = record
        primera :actual;
        segunda :actual;
    end;

    procedure leerProcesador(var p:procesador);
    begin
        write('Ingrese la marca del procesador: ');
        readln(p.marca);
        write('Ingrese la linea del procesador: ');
        readln(p.linea);
        write('Ingrese la cantidad de núcleos del procesador: ');
        readln(p.nucleos);
        write('Ingrese la frecuencia de reloj del procesador: ');
        readln(p.reloj);
        write('Ingrese la escala en nm de los transistores del procesador: ');
        readln(p.escala);
    end;

    procedure incrementar(var c:integer);
    begin
        c := c + 1;
    end;

    procedure comprobarCondPrimera(p:procesador);
        function cond(p:procesador):boolean;
        begin
            cond := (p.nucleos > 2) and (p.escala <= 22);
        end;
    begin
        if (cond(p)) then
            writeln(
                'El procesador de la marca ', p.marca,
                ', linea ', p.linea, 
                ' tiene más de 2 núcleos y transistores de como mucho 22nm.'
        );
    end;

    procedure comprobarCondSegunda(var contador:integer; escala:integer);
        function cond(e:integer):boolean;
        begin
            cond := (e = 14);
        end;
    begin
        if (cond(escala)) then
            incrementar(contador);
    end;

    procedure comprobarCondTercera(var contador:integer; p:procesador);
        function cond(p:procesador):boolean;
        begin
            cond := (p.nucleos > 1) 
                and (p.reloj >= 2) 
                and ((p.marca = 'Intel') or (p.marca = 'AMD'));
        end;
    begin 
        if (cond(p)) then
            incrementar(contador);
    end;

    procedure reiniciarMarca(var m:actual; p:procesador);
    begin
        m.marca := p.marca;
        m.cantidad := 0;
    end;

    procedure comprobarMaximos(var max:maximos; m:actual);
    begin
        if (m.cantidad >= max.primera.cantidad) then
            begin
                max.segunda.cantidad := max.primera.cantidad;
                max.segunda.marca := max.primera.marca;
                max.primera.cantidad := m.cantidad;
                max.primera.marca := m.marca;
            end
        else
            if (m.cantidad >= max.segunda.cantidad) then
                begin
                    max.segunda.cantidad := m.cantidad;
                    max.segunda.marca := m.marca;
                end;
    end;


var
    p :procesador;
    marcaActual :actual;
    maximosActual :maximos;
    cantidadCondTercera :integer;
begin
    maximosActual.primera.cantidad := 0;
    maximosActual.primera.marca := ' ';
    maximosActual.segunda.cantidad := 0;
    maximosActual.segunda.marca := ' ';

    leerProcesador(p);
    reiniciarMarca(marcaActual, p);

    while (p.nucleos <> 0) do
        begin
            comprobarCondPrimera(p);
            if (p.marca <> marcaActual.marca) then
                begin
                    comprobarMaximos(maximosActual, marcaActual);
                    reiniciarMarca(marcaActual, p);
                end;

            comprobarCondSegunda(marcaActual.cantidad, p.escala);
            comprobarCondTercera(cantidadCondTercera, p);

            leerProcesador(p);
        end;

    writeln('Las dos marcas con mayor cantidad de procesadores de 14nm son: ');
    writeln('1- ', maximosActual.primera.marca);
    writeln('2- ', maximosActual.segunda.marca);

    writeln(
        'La cantidad de procesadores multicore de ', 
        'Intel o AMD con reloj de almenos 2Ghz es: ', 
        cantidadCondTercera
    );
end.