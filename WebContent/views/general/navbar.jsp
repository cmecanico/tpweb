<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"> TP JAVA</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
      	<%if((String)session.getAttribute("nombre") != null){%>
	      		
	      		<li class="active"><a href="teAdmin.jsp">Tipos de Elemento <span class="sr-only">(current)</span></a></li>
	      		<li class="active"><a href="eAdmin.jsp">Elementos <span class="sr-only">(current)</span></a></li>
	      		<li class="active"><a href="pAdmin.jsp">Personas <span class="sr-only">(current)</span></a></li>
	      		<li class="active"><a href="rAdmin.jsp">Reservas <span class="sr-only">(current)</span></a></li>
		<%}%>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
          	Usuario
          	<span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
          <%if((String)session.getAttribute("nombre") == null){%>          
            <li>
            	<a href="" data-toggle="modal" data-target="#loginModal">
            		<i class="fa fa-sign-in" aria-hidden="true"></i>
            		Iniciar sesi&oacute;n
            	</a>
            </li>
           <%} else{ %>           
            <li>
           		<a href="ULogout.do">
            		<i class="fa fa-sign-out" aria-hidden="true"></i>
           			Cerrar sesi&oacute;n
           		</a>
            </li>
           <%}%>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Iniciar sesi&oacute;n</h4>
      </div>
      <div class="modal-body">
        <form role="form" id="login" method="post" action="uLogin.do">
		  <div class="form-group">
		    <label for="email">Usuario:</label>
		    <input type="text" class="form-control" id="usuario" name="usuario">
		  </div>
		  <div class="form-group">
		    <label for="pwd">Contrase&ntilde;a:</label>
		    <input type="password" class="form-control" id="pass" name="pass">
		  </div>
		  <button type="submit" class="btn btn-default">Iniciar sesi&oacute;n</button>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

