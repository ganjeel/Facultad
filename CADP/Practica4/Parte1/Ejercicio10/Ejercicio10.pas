program turismo;


const
    dimF = 300;


type
    empleados = array[1..dimF] of real;


    procedure incrementarSalario(var e:empleados; x:real; dimL:integer);
        procedure incrementar(var s:real; x:real);
        begin
            s := s * (1 + x);
        end;
    var
        i :integer;
    begin
        for i:=1 to dimL do
            begin
                incrementar(e[i], x);
            end;
    end;

    procedure imprimirSueldoPromedio(e:empleados; dimL:integer);
    var
        i :integer;
        total :real;
    begin
        total := 0;
        for i:=1 to dimL do
            begin
                total := total + e[i];
            end;
        writeln('El promedio de los sueldos es: ', (total/dimL):8:2);
    end;


var
    e:empleados;
    i:integer;
    sueldo:real;


begin
    i := 0;
    
    write('Ingrese el sueldo del empleado: ');
    readln(sueldo);
    while ((sueldo <> 0) and (i<dimF)) do
        begin
            i := i + 1;
            e[i] := sueldo;
            
            write('Ingrese el sueldo del empleado: ');
            readln(sueldo);
        end;

    incrementarSalario(e, 0.15, i);
    imprimirSueldoPromedio(e, i);
end.