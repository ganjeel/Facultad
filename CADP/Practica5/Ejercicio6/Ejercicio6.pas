program nombres-ciudades;
type
    {
    _ciudad = string[50]; // 51 bytes
    _ciudades = array[1..2500] of _ciudad;  // 2500 * 51 bytes = 127.500 bytes
    // supera el límite de 64kb, no sirve
    }
    
    _nombre = string[50];   // 51 bytes
    _ciudad = ^_nombre;     // 4 bytes estática - 51 bytes dinámica
    _ciudades = array[1..2500] of _ciudad;  // 2500 * 4 bytes = 10.000 bytes estática
                                            // 2500 * 51 bytes = 127.500 bytes dinámica

    procedure reservarMemoria(var ciudades:_ciudades);  
    // Es necesario pasarla por referencia, sino el puntero no está inicializado afuera del procedimiento
    begin
        new(ciudades);
    end;

    procedure leerCiudades(ciudades:_ciudades); // No es necesario pasarla por referencia
    var
        pos:integer;
        nombre: string[50];
    begin
        for pos:=1 to 2500 do
            begin
                write('Ingrese el nombre de la ciudad: ');
                readln(nombre);
                ciudades^[pos] := nombre;
            end;
    end;

var
    ciudades:_ciudades;
begin
    // b.1) La variable ocupa 10.000 bytes de memoria estática
    reservarMemoria(ciudades);
    // b.2) La cantidad de memoria reservada es 127.500 bytes en dinámica
    leerCiudades(ciudades);
end.
