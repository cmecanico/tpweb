package datos;

import entidades.Persona;


public class Cuenta {

	private Persona personaPrueba = new Persona(1,36656656,"NoambreAdmin","ApellidoAdmin","admin","admin",true);
	
	public boolean validarUsuario(String usuario, String contrase�a){
		if (usuario.equals(personaPrueba.getUsuario()) && contrase�a.equals(personaPrueba.getContrase�a())){
			return true;
		}
		else{
			return false;
		}
	}

	public Persona getPersonaPrueba() {
		return personaPrueba;
	}

	public void setPersonaPrueba(Persona personaPrueba) {
		this.personaPrueba = personaPrueba;
	}
	 
}

