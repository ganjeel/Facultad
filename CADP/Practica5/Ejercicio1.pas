program punteros;

type 
    cadena = string[50];
    puntero_cadena = ^cadena;

var
    pc: puntero_cadena;

begin
    writeln(sizeof(pc), ' bytes');          // imprime "4 btyes"
    new(pc);
    writeln(sizeof(pc), ' bytes');          // imprime "4 btyes"
    pc^:= 'un nuevo nombre';
    writeln(sizeof(pc), ' bytes');          // imprime "4 bytes"
    writeln(sizeof(pc^), ' bytes');         // imprime "51 btyes"
    pc^:= 'otro nuevo nombre distinto al anterior';
    writeln(sizeof(pc^), ' bytes');         // imprime "51 btyes"
    end.



