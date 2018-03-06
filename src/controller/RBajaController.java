package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logica.CtrlReserva;
import entidades.Reserva;

/**
 * Servlet implementation class RBajaController
 */
@WebServlet("/RBaja.do")
public class RBajaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RBajaController() {
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
		   
		   CtrlReserva ctrlReserva= new CtrlReserva();
		   Reserva reserva = new Reserva();
	       try {    
	    	    int id = Integer.parseInt(request.getParameter("idEliminar"));

		        reserva.setId(id);
		        
		        ctrlReserva.delete(reserva);	               
	            response.sendRedirect("rAdmin.jsp");
	            }
		    catch (Exception e) {   
		    		sesion.setAttribute("errorCatch", e.toString());                            
	                response.sendRedirect("error.jsp");
		        }
	       
	}

}

