package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.*;
import logica.*;

/**
 * Servlet implementation class ULogoutController
 */
@WebServlet("/ULogout.do")
public class ULogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ULogoutController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession(true); 
        
       try {
	        String nombre = (String)sesion.getAttribute("nombre"); 
	        if( nombre == null)        
	        {
	            response.getWriter().print("No hay ningún usuario logueado.");
	        } else { 
	                sesion.invalidate();
	                RequestDispatcher rd = null;
	                response.sendRedirect("index.jsp");
            }
        }
	    catch (Exception e) {
            sesion.setAttribute("errorCatch", e.toString());
            RequestDispatcher rd = null;
            response.sendRedirect("error.jsp");
        } 
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    }
}