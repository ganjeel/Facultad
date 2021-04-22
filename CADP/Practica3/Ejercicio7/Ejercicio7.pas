program centros;

type
    centro = record
        nombre :string;
        universidad :string;
        cantidadInvestigadores :integer;
        cantidadBecarios :integer;
    end;

    universidad = record
        nombre :string;
        cantidadCentros :integer;
        cantidadInvestigadores :integer;
        cantidadBecarios :integer;
    end;

    minimos = record
        primero :centro;
        segundo :centro;
    end;

    procedure leerCentro(var c:centro);
    begin
        write('Ingrese el nombre del centro de investigación: ');
        readln(c.nombre);
        write('Ingrese la universidad a la que pertenece: ');
        readln(c.universidad);
        write('Ingrese la cantidad de investigadores: ');
        readln(c.cantidadInvestigadores);
        write('Ingrese la cantidad de becarios: ');
        readln(c.cantidadBecarios);
    end;

    procedure informarUniversidad(u:universidad);
    begin
        writeln('La universidad ', u.nombre, ' tiene ', u.cantidadCentros, ' centros.')
    end;

    procedure reiniciarUniversidad(var u:universidad; c:centro);
    begin
        u.nombre := c.universidad;
        u.cantidadInvestigadores := 0;
        u.cantidadBecarios := 0;
    end;

    procedure actualizarInvestigadores(var u:universidad; c:centro);
    begin
        u.cantidadInvestigadores := u.cantidadInvestigadores + c.cantidadInvestigadores;
    end;

    procedure comprobarMaximo(var m:universidad; u:universidad);
    begin
        if (u.cantidadInvestigadores > m.cantidadInvestigadores) then
            begin
                m.cantidadInvestigadores := u.cantidadInvestigadores;
                m.nombre := u.nombre;
            end;
    end;

    procedure comprobarMinimos(var m:minimos; c:centro);
    begin
        if (c.cantidadBecarios <= m.primero.cantidadBecarios) then
            begin
                m.segundo.cantidadBecarios := m.primero.cantidadBecarios;
                m.segundo.nombre := m.primero.nombre;
                m.primero.cantidadBecarios := c.cantidadBecarios;
                m.primero.nombre := c.nombre;
            end
        else
            if (c.cantidadBecarios <= m.segundo.cantidadBecarios) then
                begin
                    m.segundo.cantidadBecarios := c.cantidadBecarios;
                    m.segundo.nombre := c.nombre;
                end;
    end;

var
    cenActual :centro;
    uniActual, uniMaximo :universidad;
    cenMinimo :minimos;
begin
    cenMinimo.primero.cantidadBecarios := 999;
    cenMinimo.primero.nombre := ' ';
    cenMinimo.segundo.cantidadBecarios := 999;
    cenMinimo.segundo.nombre := ' ';


    leerCentro(cenActual);
    reiniciarUniversidad(uniActual, cenActual);

    while (cenActual.cantidadInvestigadores <> 0) do
        begin
            if (cenActual.universidad <> uniActual.nombre) then
                begin
                    informarUniversidad(uniActual);
                    comprobarMaximo(uniMaximo, uniActual);
                    reiniciarUniversidad(uniActual, cenActual);
                end;
            actualizarInvestigadores(uniActual, cenActual);
            comprobarMinimos(cenMinimo, cenActual);

            uniActual.cantidadCentros := uniActual.cantidadCentros + 1;
            leerCentro(cenActual);
        end;
    
    writeln(
        'La universidad con mayor cantidad de investigadores es :',
        uniMaximo.nombre
    );
    writeln(
        'Los dos centros con menor cantidad de becarios son: ',
        cenMinimo.primero.nombre, ' y ',
        cenMinimo.segundo.nombre
    );
end.