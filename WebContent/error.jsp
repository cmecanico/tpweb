<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> Ups.. ¡Error!</title>

    <%session.setAttribute("paginaActual", "error");%>
    <jsp:include page="views/general/referencias.html"/>
    
  </head>
  <body>

    <div class="container-fluid">
        
        <jsp:include page="views/general/navbar.jsp"/>
        <jsp:include page="views/general/errorContenido.jsp"/>
        
</div>
</body>
</html>