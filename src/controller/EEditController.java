package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logica.CtrlABMCElemento;
import entidades.*;

/**
 * Servlet implementation class EEditController
 */
@WebServlet("/EEdit.do")
public class EEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EEditController() {
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
		   
		   CtrlABMCElemento ctrlABMCElemento= new CtrlABMCElemento();
		   Elemento elemento = new Elemento();
	       try {    
	    	    int id = Integer.parseInt(request.getParameter("idModificar"));
		        String nombre = request.getParameter("nombreModificar");
		        int tipo = Integer.parseInt(request.getParameter("tipoelemento"));

		        elemento.setID(id);
		        elemento.setNombre(nombre);
		        TipoElemento te = new TipoElemento();
		        te.setID(tipo);
		        elemento.setTipo(te);
		        
		        ctrlABMCElemento.update(elemento);
	            response.sendRedirect("eAdmin.jsp");
	            }
		    catch (Exception e) {   
		    		sesion.setAttribute("errorCatch", e.toString());                            
	                response.sendRedirect("error.jsp");
		        }
	        }
	}
