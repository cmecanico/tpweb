package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import util.AppDataException;
import entidades.Elemento;
import entidades.TipoElemento;
import entidades.Reserva;

public class DataReserva {
	
public ArrayList<Reserva> getAll() throws Exception{
		
		Statement stmt=null;
		ResultSet rs=null;
		ArrayList<Reserva> reses= new ArrayList<Reserva>();
		try {
			stmt = FactoryConexion.getInstancia()
					.getConn().createStatement();
			rs = stmt.executeQuery("select * from reserva");
			if(rs!=null){
				while(rs.next()){
					Reserva res = new Reserva();
					res.setTipoelemento(new TipoElemento());
					res.setElemento(new Elemento());
					res.setId(rs.getInt("id"));
					res.setDetalle(rs.getString("detalle"));
					res.getTipoelemento().setID(rs.getInt("idtipo"));
					res.getElemento().setID(rs.getInt("idelemento"));
					reses.add(res);
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
		
		return reses;
		
	}
	

	public Reserva getByDetalle(Reserva rese) throws Exception{						
		Reserva res = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
					"select res.id, res.detalle, res.idtipo, res.idelemento, e.nombre, t.nombre, t.cantmaxreservaspendientes from reserva res inner join " +
					"tipoelemento t inner join" +
					"elemento el" +
					"on res.idelemento = el.id and res.idtipo = t.id" +
					"where res.detalle=?");				
			stmt.setString(1, rese.getDetalle());
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()){
					res = new Reserva();
					res.setTipoelemento(new TipoElemento());
					res.setElemento(new Elemento());
					res.setId(rs.getInt("id"));
					res.setDetalle(rs.getString("res.detalle"));
					res.getTipoelemento().setID(rs.getInt("res.idtipo"));
					res.getTipoelemento().setNombre(rs.getString("t.nombre"));
					res.getTipoelemento().setCantMaxReservasPendientes(rs.getInt("t.cantmaxreservaspendientes"));
					res.getElemento().setID(rs.getInt("res.idelemento"));
					res.getElemento().setNombre(rs.getString("e.nombre"));
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
		return res;
	}
	
	public void add(Reserva res) throws Exception{
		PreparedStatement stmt=null;
		ResultSet keyResultSet=null;
		try {
			stmt=FactoryConexion.getInstancia().getConn()
					.prepareStatement(
					"insert into reserva(idpersona, idtipo, idelemento, detalle, fecha, hora) values (?,?,?,?,?,?)",				//falta persona y fecha y hora
					PreparedStatement.RETURN_GENERATED_KEYS
					);
			stmt.setInt(1, res.getPersona().getID());
			stmt.setInt(2, res.getTipoelemento().getID());
			stmt.setInt(3, res.getElemento().getID());
			stmt.setString(4, res.getDetalle());
			stmt.setDate(5, res.getFecha());
			stmt.setTime(6, res.getHora());
			stmt.executeUpdate();
			keyResultSet=stmt.getGeneratedKeys();
			if(keyResultSet!=null && keyResultSet.next()){
				res.setId(keyResultSet.getInt(1));
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
	
	public void delete(Reserva res) throws Exception{						
		PreparedStatement stmt=null;
		int a;
		try {
			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
					"delete from reserva where detalle=?");
			stmt.setString(1, res.getDetalle());
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

//solo realizado el add()

