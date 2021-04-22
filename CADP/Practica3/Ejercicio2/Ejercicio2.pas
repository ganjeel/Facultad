program casamientos;

type
    fechaCasamiento = record
        dia: 1..31;
        mes: 1..12;
        anio: 2000..2099;
        invalida: boolean;
    end;

    procedure leer(var fecha : fechaCasamiento);
    begin
        write('Ingrese el año del casamiento: ');
        readln(fecha.anio);
        if (fecha.anio <> 2020) then
            begin
                fecha.invalida := false;
                write('Ingrese el día del casamiento: ');
                readln(fecha.dia);
                write('Ingrese el mes del casamiento: ');
                readln(fecha.mes);
            end
        else
            fecha.invalida := true;
    end;

    procedure comprobarVerano( fecha :fechaCasamiento; var cantidad :integer);
        function cumple(mes :integer):boolean;
        begin
            cumple := (mes <= 3);
        end;
    begin
        if (cumple(fecha.mes)) then
            cantidad := cantidad + 1;
    end;

    procedure comprobarPrimerosDias(fecha :fechaCasamiento; var cantidad :integer);
        function cumple(dia :integer):boolean;
        begin   
            cumple := (dia <= 10);
        end;
    begin
        if (cumple(fecha.dia)) then
            cantidad := cantidad + 1;
    end;

var
    fecha :fechaCasamiento;
    casamientosVerano, casamientosPrimeriosDias :integer;
    

begin
    casamientosVerano := 0;
    casamientosPrimeriosDias := 0;

    leer(fecha);
    while (not fecha.invalida) do
        begin
            comprobarVerano(fecha, casamientosVerano);

            comprobarPrimerosDias(fecha, casamientosPrimeriosDias);

            leer(fecha);
        end;

    writeln('La cantidad de casamientos en verano fue: ', casamientosVerano);
    writeln('La cantidad de casamientos en los primeros 10 días de cada mes fue: ', casamientosPrimeriosDias);

end.