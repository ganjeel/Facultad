program alcanceYFunciones;

var
    suma, cant, promedio : integer;

    function calcularPromedio : real
    var
        promedio : real;
    begin
        if( cant = 0 ) then
            promedio := -1
        else
            promedio := suma / cant;

        calcularPromedio := promedio;
    end;

begin  { programa principal }
    readln(suma); 
    readln(cant); 

    promedio := calcularPromedio

    if( promedio <> -1 ) then
        writeln(‘El promedio es: ’ , promedio:8:2)
    else
        writeln(‘Dividir por cero no parece ser una buena idea’);
end.