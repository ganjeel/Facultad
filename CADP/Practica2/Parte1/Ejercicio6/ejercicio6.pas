program ejercicio6;

    procedure masAlto;
    var
        numero, maximo: integer;
    begin
    
        maximo := 0;
    
        write('Ingrese un número entero: ');
        readln(numero);
        while(numero > 0) do
            begin
                if ((numero MOD 2 = 0) and (numero >= maximo)) then
                    maximo := numero;
    
                write('Ingrese un número entero: ');
                readln(numero);
            end;
    
        writeln('Fin de la carga de datos...');
        writeln('El mayor número par ingresado fué: ', maximo);
    end;
    
begin 
    masAlto;
end.