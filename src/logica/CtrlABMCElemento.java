 package logica;

import java.util.ArrayList;

import com.sun.org.apache.bcel.internal.generic.RET;

import entidades.Elemento;
import datos.DataElemento;
import datos.DataPersona;

public class CtrlABMCElemento {
	
private ArrayList<Elemento> elementos;
	
	public CtrlABMCElemento(){				
		elementos = new ArrayList<Elemento>();
	}
	
	public ArrayList<Elemento> getAll() throws Exception{
		DataElemento dataeles = new DataElemento();
		return dataeles.getAll();
	}
	
	public void add(Elemento el)throws Exception{
		DataElemento dataeles = new DataElemento();
		dataeles.add(el);
	}
	
	public void delete(Elemento el)throws Exception{
		DataElemento dataeles = new DataElemento();
		dataeles.delete(el);
	}
	
	public void update(Elemento el)throws Exception{			
		DataElemento dataele= new DataElemento();
		dataele.update(el);
				
	}
	
	public Elemento consulta(Elemento el)throws Exception{			
		Elemento elEncontrado = this.buscaElemento(el);
		return elEncontrado;
	}
	
	public Elemento buscaElemento(Elemento el)throws Exception{
		DataElemento dataeles = new DataElemento();
		Elemento elEncontrado = dataeles.getByNombre(el);
		return elEncontrado;
	}

}
