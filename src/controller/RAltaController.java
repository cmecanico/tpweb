package controller;

import java.io.Console;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logica.*;
import entidades.*;

/**
 * Servlet implementation class RAltaController
 */
@WebServlet("/RAlta.do")
public class RAltaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RAltaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession(true); 		
		   
		   CtrlReserva ctrlReserva = new CtrlReserva();
		   Reserva reserva = new Reserva();
	       try {    
	    	   	
		        int usuario = (Integer)sesion.getAttribute("id");
		        int tipo = Integer.parseInt(request.getParameter("tipo"));
		        int elemento = Integer.parseInt(request.getParameter("elemento"));
		        String fechaYhora = request.getParameter("fecha") + " " + request.getParameter("hora");
		        //String hora = request.getParameter("hora");
		        String detalle = request.getParameter("detalle");
		        
		        SimpleDateFormat f= new SimpleDateFormat("dd/MM/yyyy HH:mm");
		        java.util.Date fechaHora=f.parse(fechaYhora);
		        
		        Persona p = new Persona();
		        TipoElemento te = new TipoElemento();
		        Elemento e = new Elemento();

		        p.setID(usuario);
		        te.setID(tipo);
		        e.setID(elemento);
		        
		        reserva.setPersona(p);
		        reserva.setTipoelemento(te);
		        reserva.setElemento(e);
		        //reserva.setFecha(fecha);
		        //reserva.setHora(hora);
		        reserva.setFechaYhora(fechaHora);
		        reserva.setDetalle(detalle);
		        
		        ctrlReserva.add(reserva);
		        
	            response.sendRedirect("rAdmin.jsp");
	            }
		    catch (Exception e) {   
		    		sesion.setAttribute("errorCatch", e.toString());                            
	                response.sendRedirect("error.jsp");
		        }
	        }
	}
