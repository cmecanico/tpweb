<%@page import="org.eclipse.jdt.internal.compiler.ast.ForeachStatement"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="entidades.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.*"%>

<div style="margin-top: 60px; background-color: #FFF; margin-bottom: 10px">
  <div class="row" style="margin-left: 15%; margin-right: 15%; margin-bottom: 2%" >   
   
    
     <% 
       
       //VERIFICA SI HAY USUARIO LOGUEADO
       if(session.getAttribute("username")!=null)
       {                   
                CtrlABMCPersona ctrlABMCPersona = new CtrlABMCPersona(); 
                
                    ArrayList<Persona> lista = ctrlABMCPersona.getAll();
                    int i, cantidad = lista.size();
                    Persona p = new Persona();
                    %>
                    <div id="imprimir">
                    <br><h2 style="text-align: center;">Personas</h2><hr>
                    <div style="text-align: center;">
                    <h3 style="font-style: italic;"> Cantidad de Personas encontradas: <%out.print(cantidad); %></h3>
                    <br>
                    </div>

                     
                     <div class="table-responsive"  id="itemsPersona">
                     <table class="table" id="tablaPersonas">
                     <!-- CODIGO PARA EL ENCABEZADO-->
                     <br>
                     <tr>
                         <td><strong>ID</strong></td>
                         <td><strong>Nombre</strong></td>
                         <td><strong>Apellido</strong></td>
                         <td><strong>DNI</strong></td>
                         <td><strong>Usuario</strong></td>
                         <td><strong>Habilitado</strong></td>
                         <td></td>
                         <td></td>
                         
                    </tr>


                     <!-- VERIFICA SI HAY OBJETOS EN LA LISTA PARA MOSTRALOS-->
                  <% 

                    for(Persona x : lista)
                    {   
                        %>
                         <tr>
                         <td><%out.print(x.getID()); %></td>
                         <td><%out.print(x.getNombre()); %></td>
                         <td><%out.print(x.getApellido()); %></td>
                         <td><%out.print(x.getDni()); %></td>
                         <td><%out.print(x.getUsuario()); %></td>
                         <td><%if(x.isHabilitado()){out.print("Habilitado");} else{out.print("No Habilitado");}; %></td>
                         <td>
                         	<button href="" data-toggle="modal" data-target="#modalEdit" 
                         	 onclick="setInputsModificar(
                         		'<%out.print(x.getID());%>',
                         		'<%out.print(x.getNombre()); %>',
                         		'<%out.print(x.getApellido()); %>',
                         		'<%out.print(x.getDni()); %>',
                         		'<%out.print(x.getUsuario()); %>',
                         		'<%out.print(x.getContraseña()); %>',
                         		'<%if(x.isHabilitado()){out.print(true);} else{out.print(false);}; %>'	 
                         	 )"
                         	class="btn btn-default">
                         		Modificar
                         	</button>
                       	 </td>
                         <td><button href="" data-toggle="modal" data-target="#modalBaja" 
                         	onclick="setInputsEliminar(
                         		'<%out.print(x.getID());%>'	 
                         	 )"
                         	class="btn btn-danger">
                         		Eliminar
                         	</button>
                         </tr>
                 <%}%>
                     </table>
                     </div>
                     </div>
                     <button href="" data-toggle="modal" data-target="#modalAlta" class="btn btn-info">Agregar</button>                     
                     <br><hr> 
                    
                    
                    
               <%}                
             
       //MENSAJE PARA USUARIOS NO LOGUEADOS
       else{
            %>
         <br><h2 style="text-align: center;">Personas</h2><hr>
        <div style="text-align: center;">
        <h3 style="font-style: italic;"> Usuario no logueado. </h3>
        <br><br>     
        </div>
           <%
            }
       
     %>     
     <br> <br> <br>
</div>
</div>


<!-- Modal de alta -->
<div class="modal fade" id="modalAlta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Nueva Persona</h4>
      </div>
      <div class="modal-body">
        <form role="form" id="p_alta" method="post" action="PAlta.do" onsubmit="return validarAlta()">
		  <div class="form-group">
		    <label for="nombre">Nombre:</label>
		    <input type="text" class="form-control" id="nombre" name="nombre">
		  </div>
		  <div class="form-group">
		    <label for="apellido">Apellido:</label>
		    <input type="text" class="form-control" id="apellido" name="apellido">
		  </div>
		  <div class="form-group">
		    <label for="dni">DNI:</label>
		    <input type="text" class="form-control" id="dni" name="dni">
		  </div>
		  <div class="form-group">
		    <label for="usuario">Usuario:</label>
		    <input type="text" class="form-control" id="usuario" name="usuario">
		  </div>
		  <div class="form-group">
		    <label for="contrasenia">Contraseña:</label>
		    <input type="text" class="form-control" id="contrasenia" name="contrasenia">
		  </div>
		  <div class="form-group">
		    <label for="habilitado">Habilitado:</label>
		    <input type="checkbox" class="form-control" id="habilitado" name="habilitado">
		  </div>
		  <button type="submit" class="btn btn-default">Agregar</button>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal de baja -->
<div class="modal fade" id="modalBaja" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Baja de Persona</h4>
      </div>
      <div class="modal-body">        
        <form role="form" id="p_baja" method="post" action="PBaja.do">		  
		  <div class="form-group hidden">
		    <label for="field_idEliminar">ID:</label>
		    <input type="number" class="form-control" id="field_idEliminar" name="idEliminar">
		  </div>
		  <div class="form-group">
		    <label for="Confirmar">¿Esta seguro que desea eliminar la persona?</label>
		  </div>
		  <button type="submit" class="btn btn-default">Eliminar</button>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal de modificar -->
<div class="modal fade" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modificar Persona</h4>
      </div>
      <div class="modal-body">        
        <form role="form" id="p_edit" method="post" action="PEdit.do" onsubmit="return validarModificacion()">		  
		  <div class="form-group hidden">
		    <label for="field_idModificar">ID:</label>
		    <input type="number" class="form-control" id="field_idModificar" name="idModificar">
		  </div>
		  <div class="form-group">
		    <label for="field_nombreModificar">Nombre:</label>
		    <input type="text" class="form-control" id="field_nombreModificar" name="nombreModificar">
		  </div>
		  <div class="form-group">
		    <label for="field_apellidoModificar">Apellido:</label>
		    <input type="text" class="form-control" id="field_apellidoModificar" name="apellidoModificar">
		  </div>
		  <div class="form-group">
		    <label for="field_dniModificar">DNI:</label>
		    <input type="text" class="form-control" id="field_dniModificar" name="dniModificar">
		  </div>
		  <div class="form-group">
		    <label for="field_usuarioModificar">Usuario:</label>
		    <input type="text" class="form-control" id="field_usuarioModificar" name="usuarioModificar">
		  </div>
		  <div class="form-group">
		    <label for="field_contraseniaModificar">Contraseña:</label>
		    <input type="text" class="form-control" id="field_contraseniaModificar" name="contraseniaModificar">
		  </div>
		  <div class="form-group">
		    <label for="field_habilitadoModificar">Habilitado:</label>
		    <input type="checkbox" class="form-control" id="field_habilitadoModificar" name="habilitadoModificar">
		  </div>
		  <button type="submit" class="btn btn-default">Modificar</button>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>