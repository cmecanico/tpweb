package entidades;

import java.io.Serializable;

public class Persona extends Categoria implements Serializable{
	
	public Persona() {}

	private int iD;
	private String dni;
	private String nombre;
	private String apellido;
	private String usuario;
	private String contrase�a;
	private boolean habilitado;
	
	public Persona(int id, String dni, String nombre, String apellido, String usuario,	String contrase�a, boolean habilitado) {
		this.iD = id;
		this.dni = dni;
		this.nombre = nombre;
		this.apellido = apellido;
		this.usuario = usuario;
		this.contrase�a = contrase�a;
		this.habilitado = habilitado;
		
	}

	public String getApellido() {
		return apellido;
	}
	
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	
	public String getContrase�a() {
		return contrase�a;
	}
	
	public void setContrase�a(String contrase�a) {
		this.contrase�a = contrase�a;
	}
	
	public String getDni() {
		return dni;
	}
	
	public void setDni(String dni) {
		this.dni = dni;
	}
	
	public boolean isHabilitado() {
		return habilitado;
	}
	
	public void setHabilitado(boolean habilitado) {
		this.habilitado = habilitado;
	}
	
	public int getID() {
		return iD;
	}
	
	public void setID(int iD) {
		this.iD = iD;
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getUsuario() {
		return usuario;
	}
	
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
}
