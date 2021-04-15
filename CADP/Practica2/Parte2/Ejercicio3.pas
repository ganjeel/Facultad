program ejercicio5;
    { suma los números entre a y b, y retorna el resultado en c }
    procedure sumar(a, b, c : integer) // No recibe result como parámetro
    var
        suma 
        :integer;
    begin
        for i := a to b do // La variable i no está declarada
            suma := suma + i;
        c := c + suma;
    end;
var
    result 
    :integer;

begin
    result := 0;
    readln(a);  // La variable no está declarada 
    readln(b);  // La variable no está declarada
    sumar(a, b, 0);
    write(‘La suma total es ‘, result); // Result nunca se utilizó, sigue valiendo 0
    { averigua si el resultado final estuvo entre 10 y 30}
    ok := (result >= 10) or (result <= 30); // Para cualquier valor de a y b estó da siempre true
    if (not ok) then
        write (‘La suma no quedó entre 10 y 30’);
end.