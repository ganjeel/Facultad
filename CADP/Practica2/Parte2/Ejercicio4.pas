program programadores;

    procedure leerDatos(var legajo: integer; salario : real);   // Salario no se pasa por referencia
                                                                // Entonces no se actualiza el valor afuera del procedimiento
    begin
        writeln(‘Ingrese el nro de legajo y el salario”);
        read(legajo);
        read(salario);
    end;

    procedure actualizarMaximo(
        nuevoLegajo :integer; 
        nuevoSalario :real; 
        var maxLegajo :integer
    );
    var
        maxSalario : real;
    begin
        if (nuevoLegajo > maxLegajo) then 
            begin
                maxLegajo:= nuevoLegajo;
                maxSalario := nuevoSalario  // maxSalario es una variable local al procedimiento y no se devuelve
                                            // de ninguna forma, por lo que el algoritmo no funciona
            end;
    end;

var
    legajo, 
    maxLegajo, 
    i 
    :integer;
    salario, 
    maxSalario 
    :real;

begin
    sumaSalarios := 0; // La variable no está declarada

    for i := 1 to 130 do begin
        leerDatos(salario, legajo); // Están invertidos los parámetros y no están inicializados
        actualizarMaximo(legajo, salario, maxLegajo); // maxLegajo no está inicializada
        sumaSalarios := sumaSalarios + salario;
    end;

    writeln(‘En todo el mes se gastan ‘, sumaSalarios, ‘ pesos’);
    writeln(‘El salario del empleado más nuevo es ‘,maxSalario);
end.
