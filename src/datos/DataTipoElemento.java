package datos;

import java.util.ArrayList;

import javax.swing.JOptionPane;

import java.security.KeyStore.ProtectionParameter;
import java.sql.*;

import entidades.*;
import util.AppDataException;

public class DataTipoElemento {
	
	public static ArrayList<TipoElemento> getAll() throws Exception{
	
		Statement stmt=null;
		ResultSet rs=null;
		ArrayList<TipoElemento> tes= new ArrayList<TipoElemento>();
		try {
			stmt = FactoryConexion.getInstancia()
					.getConn().createStatement();
			rs = stmt.executeQuery("select * from tipoelemento");
			if(rs!=null){
				while(rs.next()){
					TipoElemento te = new TipoElemento();
					te.setID(rs.getInt("id"));
					te.setNombre(rs.getString("nombre"));
					te.setCantMaxReservasPendientes(rs.getInt("cantmaxreservaspendientes"));
					tes.add(te);
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
		
		return tes;
		
	}
	
	
	public TipoElemento getByNombre(TipoElemento tipoele) throws Exception{		//no me muestra el id
		TipoElemento te = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
					"select id, nombre, cantmaxreservaspendientes from tipoelemento where nombre=?");
			stmt.setString(1, tipoele.getNombre());
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()){
					te = new TipoElemento();
					te.setID(rs.getInt("id"));
					te.setNombre(rs.getString("nombre"));
					te.setCantMaxReservasPendientes(rs.getInt("cantmaxreservaspendientes"));
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
		return te;
	}
	
	public void add(TipoElemento te) throws Exception{
		PreparedStatement stmt=null;
		ResultSet keyResultSet=null;
		try {
			stmt=FactoryConexion.getInstancia().getConn()
					.prepareStatement(
					"insert into tipoelemento(nombre, cantmaxreservaspendientes) values (?,?)",
					PreparedStatement.RETURN_GENERATED_KEYS
					);
			stmt.setString(1, te.getNombre());
			stmt.setInt(2, te.getCantMaxReservasPendientes());
			stmt.executeUpdate();
			keyResultSet=stmt.getGeneratedKeys();
			if(keyResultSet!=null && keyResultSet.next()){
				te.setID(keyResultSet.getInt(1));
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
	
	public void update(TipoElemento te) throws Exception{
		PreparedStatement stmt=null;
		ResultSet keyResultSet=null;
		try {
			stmt=FactoryConexion.getInstancia().getConn()
					.prepareStatement(
					"update tipoelemento set nombre = ?, cantmaxreservaspendientes = ? where id = ?",
					PreparedStatement.RETURN_GENERATED_KEYS
					);
			
			stmt.setString(1, te.getNombre());
			stmt.setInt(2, te.getCantMaxReservasPendientes());
			stmt.setInt(3, te.getID());
			
			stmt.executeUpdate();
			keyResultSet=stmt.getGeneratedKeys();
			if(keyResultSet!=null && keyResultSet.next()){
				te.setID(keyResultSet.getInt(1));
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
	
	public void delete(TipoElemento te) throws Exception{						
		PreparedStatement stmt=null;
		int a;
		try {
			stmt=FactoryConexion.getInstancia().getConn().prepareStatement(
					"delete from tipoelemento where id=?");
			stmt.setInt(1, te.getID());
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

// GETALL,	GETBYNOMBRE,	ADD,	DELETE