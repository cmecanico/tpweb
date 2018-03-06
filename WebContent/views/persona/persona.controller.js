function setInputsModificar(id, nombre, apellido, dni, usuario, contrasenia, habilitado) { 
	
	var inputId = $('#field_idModificar'),
		inputNombre = $('#field_nombreModificar'),
		inputApellido = $('#field_apellidoModificar'),
		inputDni = $('#field_dniModificar'),
		inputUsuario = $('#field_usuarioModificar'),
		inputContrasenia = $('#field_contraseniaModificar'),
		inputHabilitado = $('#field_habilitadoModificar');
	
	inputId.val(id);
	inputNombre.val(nombre);
	inputApellido.val(apellido);
	inputDni.val(dni);
	inputUsuario.val(usuario);
	inputContrasenia.val(contrasenia);
	inputHabilitado.val(habilitado);
}

function setInputsEliminar(id) {  
	
	var inputId = $('#field_idEliminar');
	
	inputId.val(id);
}

function validarAlta() {
	var nombre = document.getElementById("nombre"),
		apellido = document.getElementById("apellido"),
		dni = document.getElementById("dni"),
		usuario = document.getElementById("usuario"),
		contrasenia = document.getElementById("contrasenia");
	
	if(!valideDatos(nombre, apellido, dni, usuario, contrasenia)) return false;
	else return true;
}

function validarModificacion(){
	var nombre = document.getElementById("field_nombreModificar"),
		apellido = document.getElementById("field_apellidoModificar"),
		dni = document.getElementById("field_dniModificar"),
		usuario = document.getElementById("field_usuarioModificar"),
		contrasenia = document.getElementById("field_contraseniaModificar");

	if(!valideDatos(nombre, apellido, dni, usuario, contrasenia)) return false;
	else return true;
}

function valideDatos(nombre, apellido, dni, usuario, contrasenia){
		
	var mensaje = "",
		eregDni = /^([0-9])*$/;
	
	if (nombre.value == "" || nombre.value == '' || nombre.value == null) mensaje = mensaje + "Debe completar el campo Nombre\n";
	if (apellido.value == "" || apellido.value == '' || apellido.value == null) mensaje = mensaje + "Debe completar el campo Apellido\n";
	if (dni.value == "" || dni.value == '' || dni.value == null) mensaje = mensaje + "Debe completar el campo Dni\n";
	//if (!eregDni.test(dni)) mensaje = mensaje + "El campo Dni debe contener solo numeros\n";	
	if (usuario.value == "" || usuario.value == '' || usuario.value == null) mensaje = mensaje + "Debe completar el campo Usuario\n";
	if (contrasenia.value == "" || contrasenia.value == '' || contrasenia.value == null) mensaje = mensaje + "Debe completar el campo Contraseña\n";
	
	if (mensaje != "") { alert(mensaje); return false; }
	else return true;
}