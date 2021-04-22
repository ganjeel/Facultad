program ejercicio2;

var
    i,
    numero,
    mayor,
    contador,
    orden
    :integer;

begin
    mayor := -32767;
    contador := 0;
    
    for i:=1 to 10 do
        begin
            write('Ingrese un número: ');
            readln(numero);

            contador += 1;

            if numero >= mayor then
                begin
                    mayor := numero;
                    orden := contador;
                end;
        end;

    write(
        'El mayor número leído fue el ', mayor,
        ', en la posición ', orden
    );

end.