package entidades;

public class Reserva {
	
	
	private int id;
	private Persona persona;
	private TipoElemento tipoelemento;
	private Elemento elemento;
	private String detalle;	
	private java.util.Date fechaYhora;
	
	/*private String fecha;
	private String hora;
	
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public String getHora() {
		return hora;
	}
	public void setHora(String hora) {
		this.hora = hora;
	}	
	
	public java.sql.Time getHora() {
		return hora;
	}
	public void setHora(java.sql.Time hora) {
		this.hora = hora;
	}
	public java.sql.Date getFecha() {
		return fecha;
	}
	public void setFecha(java.sql.Date fecha) {
		this.fecha = fecha;
	}
	*/
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public Persona getPersona() {
		return persona;
	}
	public void setPersona(Persona persona) {
		this.persona = persona;
	}
	public TipoElemento getTipoelemento() {
		return tipoelemento;
	}
	public void setTipoelemento(TipoElemento tipoelemento) {
		this.tipoelemento = tipoelemento;
	}
	public Elemento getElemento() {
		return elemento;
	}
	public void setElemento(Elemento elemento) {
		this.elemento = elemento;
	}
	public String getDetalle() {
		return detalle;
	}
	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}
	public java.util.Date getFechaYhora() {
		return fechaYhora;
	}
	public void setFechaYhora(java.util.Date fechaYhora) {
		this.fechaYhora = fechaYhora;
	}
	
}
