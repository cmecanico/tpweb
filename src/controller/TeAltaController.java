package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.TipoElemento;

import logica.CtrlABMCTipoElemento;

/**
 * Servlet implementation class TeAltaController
 */
@WebServlet("/TeAlta.do")
public class TeAltaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeAltaController() {
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
		   
		   CtrlABMCTipoElemento ctrlABMCTipoElemento = new CtrlABMCTipoElemento();
		   TipoElemento tipoElemento = new TipoElemento();
	       try {                       
		        String nombre = request.getParameter("nombre");
		        int cantidad = Integer.parseInt(request.getParameter("cantidad"));

		        tipoElemento.setNombre(nombre);
		        tipoElemento.setCantMaxReservasPendientes(cantidad);
		        ctrlABMCTipoElemento.add(tipoElemento);
	               
	            response.sendRedirect("teAdmin.jsp");
	            }
		    catch (Exception e) {   
		    		sesion.setAttribute("errorCatch", e.toString());                            
	                response.sendRedirect("error.jsp");
		        }
	        }
	}

