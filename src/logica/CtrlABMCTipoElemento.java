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
		DataTipoElemento datatipoelemento = new DataTipoElemento();
		datatipoelemento.delete(te);
	}
	
	public void update(TipoElemento te)throws Exception{
		DataTipoElemento datatipoelemento = new DataTipoElemento();
		datatipoelemento.update(te);	
	}
	
	public TipoElemento consulta(TipoElemento te)throws Exception{
		TipoElemento teEncontrado = this.buscaTipoElemento(te);
		return teEncontrado;
	}
	
	public TipoElemento buscaTipoElemento(TipoElemento te)throws Exception{
		DataTipoElemento datatipoelemento = new DataTipoElemento();
		TipoElemento teEncontrado = datatipoelemento.getByNombre(te);
		return teEncontrado;
	}
}
