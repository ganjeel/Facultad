program github;

type
    participante = record
        pais :string;
        codigoProyecto :integer;
        nombreProyecto :string;
        rol :1..5;
        horas :real;
        monto :real;
    end;

    proyecto = record
        codigo :integer;
        montoTotal :real;
        cantidadArqs :integer;
    end;

    proyectos = array[1..1000] of proyecto;

    roles = array[1..5] of real;

    
    procedure leerParticipante(var p:participante);
    begin
        write('Ingrese el país del participante: ');
        readln(p.pais);
        write('Ingrese el código del proyecto: ');
        readln(p.codigoProyecto);
        write('Ingrese el nombre del proyecto: ');
        readln(p.nombreProyecto);
        writeln('Ingrese el rol del participante [1-Analista Funcional / 2-Programador / 3-Administrador de bases de datos / 4-Arquitecto de software / 5-Administrador de redes y seguridad]: ');
        readln(p.rol);
        write('Ingrese la cantidad de horas dedicadas: ');
        readln(p.horas);
        
    end;

    procedure calcularMonto(var p:participante; r:roles);
    begin
        p.monto := p.horas * r[p.rol];
    end;

    function esArgentino(pais:string):boolean;
    begin
        esArgentino := pais = 'Argentina';
    end;

    function esAdminDB(rol:integer):boolean;
    begin
        esAdminDB := rol = 3;
    end;

    procedure acumularMontoProyecto(var proy:proyectos; part:participante);
    var
        montoProyecto :real;
    begin
        montoProyecto := proy[part.codigoProyecto].montoTotal;
        montoProyecto := montoProyecto + part.monto;
        proy[part.codigoProyecto].montoTotal := montoProyecto;
    end;

    procedure comprobarMinMonto(var minimo:proyecto; p:proyecto);
    begin
        if (p.montoTotal <= minimo.montoTotal) then
            begin
                minimo.montoTotal := p.montoTotal;
                minimo.codigo := p.codigo;
            end;
    end;

    procedure incrementarCantArqs(var proy:proyectos; part:participante);
    var
        cantArqs :integer;
    begin
        if (part.rol = 4) then
            begin
                cantArqs := proy[part.codigoProyecto].cantidadArqs;
                cantArqs := cantArqs + 1;
                proy[part.codigoProyecto].cantidadArqs := cantArqs;
            end;
    end;

    procedure informarArqs(p:proyectos);
    var
        i:integer;
    begin
        for i:=1 to 1000 do
            writeln(
                'La cantidad de arquitectos de software en el proyecto ', 
                i, 'es: ', p[i].cantidadArqs 
            );
    end;

var
    p :participante;
    proy :proyectos;
    r :roles;
    minimo :proyecto;
    montoTotalArg, horasTotalAdminDB :real;
    i :integer;



begin
    montoTotalArg := 0;
    horasTotalAdminDB := 0;
    minimo.montoTotal := 99999;

    r[1] := 35.2;
    r[2] := 27.45;
    r[3] := 31.03;
    r[4] := 44.28;
    r[5] := 39.87; 

    leerParticipante(p);
    while (p.codigoProyecto <> -1) do
        begin
            calcularMonto(p,r);
            if (esArgentino(p.pais)) then
                montoTotalArg := montoTotalArg + p.monto;
            if (esAdminDB(p.rol)) then
                horasTotalAdminDB := horasTotalAdminDB + p.horas;
            acumularMontoProyecto(proy,p);
            incrementarCantArqs(proy,p);
            leerParticipante(p);
        end;

    for i:=1 to 1000 do
        begin
            writeln(
                'La cantidad de arquitectos de software para el proyecto ', i,
                ' es: ', proy[i].cantidadArqs
            );
            comprobarMinMonto(minimo, proy[i]);
        end;

    writeln(
        'El monto total invertido en desarrolladores con residenciaen Argentina es :',
        montoTotalArg
    );
    writeln(
        'La cantidad total de horas trabajadas por Administradoresde bases de datos es: ',
        horasTotalAdminDB
    );
    writeln(
        'El código del proyecto con menor monto invertido es: ', minimo.codigo
    );
end.