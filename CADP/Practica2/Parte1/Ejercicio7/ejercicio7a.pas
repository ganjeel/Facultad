program alcanceYFunciones;

var
    suma, cant : integer;

    function calcularPromedio : real
    var
        prom : real;
    begin
        if(cant = 0) then // if(cant <> 0) then
            prom := -1
        else
            prom := suma / cant;

        calcularPromedio := prom;
    end;

begin  { programa principal }
    readln(suma); 
    readln(cant); 

    if(calcularPromedio <> -1) then
        begin
            // cant := 0;
            writeln(‘El promedio es: ’ , calcularPromedio:8:2)
        end;
    else
        writeln(‘Dividir por cero no parece ser una buena idea’);
end.
