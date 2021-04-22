program concesionaria;

type
    vehiculo = record
        marca :string;
        modelo :string;
        precio :real;
    end;

    actuales = record
        marca :string;
        acumulador :real;
        contador :integer;
    end;

    procedure leerVehiculo(var v:vehiculo);
    begin
        write('Ingrese la marca del vehiculo: ');
        readln(v.marca);
        write('Ingrese el modelo del vehiculo: ');
        readln(v.modelo);
        write('Ingrese el precio del vehiculo: ');
        readln(v.precio);
    end;

    procedure procesarVehiculo(var m:actuales; precio :real);
        procedure acumular(var a:real; c :real);
        begin
            a := a + c;
        end;
        procedure incrementar(var c :integer);
        begin
            c := c + 1;
        end;
    begin
        acumular(m.acumulador, precio);
        incrementar(m.contador);
    end;

    procedure imprimirPromedio(m:actuales);
    var
        promedio: real;
    begin
        promedio := m.acumulador / m.contador;
        writeln('El costo medio para la marca ', m.marca ,' es: ', promedio:8:2);
    end;

    procedure reiniciarMarca(var m:actuales; marca:string);
    begin
        m.acumulador := 0;
        m.contador := 0;
        m.marca := marca;
    end;
    procedure comprobarMaximo(var maximo:vehiculo; v :vehiculo);
        procedure actualizar(var m:vehiculo; v:vehiculo);
        begin
            m.marca := v.marca;
            m.modelo := v.modelo;
            m.precio := v.precio;
        end;    
    begin
        if (v.precio >= maximo.precio) then
            actualizar(maximo, v);
    end;

var
    marcaActual :actuales;
    vehiculoActual, maximo :vehiculo;
begin
    leerVehiculo(vehiculoActual);
    reiniciarMarca(marcaActual, vehiculoActual.marca);

    while(marcaActual.marca <> 'ZZZ') do
        begin
            comprobarMaximo(maximo, vehiculoActual);

            if (vehiculoActual.marca = marcaActual.marca) then
                procesarVehiculo(marcaActual, vehiculoActual.precio)
            else
                begin
                    imprimirPromedio(marcaActual);
                    reiniciarMarca(marcaActual, vehiculoActual.marca);
                    procesarVehiculo(marcaActual, vehiculoActual.precio);
                end;

            leerVehiculo(vehiculoActual);
        end;
    
    writeln('La marca y modelo del auto más caro son: ', maximo.marca, ' y ', maximo.modelo);
end.

