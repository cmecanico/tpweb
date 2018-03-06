<%@page import="java.io.Console"%>
<%@page import="javafx.scene.control.Alert"%>
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
                CtrlReserva ctrlABMCReserva = new CtrlReserva(); 
                
                    ArrayList<Reserva> lista = ctrlABMCReserva.getall();
                    int i, cantidad = lista.size();
                    %>
                    <div id="imprimir">
                    <br><h2 style="text-align: center;">Reservas</h2><hr>
                    <div style="text-align: center;">
                    <h3 style="font-style: italic;"> Cantidad de Reservas encontradas: <%out.print(cantidad); %></h3>
                    <br>
                    </div>

                     
                     <div class="table-responsive"  id="itemsReserva">
                     <table class="table" id="tablaReservas">
                     <!-- CODIGO PARA EL ENCABEZADO-->
                     <br>
                     <tr>
                         <td><strong>ID</strong></td>
                         <td><strong>Persona</strong></td>
                         <td><strong>Tipo de Elemento</strong></td>
                         <td><strong>Elemento</strong></td>
                         <td><strong>Detalle</strong></td>
                         <td><strong>Fecha y Hora</strong></td>
                         <td></td>
                         <td></td>
                         
                    </tr>


                     <!-- VERIFICA SI HAY OBJETOS EN LA LISTA PARA MOSTRALOS-->
                  <% 
                 	 //int idPersona = (Integer)session.getAttribute("id");

                     for(Reserva x : lista)
                     {   //if(x.getPersona().getID() == idPersona){
                        %>
                         <tr>
                         <td><%out.print(x.getId()); %></td>
                         <td><%out.print(x.getPersona().getNombre());%> <%out.print(x.getPersona().getApellido());%></td>
                         <td><%out.print(x.getTipoelemento().getNombre()); %></td>
                         <td><%out.print(x.getElemento().getNombre()); %></td>
                         <td><%out.print(x.getDetalle()); %></td>
                         <td><%out.print(x.getFechaYhora()); %></td>
                         <td>
                         	<button href="" data-toggle="modal" data-target="#modalEdit" 
                         	 onclick="setInputsModificar(
                         		'<%out.print(x.getId());%>',
                         		'<%out.print(x.getPersona().getID()); %>',
                         		'<%out.print(x.getTipoelemento().getID()); %>',
                         		'<%out.print(x.getTipoelemento().getNombre()); %>',
                         		'<%out.print(x.getElemento().getID()); %>',
                         		'<%out.print(x.getElemento().getNombre()); %>',
                         		'<%out.print(x.getDetalle()); %>',
                         		'<%out.print(x.getFechaYhora()); %>'	 
                         	 )"
                         	class="btn btn-default">
                         		Modificar
                         	</button>
                       	 </td>
                         <td><button href="" data-toggle="modal" data-target="#modalBaja" 
                         	onclick="setInputsEliminar(
                         		'<%out.print(x.getId());%>',)"
                         	class="btn btn-danger">
                         		Eliminar
                         	</button>
                         </tr>
                 <%}%>
                     </table>
                     </div>
                     </div>
                     <button onclick="location.href = 'prAdmin.jsp';" class="btn btn-info">Agregar</button>                   
                     <br><hr> 
                    
                    
                    
               <%}                
             
       //MENSAJE PARA USUARIOS NO LOGUEADOS
       else{
            %>
         <br><h2 style="text-align: center;">Reservas</h2><hr>
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



<!-- Modal de baja -->
<div class="modal fade" id="modalBaja" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Baja de Reserva</h4>
      </div>
      <div class="modal-body">        
        <form role="form" id="r_baja" method="post" action="RBaja.do">
          <div class="form-group hidden">
		    <label for="field_idEliminar">ID:</label>
		    <input type="number" class="form-control" id="field_idEliminar" name="idEliminar">
		  </div>		  
		  <div class="form-group">
		    <label for="Confirmar">¿Esta seguro que desea eliminar la reserva?</label>
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
        <h4 class="modal-title" id="myModalLabel">Modificar Reserva</h4>
      </div>
      <div class="modal-body">        
        <form role="form" id="r_edit" method="post" action="REdit.do" onsubmit="return validarModificacion()">		  
		  <div class="form-group hidden">
		    <label for="field_idModificar">ID:</label>
		    <input type="number" class="form-control" id="field_idModificar" name="idModificar">
		  </div>
		  <div class="form-group">
		    <label for="labelTipoModificarSeleccion">Tipo ----> </label>
		    <label for="labelTipoModificar" id="labelTipoModificar"></label>
		    <input type="hidden" class="form-control" id="field_tipoModificar" name="tipoModificar">		    
		  </div>
		  <div class="form-group">
		    <label for="field_elementoModificar">Elemento -----> </label>
		    <label for="labelElemento" id="labelElementoModificar"></label>
		    <input type="hidden" class="form-control" id="field_elementoModificar" name="elementoModificar">
		  </div>
		  <div class="form-group">
		    <label for="field_fechaModificar">Fecha (dd/MM/aaaa):</label>
		    <input type="text" class="form-control" id="field_fechaModificar" name="fechaModificar">
		  </div>
		  <div class="form-group">
		    <label for="field_horaModificar">Hora (HH:mm):</label>
		    <input type="text" class="form-control" id="field_horaModificar" name="horaModificar">
		  </div>		  
		  <div class="form-group">
		    <label for="field_detalleModificar">Detalle:</label>
		    <input type="text" cols="40" style="width:550px; height:150px;" rows="5" class="form-control" id="field_detalleModificar" name="detalleModificar">
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