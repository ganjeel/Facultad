program distancia;

type
    puntoR2 = array[1..2] of real;

function distancia(P1:puntoR2 ; P2:puntoR2): real;
begin
    distancia := sqrt(sqr(P2[1]-P1[1])+sqr(P2[2]-P1[2]));
end;

var
    A, B :puntoR2;
    salir :boolean;
    prompt :char;

begin

    salir := false;

    while not salir do

        begin
            write('Ingrese la coordenada en x del primer punto: ');
            readln(A[1]);
            write('Ingrese la coordenada en y del primer punto: ');
            readln(A[2]);
            write('Ingrese la coordenada en x del segundo punto: ');
            readln(B[1]);
            write('Ingrese la coordenada en y del segundo punto: ');
            readln(B[2]);

            writeln('La distancia entre ambos puntos es: ', distancia(A,B):2:2);

            writeln('Calcular otra distancia? [y/n]: ');
            readln(prompt);
            if prompt = 'n' then
                salir := true;
        end;

end.