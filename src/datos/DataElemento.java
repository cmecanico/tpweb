package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import util.AppDataException;
import entidades.Elemento;
import entidades.Persona;
import entidades.TipoElemento;

public class DataElemento {
	
	public ArrayList<Elemento> getAll() throws Exception{
		
		Statement stmt=null;
		ResultSet rs=null;
		ArrayList<Elemento> eles= new ArrayList<Elemento>();
		try {
			stmt = FactoryConexion.getInstancia()
					.getConn().createStatement();
			rs = stmt.executeQuery("select el.id, el.nombre, el.idtipo, t.nombre, t.cantmaxreservaspendientes from elemento el inner join tipoelemento t on el.idtipo = t.id");
			if(rs!=null){
				while(rs.next()){
					Elemento el = new Elemento();
					el.setTipo(new TipoElemento());
					el.setID(rs.getInt("id"));
					el.setNombre(rs.getString("el.nombre"));
					el.getTipo().setID(rs.getInt("idtipo"));
					el.getTipo().setNombre(rs.getString("t.nombre"));
					el.getTipo().setCantMaxReservasPendientes(rs.getInt("cantmaxreservaspendientes"));
					eles.add(el);
				}
			}
		} catch (SQLException e) {
			
			throw e;
		} catch (AppDataException ade){
			throw ade;
		}
		

		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			FactoryConexion.getInstancia().releaseConn();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return eles;
		
	}
	

	public Elemento getByNombre(Elemento ele) throws Exception{						
		Elemento el = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
					"select el.id, el.nombre, el.idtipo, t.nombre, t.cantmaxreservaspendientes from elemento el inner join tipoelemento t on el.idtipo = t.id where el.nombre=?");				
			stmt.setString(1, ele.getNombre());
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()){
					el = new Elemento();
					el.setTipo(new TipoElemento());
					el.setID(rs.getInt("id"));
					el.setNombre(rs.getString("el.nombre"));
					el.getTipo().setID(rs.getInt("idtipo"));
					el.getTipo().setNombre(rs.getString("t.nombre"));
					el.getTipo().setCantMaxReservasPendientes(rs.getInt("cantmaxreservaspendientes"));
			}
			
		} catch (Exception e) {
			throw e;
		} finally{
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				FactoryConexion.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
		return el;
	}
	
	public void add(Elemento el) throws Exception{
		PreparedStatement stmt=null;
		ResultSet keyResultSet=null;
		try {
			stmt=FactoryConexion.getInstancia().getConn()
					.prepareStatement(
					"insert into elemento(nombre, idtipo) values (?,?)",
					PreparedStatement.RETURN_GENERATED_KEYS
					);
			stmt.setString(1, el.getNombre());
			stmt.setInt(2, el.getTipo().getID());
			stmt.executeUpdate();
			keyResultSet=stmt.getGeneratedKeys();
			if(keyResultSet!=null && keyResultSet.next()){
				el.setID(keyResultSet.getInt(1));
			}
		} catch (SQLException | AppDataException e) {
			throw e;
		}
		try {
			if(keyResultSet!=null)keyResultSet.close();
			if(stmt!=null)stmt.close();
			FactoryConexion.getInstancia().releaseConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(Elemento el) throws Exception{						
		PreparedStatement stmt=null;
		int a;
		try {
			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
					"delete from elemento where nombre=?");
			stmt.setString(1, el.getNombre());
			a = stmt.executeUpdate();
			
		} catch (Exception e) {
			throw e;
		} finally{
			try {
				if(stmt!=null)stmt.close();
				FactoryConexion.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
	}
}


