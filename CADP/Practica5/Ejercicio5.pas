Program Alocacion_Dinamica;
Type
    TEmpleado = record
        sucursal: char;
        apellido: string[25];
        correoElectrónico: string[40];
        sueldo: real;
    end;
    Str50 = string[50];
Var
    alguien: TEmpleado;
    PtrEmpleado: ^TEmpleado;
Begin
    {Suponer que en este punto se cuenta con 400.000 bytes de memoria disponible(I)}
    Readln( alguien.apellido );
    {Pensar si la lectura anterior ha hecho variar lacantidad de memoria(II)}
    // No, la memoria que ocupa el registro fue reservada en el momento de su declaración (línea 11)
    New( PtrEmpleado );
    {¿Cuánta memoria disponible hay ahora?(III)}
    // En este momento la memoria estática permeanece igual ya que el puntero fue declarado
    // en la línea 12, sin embargo la memoria dinámica disminuye 72 bytes porque se crea
    // un registro TEmpleado en la misma, memoria disponible= 399928 bytes
    Readln( PtrEmpleado^.Sucursal, PtrEmpleado^.apellido);
    Readln( PtrEmpleado^.correoElectrónico, PtrEmpleado^.sueldo);
    {¿Cuánta memoria disponible hay ahora?(IV)}
    // Permanece como en el punto anterior : 399928 bytes
    Dispose( PtrEmpleado );
    {¿Cuánta memoria disponible hay ahora?(V)}
    // Se elimina la referencia y el espacio reservado para el registro, la memoria
    // vuelve a estar como al principio de la ejecución principal del programa
    // 400000 bytes
end.
