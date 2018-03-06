function setInputsModificar(id, nombre, cantidad) { 
	
	console.log("hola");
	var inputId = $('#field_idModificar'),
		inputNombre = $('#field_nombreModificar'),
		inputCantidad = $('#field_cantidadModificar');
	
	inputId.val(id);
	inputNombre.val(nombre);
	inputCantidad.val(cantidad);
}

function setInputsEliminar(id, nombre, cantidad) { 
	
	var inputId = $('#field_idEliminar');
	
	inputId.val(id);
}

function validarAlta(){
	var nombre = document.getElementById("nombre"),
		cantidad= document.getElementById("cantidad");
	
	if(!valideDatos(nombre, cantidad)) return false;
	else return true;
}

function validarModificacion(){
	var nombre = document.getElementById("field_nombreModificar"),
		cantidad = document.getElementById("field_cantidadModificar");

	if(!valideDatos(nombre, cantidad)) return false;
	else return true;
}

function valideDatos(nombre, cantidad){
		
	var mensaje = "",
		eregDni = /^([0-9])*$/;
	
	if (nombre.value == "" || nombre.value == '' || nombre.value == null) mensaje = mensaje + "Debe completar el campo Nombre\n";
	if (cantidad.value == "" || cantidad.value == '' || cantidad.value == null) mensaje = mensaje + "Debe completar el campo Cantidad\n";
	//if (!eregDni.test(cantidad)) mensaje = mensaje + "El campo Cantidad debe contener un digito\n";
	
	if (mensaje != "") { alert(mensaje); return false; }
	else return true;
}