package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import util.AppDataException;
import entidades.Elemento;
import entidades.Persona;
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
			rs = stmt.executeQuery("select * from reserva r " +
					"join persona p on r.idpersona = p.id " +
					"join elemento e on r.idelemento = e.id " +
					"join tipoelemento t on r.idtipo = t.id");
			if(rs!=null){
				while(rs.next()){
					Reserva res = new Reserva();
					res.setPersona(new Persona());
					res.setTipoelemento(new TipoElemento());
					res.setElemento(new Elemento());
					res.setId(rs.getInt("r.id"));
					res.setDetalle(rs.getString("r.detalle"));
					res.setFechaYhora(null);
					//res.setFechaYhora(new java.util.Date(rs.getDate("r.fechaYhora").getTime()));
					
					//res.setHora(rs.getString("r.hora"));
					//res.setFecha(rs.getString("r.fecha"));
					
					res.getPersona().setID(rs.getInt("r.idpersona"));
					res.getPersona().setNombre(rs.getString("p.nombre"));
					res.getPersona().setApellido(rs.getString("p.apellido"));
					res.getPersona().setDni(rs.getString("p.dni"));
					res.getPersona().setHabilitado(rs.getBoolean("p.habilitado"));
					res.getPersona().setUsuario(rs.getString("usuario"));
					
					res.getTipoelemento().setID(rs.getInt("r.idtipo"));
					res.getTipoelemento().setCantMaxReservasPendientes(rs.getInt("t.cantmaxreservaspendientes"));
					res.getTipoelemento().setNombre(rs.getString("t.nombre"));
					
					res.getElemento().setID(rs.getInt("r.idelemento"));
					res.getElemento().setNombre(rs.getString("e.nombre"));
					
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
	

	public Reserva getById(Reserva rese) throws Exception{						
		Reserva res = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
					"select * from reserva r join persona p join elemento e " +
					"join tipoelemento t on r.idpersona = p.id and r.idtipo = t.id and r.idelemento = e.id" +
					"where r.id=?");				
			stmt.setInt(1, rese.getId());
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()){
				res = new Reserva();
				res.setPersona(new Persona());
				res.setTipoelemento(new TipoElemento());
				res.setElemento(new Elemento());
				res.setId(rs.getInt("r.id"));
				res.setDetalle(rs.getString("r.detalle"));
				res.setFechaYhora(null);
				//res.setFechaYhora(new java.util.Date(rs.getDate("r.fechaYhora").getTime()));
				
				//res.setHora(rs.getString("r.hora"));
				//res.setFecha(rs.getString("r.fecha"));
				
				res.getPersona().setID(rs.getInt("r.idpersona"));
				res.getPersona().setNombre(rs.getString("p.nombre"));
				res.getPersona().setApellido(rs.getString("p.apellido"));
				res.getPersona().setDni(rs.getString("p.dni"));
				res.getPersona().setHabilitado(rs.getBoolean("p.habilitado"));
				res.getPersona().setUsuario(rs.getString("usuario"));
				
				res.getTipoelemento().setID(rs.getInt("r.idtipo"));
				res.getTipoelemento().setCantMaxReservasPendientes(rs.getInt("t.cantmaxreservaspendientes"));
				res.getTipoelemento().setNombre(rs.getString("t.nombre"));
				
				res.getElemento().setID(rs.getInt("r.idelemento"));
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
					"insert into reserva(idpersona, idtipo, idelemento, detalle, fechaYhora) values (?,?,?,?,?)",				//falta persona y fecha y hora
					PreparedStatement.RETURN_GENERATED_KEYS
					);
			stmt.setInt(1, res.getPersona().getID());
			stmt.setInt(2, res.getTipoelemento().getID());
			stmt.setInt(3, res.getElemento().getID());
			stmt.setString(4, res.getDetalle());
			stmt.setTimestamp(5, new java.sql.Timestamp(res.getFechaYhora().getTime()));
			//stmt.setString(5, res.getFecha());
			//stmt.setString(6, res.getHora());
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
	
	public void update(Reserva res) throws Exception{
		PreparedStatement stmt=null;
		ResultSet keyResultSet=null;
		try {
			stmt=FactoryConexion.getInstancia().getConn()
					.prepareStatement(
					"update reserva set idpersona = ?, idtipo = ?, idelemento = ?, detalle = ?, fechaYhora= ? where id = ?",
					PreparedStatement.RETURN_GENERATED_KEYS
					);
			
			stmt.setInt(1, res.getPersona().getID());
			stmt.setInt(2, res.getTipoelemento().getID());
			stmt.setInt(3, res.getElemento().getID());
			stmt.setString(4, res.getDetalle());
			stmt.setTimestamp(5, new java.sql.Timestamp(res.getFechaYhora().getTime()));
			//stmt.setString(5, res.getFecha());
			//stmt.setString(6, res.getHora());
			stmt.setInt(6, res.getId());
			
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
					"delete from reserva where id=?");
			stmt.setInt(1, res.getId());
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