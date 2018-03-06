<%@page import="org.eclipse.jdt.internal.compiler.ast.ForeachStatement"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="entidades.Elemento"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.*"%>

<div style="margin-top: 60px; background-color: #FFF; margin-bottom: 10px">
  <div class="row" style="margin-left: 15%; margin-right: 15%; margin-bottom: 2%" >   
   
    
     <% 
       
       //VERIFICA SI HAY USUARIO LOGUEADO
       if(session.getAttribute("username")!=null)
       {          
    	   		CtrlABMCElemento ctrlABMCElemento = new CtrlABMCElemento();
                
                    ArrayList<Elemento> lista = ctrlABMCElemento.getAll();
                    %>
                    <div id="imprimir">
                    <br><h2 style="text-align: center;">Seleccione el Elemento que desea reservar</h2>
                    <div style="text-align: center;">
                    <br>
                    </div>

                     
                     <div class="table-responsive"  id="itemsElementos">
                     <table class="table" id="tablaElementos">
                     <!-- CODIGO PARA EL ENCABEZADO-->
                     <br>
                     <tr>
                         <td><strong>ID</strong></td>
                         <td><strong>Nombre</strong></td>
                         <td></td>
                         
                    </tr>


                     <!-- VERIFICA SI HAY OBJETOS EN LA LISTA PARA MOSTRALOS-->
                  <% 
                  	int idTipo = (Integer)session.getAttribute("idTipo");
                    
              		for(Elemento x : lista)
                    {   
                        if (x.getTipo().getID() == idTipo) {%>
                         <tr>
                         <td><%out.print(x.getID()); %></td>
                         <td><%out.print(x.getNombre()); %></td>
                         <td>
                         	<button href="" data-toggle="modal" data-target="#modalConfirmaElemento" 
                         	 onclick="setInputsConfirmaElemento(
                         	 	'<%out.print(x.getTipo().getID()); %>',
                         	 	'<%out.print(x.getTipo().getNombre()); %>',
                         		'<%out.print(x.getID()); %>',
                         		'<%out.print(x.getNombre()); %>'
                         			 
                         	 )"
                         	class="btn btn-default">
                         		Seleccionar
                         	</button>
                       	 </td>
                         </tr>
                 <%}}%>
                     </table>
                     </div>
                     </div>                     
                     <br> 
               <%}                
             
       //MENSAJE PARA USUARIOS NO LOGUEADOS
       else{
            %>
         <br><h2 style="text-align: center;">Seleccione el Elemento que desea reservar</h2><hr>
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

<!-- Modal de alta luego de seleccionar un elemento -->
<div class="modal fade" id="modalConfirmaElemento" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Nueva Reserva</h4>
      </div>
      <div class="modal-body">
        <form role="form" id="r_alta" method="post" action="RAlta.do" onsubmit="return validarAlta()">
          <div class="form-group">
		    <label for="labelTipoSeleccion">Tipo de Elemento ----> </label>
		    <label for="labelTipo" id="labelTipo"></label>
		    <input type="hidden" class="form-control" id="tipo" name="tipo">
		  </div>		  
		  <div class="form-group">
		    <label for="labelElementoSeleccion">Elemento ----> </label>
		    <label for="labelElemento" id="labelElemento"></label>
		    <input type="hidden" class="form-control" id="elemento" name="elemento">
		  </div>	
		  <div class="form-group">
		    <label for="fecha">Fecha (dd/MM/aaaa):</label>
		    <input type="text" class="form-control" id="fecha" name="fecha">
		  </div>
		  <div class="form-group">
		    <label for="hora">Hora (HH:mm):</label>
		    <input type="text" class="form-control" id="hora" name="hora">
		  </div>
		  <div class="form-group">
		    <label for="detalle">Detalle:</label>
		    <input type="text" cols="40" style="width:550px; height:150px;" rows="5" class="form-control" id="detalle" name="detalle">
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