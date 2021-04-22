program ejercicio3;

const 
    pi = 3.14;

var
    tipoTanque: char;

    ancho,
    largo,
    alto,
    radio,
    base,
    volumen,
    volumenCilindricosPromedio,
    volumenRectangularesPromedio,
    volumenPrimerMaximo,
    volumenSegundoMaximo
    :real;

    cantidadCilindricos,
    cantidadRectangulares
    cantidadAlturaCond,
    cantidadVolumenCond,
    :integer;

begin

    cantidadRectangulares := 0;
    cantidadCilindricos := 0;
    volumenRectangularesPromedio := 0;
    volumenCilindricosPromedio := 0;

    cantidadAlturaCond := 0;
    cantidadVolumenCond := 0;

    volumenPrimerMaximo := 0;
    volumenSegundoMaximo := 0;

    write('Ingres el tipo de tanque [R/C]: ');
    readln(tipoTanque);

    while tipoTanque <> 'Z' do
        begin
            case tipoTanque of
                'R': begin
                    write('Ingrese el ancho: ');
                    readln(ancho);
                    write('Ingrese el largo: ');
                    readln(largo);
                    base := ancho*largo;
                end;

                'C': begin
                    write('Ingrese el radio: ');
                    readln(radio);
                    base := radio*pi*pi;
                end;
            else
                begin
                    writeln('No se reconoce el tipo de tanque');
                    base := 0;
                    alto := 0;
                end;
            end;

            if base <> 0 then
                begin
                    write('Ingrese el alto: ');
                    readln(alto);
                end;

            volumen := base * alto;
        
            if volumen >= volumenPrimerMaximo then
                begin
                    volumenSegundoMaximo := volumenPrimerMaximo;
                    volumenPrimerMaximo := volumen;
                end
            else
                if volumen >= volumenSegundoMaximo then
                    volumenSegundoMaximo := volumen;

            case tipoTanque of
                'R': begin
                    volumenRectangularesPromedio := volumenRectangularesPromedio + volumen;
                    cantidadRectangulares := cantidadCilindricos + 1;
                end; 

                'C': begin
                    volumenCilindricosPromedio := volumenCilindricosPromedio + volumen;
                    cantidadCilindricos := cantidadCilindricos + 1;
                end;
            else
                begin
                    writeln('No se reconoce el tipo de tanque');
                    base := 0;
                    alto := 0;
                end;
            end;

            if ((alto < 1.40) and (alto > 0)) then
                cantidadAlturaCond := cantidadAlturaCond + 1;
                
            if ((volumen < 800) and (volumen > 0)) then
                cantidadVolumenCond := cantidadVolumenCond + 1;
            
            write('Ingres el tipo de tanque [R/C]: ');
            readln(tipoTanque);
        end;
    
    volumenRectangularesPromedio := volumenRectangularesPromedio / cantidadRectangulares;
    volumenCilindricosPromedio := volumenCilindricosPromedio / cantidadCilindricos;

    writeln(
        'El volumen de los dos mayoes tanques vendidos es: ', 
        volumenPrimerMaximo:8:2,
        ' y ',
        volumenSegundoMaximo:8:2
    );
    writeln(
        'El volumen promedio de todos los tanques cilíndricos vendidos es: ',
        volumenCilindricosPromedio:8:2
    );
    writeln(
        'El volumen promedio de todos los tanques rectangulares vendidos es: ',
        volumenRectangularesPromedio:8:2
    );
    writeln(
        'La cantidad de tanques cuyo alto es menor a 1.4 metros es: ', cantidadAlturaCond
    );
    writeln(
        'La cantidad de tanques cuyo volumen es menor a 800 m3 es: ', cantidadVolumenCond
    );

end.