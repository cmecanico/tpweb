function setInputsConfirmaTipo(id, nombre){
	
	document.getElementById("labelNombre").innerHTML = nombre;
	
	var inputId = $('#id'),
		inputNombre = $('#nombre');
	
	inputId.val(id);
	inputNombre.val(nombre);
}