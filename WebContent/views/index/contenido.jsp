<div class="container">
	<!-- CONTROL DE USUARIO LOGUEADO -->
	<%if(session.getAttribute("nombre") == null)
	{ 
		if(session.getAttribute("mensaje") != null) {%>
			<div class="alert alert-danger">
				<p>
					<strong>Mensaje: </strong> <% out.print((String)session.getAttribute("mensaje")); %>
				</p>
			</div>
		<% 
		session.setAttribute("mensaje", null);
		}%>
		<div class="jumbotron">
		  <h1>Bienvenido al Sistema de Reservas, trabajo practico de java 2017.</h1>
		  <p>
		  	Debes iniciar sesión para disfrutar de todas las funcionalidades del sistema.
		  </p>
		</div>
	<% } else { %>
		<div class="alert alert-success">
			<p>
				<strong>USUARIO LOGUEADO: </strong> <% out.print((String)session.getAttribute("nombre")); %>
			</p>
		</div>
		<div class="jumbotron">
		  <h1>Bienvenido al Sistema de Reservas, trabajo practico de java 2017..</h1>
		  <p>
		  	Ahora estas habilitado para acceder a las funcionalidades del sistema.
		  </p>
		</div>
	<%}%>
</div>