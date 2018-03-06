function setInputsModificar(id, idpersona, idTipo, nombreTipo, idElemento, nombreElemento, detalle, fechaYhora) {

	document.getElementById("labelTipoModificar").innerHTML = nombreTipo;
	document.getElementById("labelElementoModificar").innerHTML = nombreElemento;
	
	var fecha = null,
		hora = null;
	
	var inputId = $('#field_idModificar'),
		inputIdTipo = $('#field_tipoModificar'),
		inputIdElemento = $('#field_elementoModificar'),
		inputFecha = $('#field_fechaModificar'),
		inputhora = $('#field_horaModificar'),
		inputdetalle = $('#field_detalleModificar');
	
	inputId.val(id);
	inputIdTipo.val(idTipo);
	inputIdElemento.val(idElemento);
	inputFecha.val(fecha);
	inputhora.val(hora);
	inputdetalle.val(detalle);
	
}

function setInputsEliminar(id) {  
	
	var inputId = $('#field_idEliminar');
	
	inputId.val(id);
}

function validarModificacion(){
	var fecha = document.getElementById("field_fechaModificar"),
		hora = document.getElementById("field_horaModificar"),
		detalle = document.getElementById("field_detalleModificar");
		
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