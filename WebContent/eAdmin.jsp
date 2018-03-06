<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> Administración de Elementos</title>

    <%session.setAttribute("paginaActual", "e_admin");%>
    
    <jsp:include page="views/general/referencias.html"/>
    <script src="views/elemento/elemento.controller.js"></script>
    
  </head>
  <body>

    <div class="container-fluid">
        
        <jsp:include page="views/general/navbar.jsp"/>
                
         <%try{%>
          <jsp:include page="views/elemento/administrador.jsp"/>
        <%}catch (Exception e)
        {
            session.setAttribute("errorCatch", e.toString());
            RequestDispatcher rd =null;
                                                   
            rd=request.getRequestDispatcher("error.jsp");
            rd.forward(request,response);
        }%>
        
</div>

      
    
  </body>
</html>