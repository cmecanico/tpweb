package logica;

import java.util.ArrayList;

import entidades.*;
import datos.*;;

public class CtrlABMCTipoElemento {

	private ArrayList<TipoElemento> tipoelementos;
	
	public CtrlABMCTipoElemento(){				
		tipoelementos = new ArrayList<TipoElemento>();
	}
	
	public ArrayList<TipoElemento> getAll()throws Exception{
		return DataTipoElemento.getAll();
	}
	
	public void add(TipoElemento te)throws Exception{
		DataTipoElemento datatipoelemento = new DataTipoElemento();
		datatipoelemento.add(te);
	}
	
	public void delete(TipoElemento te)throws Exception{
		//Persona pEncontrada = this.buscaPersona(p);
		//personas.remove(pEncontrada);	
		DataTipoElemento datatipoelemento = new DataTipoElemento();
		datatipoelemento.delete(te);
	}
	
	public void update(TipoElemento te)throws Exception{				//mantener id al modificar?
		//Persona pEncontrada = this.buscaPersona(p);
		//personas.remove(pEncontrada);
		//personas.add(p);
		DataTipoElemento datatipoelemento = new DataTipoElemento();
		datatipoelemento.delete(te);
		datatipoelemento.add(te);
				
	}
	
	public TipoElemento consulta(TipoElemento te)throws Exception{			//no muestra id
		TipoElemento teEncontrado = this.buscaTipoElemento(te);
		return teEncontrado;
	}
	
	public TipoElemento buscaTipoElemento(TipoElemento te)throws Exception{
		/*Persona pEncontrada = null;
		for (Persona pActual : personas) {
			if (p.getDni() == pActual.getDni()){
				pEncontrada = pActual;
				break;
			}
		} */
		DataTipoElemento datatipoelemento = new DataTipoElemento();
		TipoElemento teEncontrado = datatipoelemento.getByNombre(te);
		return teEncontrado;
	}
}
