programVectores;
    const cant_datos = 150;
type
    vdatos = array [1..cant_datos] of real;

    procedure cargarVector(varv :vdatos; vardimL :integer);
    var
        i :integer;
        numero :real;
    begin
        i := 1;

        write('Ingrese un número: ');
        readln(numero);
        while((numero <> 0) or (numero = 150)) do
            begin
                varv[i] := numero;
                i := i + 1;
                
                write('Ingrese un número: ');
                readln(numero);
            end;
        vardimL := i;
    end;
    
    procedure modificarVectorySumar(
        varv :vdatos; 
        dimL :integer; 
        n :real;
        varsuma :real);
    var 
        i :integer;
    begin
        for i:=1 to dimL do
            begin
                varsuma := varsuma + varv[i];
                varv[i] := varv[i] + n;
            end;
    end;

var
    datos :vdatos;
    i, dim :integer;
    num, suma :real;

begin
    dim := 0;
    sumaTotal := 0;
    cargarVector(datos, dim);
    writeln('Ingrese un valor a sumar');
    readln(num);
    modificarVectorySumar(datos, dim, num, sumaTotal);
    writeln('La suma de los valores es: ', suma);
    writeln('Se procesaron: ', dim, ' numeros')
end.
