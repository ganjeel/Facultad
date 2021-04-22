program planetas;

const PI = 3.14;
const D_TIERRA = 12700;
const D_MARTE = 6780;
const P_JUPITER = 439264;

type
    planeta = (Mercurio, Venus, Tierra, Marte, Jupiter, Saturno, Urano, Neptuno);


    procedure procesar(radio:real; var diametro, perimetro :real);
    begin
        diametro := radio * 2;
        perimetro := diametro * PI;
    end;


var
    nombre 
    :planeta;

    radio, 
    distancia,
    diametro,
    perimetro 
    :real;

    contador
    :integer;

begin
    
    diametro := 0;
    perimetro := 0;
    contador := 0;

    write('Ingrese el nombre del planeta: ');
    readln(nombre);
    write('Ingrese el radio del planeta: ');
    readln(radio);
    write('Ingrese la distancia: ');
    readln(distancia);

    while (radio <> 0) do
        begin
            
            procesar(radio, diametro, perimetro);

            if ((diametro <= D_TIERRA) and (diametro >= D_MARTE)) then
                writeln('El planeta ', nombre, ' está a ', distancia:2:8, '.');

                
            if (perimetro > P_JUPITER) then
                contador := contador + 1;

            write('Ingrese el nombre del planeta: ');
            readln(nombre);
            write('Ingrese el radio del planeta: ');
            readln(radio);
            write('Ingrese la distancia: ');
            readln(distancia);
        end;

    writeln('Hay ', contador, ' planetas con perimetro superior al de Jupiter')
end.