package logica;

import java.util.ArrayList;

import datos.DataReserva;
import entidades.Reserva;

public class CtrlReserva {
	
//private ArrayList<Elemento> elementos;
	
	//public CtrlABMCElemento(){				
		//elementos = new ArrayList<Elemento>();
	//}
	
	public void add(Reserva res)throws Exception{
		DataReserva datares = new DataReserva();
		datares.add(res);
	}
	
	public void delete(Reserva res)throws Exception{
		DataReserva datares = new DataReserva();
		datares.delete(res);
	}
	
	public void update(Reserva res)throws Exception{				//mantener id al modificar?
		DataReserva datares = new DataReserva();
		datares.delete(res);
		datares.add(res);
				
	}
	
	public Reserva consulta(Reserva res)throws Exception{			
		Reserva resEncontrada = this.buscaReserva(res);
		return resEncontrada;
	}
	
	public Reserva buscaReserva(Reserva res)throws Exception{
		DataReserva datares = new DataReserva();
		Reserva resEncontrada = datares.getByDetalle(res);			//cambiar de atributo para la busqueda
		return resEncontrada;
	}
	
	public ArrayList<Reserva> getall() throws Exception{
		DataReserva datares = new DataReserva();
		return datares.getAll();
	}



}
