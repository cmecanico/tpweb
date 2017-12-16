package entidades;

import java.io.Serializable;

public class Categoria implements Serializable {
	private int iD;
	private String nombre;
	
	public Categoria() {}
	
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

}
