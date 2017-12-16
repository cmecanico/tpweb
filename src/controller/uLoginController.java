package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.*;
import entidades.*;

/**
 * Servlet implementation class uLoginController
 */
@WebServlet("/uLogin.do")
public class uLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uLoginController() {
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
	   CtrlABMCPersona ctrlABMCPersona = new CtrlABMCPersona();
       try {                       
    	   	sesion.setAttribute("mensaje", null);
	        String username = request.getParameter("usuario");
	        String pass = request.getParameter("pass");

	        if(ctrlABMCPersona.getLogin(username, pass)) {   
                Persona persona = ctrlABMCPersona.getOneByUsername(username);
               
                sesion.setAttribute("username", persona.getUsuario());
                sesion.setAttribute("nombre", persona.getNombre());
               
                response.sendRedirect("index.jsp");
            } else {  
                    sesion.setAttribute("mensaje", "Usuario o contraseña incorrecta.");
                    response.sendRedirect("index.jsp");
	            }
	        }
	    catch (Exception e) {   
	    		sesion.setAttribute("errorCatch", e.toString());                            
                response.sendRedirect("error.jsp");
	        }
        }
}
