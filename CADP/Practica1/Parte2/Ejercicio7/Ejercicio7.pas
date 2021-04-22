program ejercicio7;

var
    i :integer;

    nombrePiloto,
    nombrePrimerPuesto,
    nombreSegundoPuesto,
    nombreUltimoPuesto,
    nombreAnteultimoPuesto
    :string;

    tiempoPiloto,
    tiempoPrimerPuesto,
    tiempoSegundoPuesto,
    tiempoUltimoPuesto,
    tiempoAnteultimoPuesto
    :real;

begin

    tiempoPrimerPuesto := 9999;
    tiempoSegundoPuesto := 9999;
    tiempoUltimoPuesto := 0;
    tiempoAnteultimoPuesto := 0;

    nombrePrimerPuesto := '';
    nombreSegundoPuesto := '';
    nombreUltimoPuesto := '';
    nombreAnteultimoPuesto := '';

    for i:=1 to 10 do
        begin
            write('Ingrese el nombre del piloto: ');
            readln(nombrePiloto);
            write('Ingrese el tiempo que hizo el pilo: ');
            readln(tiempoPiloto);

            if ( tiempoPiloto < tiempoPrimerPuesto ) then
                begin
                    tiempoSegundoPuesto := tiempoPrimerPuesto;
                    tiempoPrimerPuesto := tiempoPiloto;

                    nombreSegundoPuesto := nombrePrimerPuesto;
                    nombrePrimerPuesto := nombrePiloto;
                end
            else
                if ( tiempoPiloto < tiempoSegundoPuesto ) then
                    begin
                        tiempoSegundoPuesto := tiempoPiloto;
                        nombreSegundoPuesto := nombrePiloto;
                    end
                else

                    if ( tiempoPiloto > tiempoUltimoPuesto ) then
                        begin
                            tiempoAnteultimoPuesto := tiempoUltimoPuesto;
                            tiempoUltimoPuesto := tiempoPiloto;

                            nombreAnteultimoPuesto := nombreUltimoPuesto;
                            nombreUltimoPuesto := nombrePiloto;
                        end
                    else 
                        if ( tiempoPiloto > tiempoAnteultimoPuesto ) then
                            begin
                                tiempoAnteultimoPuesto := tiempoPiloto;
                                nombreAnteultimoPuesto := nombrePiloto;
                            end;
        end;

    write(
        'El primer puesto fué: ', nombrePrimerPuesto,
        '; el segundo puesto fué: ', nombreSegundoPuesto,
        '; el anteúltimo puesto fué: ', nombreAnteultimoPuesto,
        '; el último puesto fué: ', nombreUltimoPuesto,
        '.'
    );

end.