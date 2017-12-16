<div style="background-color: #ffffff; margin-top:75px; margin-bottom: 15px;">
    <div class="row">
    <div style=" margin-left: 4%;">
        <% if(session.getAttribute("errorCatch") == null ) {%>
        	<h1 style="text-align:center;"> Tranquilo, has llegado acá por error..<br> ¡TODO ESTÁ BIEN!</h1>
        <% }else{%>
	              <h1 style="text-align:center;"> Ups.. Ha ocurrido un error de sistema.</h1>
	              <hr>
	              <h4>Error detectado:</h4><br><br>
	              <p>
	                  <%out.print((String)session.getAttribute("errorCatch"));
	                    session.setAttribute("errorCatch", null);
	                  %>  
	              </p>
            <% }%>
       <br><br>     
       <a href="javascript:window.history.back();">&laquo; Volver atrás</a>
       <br><br>         
     </div>  
   </div>
</div>