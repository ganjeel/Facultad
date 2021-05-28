program punteros;
type
    cadena = string[9];
    producto = record 
        codigo: integer;
        descripcion: cadena;
        precio: real;
    end;

    puntero_producto = ^producto;

var
    p: puntero_producto;
    prod: producto;

begin   
    writeln(sizeof(p), ' bytes');                   // imprime "4 bytes"
    writeln(sizeof(prod), ' bytes');                // imprime "20 bytes"
    new(p);
    writeln(sizeof(p), ' bytes');                   // imprime "4 bytes"
    p^.codigo      := 1;    
    p^.descripcion := 'nuevo producto';
    writeln(sizeof(p^), ' bytes');                  // imprime "20 bytes"
    p^.precio := 200;
    writeln(sizeof(p^), ' bytes');                  // imprime "20 bytes"
    prod.codigo := 2;
    prod.descripcion := 'otro nuevo producto';
    writeln(sizeof(prod), ' bytes');                // imprime "20 bytes"
end.
