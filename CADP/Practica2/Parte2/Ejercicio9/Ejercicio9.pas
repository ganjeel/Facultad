program ejercicio9;

    procedure descomponerNumero(numero: integer; var suma, cantidad: integer);
    begin
        while (numero <> 0) do
            begin
                suma := suma + numero MOD 10;            
                cantidad := cantidad + 1;
                numero := numero DIV 10;
            end;
    end;

var
    numero,
    sumaDigitos,
    cantidadTotalDigitos
    :integer;

begin
    cantidadTotalDigitos := 0;

    repeat
        sumaDigitos := 0;

        write('Ingrese un numero entero: ');
        readln(numero);

        descomponerNumero(numero, sumaDigitos, cantidadTotalDigitos);

    until (sumaDigitos = 10);
    
    writeln('La cantidad de digitos es: ', cantidadTotalDigitos);

end.