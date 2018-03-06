function setInputsConfirmaElemento(idTipo, nombreTipo, idElemento, nombreElemento){
	
	document.getElementById("labelTipo").innerHTML = nombreTipo;
	document.getElementById("labelElemento").innerHTML = nombreElemento;
	
	var inputIdTipo = $('#tipo'),
		inputIdElemento = $('#elemento');
	
	inputIdTipo.val(idTipo);
	inputIdElemento.val(idElemento);
}

function validarAlta(){
	var fecha = document.getElementById("fecha"),
		hora = document.getElementById("hora"),
		detalle = document.getElementById("detalle");
	
	if(!valideDatos(fecha, hora, detalle)) return false;
	else return true;
}

function valideDatos(fecha, hora, detalle){
	
	var mensaje = "";	
	
	if (fecha.value == "" || fecha.value == '' || fecha.value == null) mensaje = mensaje + "Debe completar el campo Fecha\n";
	if (hora.value == "" || hora.value == '' || hora.value == null) mensaje = mensaje + "Debe completar el campo Hora\n";
	if (detalle.value == "" || detalle.value == '' || detalle.value == null) mensaje = mensaje + "Debe completar el campo Detalle\n";
	
	if (mensaje != "") { alert(mensaje); return false; }
	else return true;
}