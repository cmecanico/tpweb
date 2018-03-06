package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logica.CtrlABMCPersona;
import entidades.Persona;;

/**
 * Servlet implementation class PAltaController
 */
@WebServlet("/PAlta.do")
public class PAltaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PAltaController() {
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
		   
		   CtrlABMCPersona ctrlABMCPersona= new CtrlABMCPersona();
		   Persona persona= new Persona();
	       try {                       
		        String nombre = request.getParameter("nombre");
		        String apellido = request.getParameter("apellido");
		        String dni = request.getParameter("dni");
		        String usuario = request.getParameter("usuario");
		        String contrasenia = request.getParameter("contrasenia");
		        boolean habilitado =  request.getParameter("habilitado") != null;

		        persona.setNombre(nombre);
		        persona.setApellido(apellido);
		        persona.setDni(dni);
		        persona.setUsuario(usuario);
		        persona.setContraseña(contrasenia);
		        persona.setHabilitado(habilitado);
		        ctrlABMCPersona.add(persona);
	               
	            response.sendRedirect("pAdmin.jsp");
	            }
		    catch (Exception e) {   
		    		sesion.setAttribute("errorCatch", e.toString());                            
	                response.sendRedirect("error.jsp");
		        }
	        }
	}