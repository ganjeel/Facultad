// a)

// program punteros;
// type
//     cadena = string[50];
//     puntero_cadena = ^cadena;
// var
//     pc: puntero_cadena;
// begin
//     pc^:= 'un nuevo texto';     // No se puede realizar la asignación 
//                                 // sin haber llamado a la función new()
//     new(pc);
//     writeln(pc^);
// end.

// b)

// program punteros;
// type
//     cadena = string[50];
//     puntero_cadena = ^cadena;
// var
//     pc: puntero_cadena;
// begin
//     new(pc);
//     pc^:= 'un nuevo nombre';
//     writeln(sizeof(pc^), ' bytes');     // imprime "51 bytes"
//     writeln(pc^);                       // imprime "un nuevo nombre"
//     dispose(pc);                                   
//     pc^:= 'otro nuevo nombre';          // error, el programa compila pero se rompe
// end.

// c)

// program punteros;
// type
//     cadena = string[50];
//     puntero_cadena = ^cadena;
//     procedure cambiarTexto(pun: puntero_cadena);
//         begin
//             pun^:= 'Otro texto';
//         end;
// var
//     pc: puntero_cadena;
// begin
//     new(pc);
//     pc^:= 'Un texto';
//     writeln(pc^);                           // imprime "Un texto"
//     cambiarTexto(pc);
//     writeln(pc^);                           // imprime "Otro texto"
// end.

// d)

// program punteros;
// type
//     cadena = string[50];
//     puntero_cadena = ^cadena;
//     procedure cambiarTexto(pun: puntero_cadena);
//     begin
//         new(pun);               // Si no se hace el dispose la referencia sigue siendo la misma
//         pun^:= 'Otro texto';
//     end;
// var
//     pc: puntero_cadena;
// begin
//     new(pc);
//     pc^:= 'Un texto';
//     writeln(pc^);
//     cambiarTexto(pc);
//     writeln(pc^);               // En ambos casos imprime "Un texto"
// end.
