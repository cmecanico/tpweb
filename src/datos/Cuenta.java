package datos;

import entidades.Persona;


public class Cuenta {

	private Persona personaPrueba = new Persona(1,36656656,"NoambreAdmin","ApellidoAdmin","admin","admin",true);
	
	public boolean validarUsuario(String usuario, String contraseña){
		if (usuario.equals(personaPrueba.getUsuario()) && contraseña.equals(personaPrueba.getContraseña())){
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

