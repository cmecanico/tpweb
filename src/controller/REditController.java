package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logica.CtrlReserva;
import entidades.*;

/**
 * Servlet implementation class REditController
 */
@WebServlet("/REdit.do")
public class REditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public REditController() {
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
		   
		   CtrlReserva ctrlAReserva = new CtrlReserva();
		   Reserva reserva = new Reserva();
		   Persona persona = new Persona();
		   TipoElemento tipoelemento = new TipoElemento();
		   Elemento elemento = new Elemento();
	       try {    
	    	    int id = Integer.parseInt(request.getParameter("idModificar"));
	    	    int iDpersona = (Integer)sesion.getAttribute("id");
	    	    int iDtipoelemento = Integer.parseInt(request.getParameter("tipoModificar"));
	    	    int iDelemento = Integer.parseInt(request.getParameter("elementoModificar"));
	    	    
		        persona.setID(iDpersona);
		        tipoelemento.setID(iDtipoelemento);
		        elemento.setID(iDelemento);
		        String fechaYhora = request.getParameter("fechaModificar") + " " + request.getParameter("horaModificar");
		        String detalle = request.getParameter("detalleModificar");
		        
		        SimpleDateFormat f= new SimpleDateFormat("dd/MM/yyyy HH:mm");
		        java.util.Date fechaHora=f.parse(fechaYhora);
		        
		        reserva.setId(id);
		        reserva.setPersona(persona);
		        reserva.setTipoelemento(tipoelemento);
		        reserva.setElemento(elemento);
		        reserva.setFechaYhora(fechaHora);
		        //reserva.setFecha(fecha);
		        //reserva.setHora(hora);
		        reserva.setDetalle(detalle);

		        ctrlAReserva.update(reserva);
	            response.sendRedirect("rAdmin.jsp");
	            }
		    catch (Exception e) {   
		    		sesion.setAttribute("errorCatch", e.toString());                            
	                response.sendRedirect("error.jsp");
		        }
	        }
	}
