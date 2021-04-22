program soja;

const precioSoja = 320;

	function determinarRendimiento(zona:integer):real;
	begin
		case zona of
			1: determinarRendimiento := 6;
			2: determinarRendimiento := 2.6;
			3: determinarRendimiento := 1.4;
		else
			begin
				write('La zona ingresada no es correcta...');
				determinarRendimiento := 0;
			end
		end;
	end;
	
	function calcularRendimiento(hectareas, rendimiento :real):real;
	begin
		calcularRendimiento := hectareas * rendimiento * precioSoja;
	end;

	procedure nuevoPico(
		var pico:real; 
		var referencia:string;
		nuevoPico:real; 
		nuevaReferencia:string
	);
	begin
		pico := nuevoPico;
		referencia := nuevaReferencia;
	end;
	
	procedure comprobarPicos(
		var rendimientoMaximo, rendimientoMinimo :real; 
		var localidadMaximo, localidadMinimo :string;
		rendimiento :real;
		localidad :string
	);
	begin
		if rendimiento >= rendimientoMaximo then
			nuevoPico(rendimientoMaximo, localidadMaximo, rendimiento, localidad)
		else
			if rendimiento <= rendimientoMinimo then
				nuevoPico(rendimientoMinimo, localidadMinimo, rendimiento, localidad);
	end;

	procedure comprobarCondicion(rendimiento:real; localidad:string; var cantidad :integer);
	begin
		if ((localidad = 'Tres de Febrero') and (rendimiento > 10000)) then
			cantidad := cantidad + 1;
	end;


var
    localidad,
	localidadMaximo,
	localidadMinimo
    :string;
    zona,
    cantidadCampos,
    cantidadCamposCumplenCond
    :integer;
    hectareas,
    rendimiento,
    rendimientoPorHa,
    rendimientoMaximo,
    rendimientoMinimo,
    rendimientoAcumulado,
    rendimientoPromedio
    :real;
    

begin

	localidadMaximo := '';
	localidadMinimo := '';

	rendimientoMaximo := 0;
	rendimientoMinimo := 999;
	
	rendimientoAcumulado := 0;
	rendimientoPromedio := 0;

	cantidadCampos := 0;
	cantidadCamposCumplenCond := 0;

    repeat
        
        write('Ingrese la localidad: ');
        readln(localidad);
        write('Ingrese la cantidad de has sembrada: ');
        readln(hectareas);
        write('Ingrese el tipo de zona [1, 2, 3]');
        readln(zona);


		rendimientoPorHa := determinarRendimiento(zona);
		
		rendimiento := calcularRendimiento(hectareas, rendimientoPorHa);

		comprobarPicos(		
			rendimientoMaximo, rendimientoMinimo, 
			localidadMaximo, localidadMinimo,
			rendimiento,
			localidad
		);

		comprobarCondicion(rendimiento, localidad, cantidadCamposCumplenCond);

		cantidadCampos := cantidadCampos + 1;
		rendimientoAcumulado := rendimientoAcumulado + rendimiento;

    until (localidad = 'Saladillo');

	rendimientoPromedio := rendimientoAcumulado / cantidadCampos;

	writeln('La cantidad de campos de la localidad Tres de Febrerocon rendimiento estimado superior a U$S 10.000 es:', cantidadCamposCumplenCond);
	writeln('La localidad del campo con mayor rendimiento económicoesperado es: ', localidadMaximo);
	writeln('La localidad del campo con menor rendimiento económicoesperado es: ', localidadMinimo);
	writeln('El rendimiento económico promedio es: ', rendimientoPromedio);

end.
