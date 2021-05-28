program facebook;

const
    dimF = 200;

type
    foto = record
        titulo :string;
        autor :string;
        likes :integer;
        clics :integer;
        comentarios :integer;
    end;

    fotos = array[1..dimF] of foto;


    procedure leerFoto(var f:foto);
    begin
        write('Ingrese el título: ');
        readln(f.titulo);
        write('Ingrese el autor: ');
        readln(f.autor);
        write('Ingrese la cantidad de likes: ');
        readln(f.likes);
        write('Ingrese la cantida de clics: ');
        readln(f.clics);
        write('Ingrese la cantida de comentarios: ');
        readln(f.comentarios);
    end;

    procedure comprobarMaximo(var fMax:foto; fActual:foto);
    begin
        if (fActual.clics >= fMax.clics) then
            fMax := fActual;
    end;

var
    fs :fotos;
    maximo :foto;
    i, likesAutorCond :integer;

begin
    maximo.clics := 0;
    likesAutorCond := 0;


    // Leer datos de las fotos
    for i:=1 to dimF do
        begin
            leerFoto(fs[i]);
        end;

    // Procesar datos de las fotos
    for i:=1 to dimF do
        begin
            // Más vista
            comprobarMaximo(maximo, fs[i]);
            // Likes de Art Vandelay
            if (fs[i].autor = 'Art Vandelay') then
                likesAutorCond := likesAutorCond + fs[i].likes;
            // Cantidad de comentarios
            writeln(
                'La cantidad de comentarios para la foto es: ',
                fs[i].comentarios
            );
        end;
    
    writeln('El título de la foto más vista es: ', maximo.titulo);

end.