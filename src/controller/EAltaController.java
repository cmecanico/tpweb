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
 * Servlet implementation class EAltaController
 */
@WebServlet("/EAlta.do")
public class EAltaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EAltaController() {
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
		        String nombre = request.getParameter("nombre");
		        int tipo = Integer.parseInt(request.getParameter("tipoelemento"));

		        elemento.setNombre(nombre);
		        TipoElemento te = new TipoElemento();
		        te.setID(tipo);
		        elemento.setTipo(te);
		        
		        ctrlABMCElemento.add(elemento);
		        
	            response.sendRedirect("eAdmin.jsp");
	            }
		    catch (Exception e) {   
		    		sesion.setAttribute("errorCatch", e.toString());                            
	                response.sendRedirect("error.jsp");
		        }
	        }
	}