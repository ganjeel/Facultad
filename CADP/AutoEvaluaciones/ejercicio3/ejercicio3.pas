program cantidades;

var
   cantidad, cantidadTotal : integer;

begin
   cantidadTotal := 0;

   repeat
       writeln('Ingrese la cantidad de productos de una caja');

       readln(cantidad);

       cantidadTotal := cantidadTotal + cantidad;

   until (cantidad = 100);

   writeln(cantidadTotal);

end.