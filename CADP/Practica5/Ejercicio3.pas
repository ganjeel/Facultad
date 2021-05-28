program punteros;

type
    numeros = array[1..10000] of integer;
    puntero_numeros = ^numeros;

var
    n: puntero_numeros;
    num: numeros;
    i:integer;

begin
    writeln(sizeof(n), ' bytes');           // imprime "4 btyes"
    writeln(sizeof(num), ' bytes');         // imprime "20000 btyes"
    new(n); 
    writeln(sizeof(n^), ' bytes');          // imprime "20000 btyes"
    for i:= 1 to 5000 do 
        n^[i]:= i;
    writeln(sizeof(n^), ' bytes');          // imprime "20000 btyes"
end.
