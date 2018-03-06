function setInputsModificar(id, nombre, idTipo) { 
	
	var inputId = $('#field_idModificar'),
		inputNombre = $('#field_nombreModificar'),
		inputIdTipo = $('#field_tipoModificar');
	
	inputId.val(id);
	inputNombre.val(nombre);
	inputIdTipo.val(idTipo);
}

function setInputsEliminar(id) {  
	
	var inputId = $('#field_idEliminar');
	
	inputId.val(id);
}

function validarAlta() {
	var nombre = document.getElementById("nombre");
	
	if(!valideDatos(nombre)) return false;
	else return true;
}

function validarModificacion(){
	var nombre = document.getElementById("field_nombreModificar");

	if(!valideDatos(nombre)) return false;
	else return true;
}

function valideDatos(nombre){
		
	var mensaje = "";
	if (nombre.value == "" || nombre.value == '' || nombre.value == null) mensaje = mensaje + "Debe completar el campo Nombre\n";
	
	if (mensaje != "") { alert(mensaje); return false; }
	else return true;
}