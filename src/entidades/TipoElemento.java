package entidades;

import java.io.Serializable;

public class TipoElemento implements Serializable{
	
	public TipoElemento() {}

	private int iD;
	private int cantMaxReservasPendientes;
	private String nombre;
	
	public int getCantMaxReservasPendientes() {
		return cantMaxReservasPendientes;
	}
	
	public void setCantMaxReservasPendientes(int cantMaxReservasPendientes) {
		this.cantMaxReservasPendientes = cantMaxReservasPendientes;
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

	@Override
	public String toString() {
		return nombre;
	}
	
		
	@Override
	public boolean equals(Object o){														//para que es este
		return (o instanceof TipoElemento && ((TipoElemento)o).getID()==this.getID());
	}
	
	@Override
	public int hashCode(){																	//para que es este
		return ((Integer)this.getID()).hashCode();
	}

	
	
}
