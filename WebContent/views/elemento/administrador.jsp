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
    	   		CtrlABMCElemento ctrlABMCElemento = new CtrlABMCElemento();
                
                    ArrayList<Elemento> lista = ctrlABMCElemento.getAll();
                    int i, cantidad = lista.size();
                    TipoElemento te = new TipoElemento();
                    %>
                    <div id="imprimir">
                    <br><h2 style="text-align: center;">Elementos</h2><hr>
                    <div style="text-align: center;">
                    <h3 style="font-style: italic;"> Cantidad de Elementos encontrados: <%out.print(cantidad); %></h3>
                    <br>
                    </div>

                     
                     <div class="table-responsive"  id="itemsElemento">
                     <table class="table" id="tablaElementos">
                     <!-- CODIGO PARA EL ENCABEZADO-->
                     <br>
                     <tr>
                         <td><strong>ID</strong></td>
                         <td><strong>Nombre</strong></td>
                         <td><strong>Tipo</strong></td>
                         <td></td>
                         <td></td>
                         
                    </tr>


                     <!-- VERIFICA SI HAY OBJETOS EN LA LISTA PARA MOSTRALOS-->
                  <% 

                    for(Elemento x : lista)
                    {   
                        %>
                         <tr>
                         <td><%out.print(x.getID()); %></td>
                         <td><%out.print(x.getNombre()); %></td>
                         <td><%out.print(x.getTipo().getNombre()); %></td>
                         <td>
                         	<button href="" data-toggle="modal" data-target="#modalEdit" 
                         	 onclick="setInputsModificar(
                         		'<%out.print(x.getID()); %>',
                         		'<%out.print(x.getNombre()); %>',
                         		'<%out.print(x.getTipo().getID()); %>' 
                         	 )"
                         	class="btn btn-default">
                         		Modificar
                         	</button>
                       	 </td>
                         <td><button href="" data-toggle="modal" data-target="#modalBaja" 
                         	onclick="setInputsEliminar(
                         		'<%out.print(x.getID()); %>' 
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
         <br><h2 style="text-align: center;">Elementos</h2><hr>
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
        <h4 class="modal-title" id="myModalLabel">Nuevo Elemento</h4>
      </div>
      <div class="modal-body">
        <form role="form" id="e_alta" method="post" action="EAlta.do" onsubmit="return validarAlta()">
		  <div class="form-group">
		    <label for="nombre">Nombre:</label>
		    <input type="text" class="form-control" id="nombre" name="nombre">
		  </div>
		  <div class="form-group">
		    <label for="tipo">Tipo de Elemento:</label>
		    <select name="tipoelemento" id="tipoelemento">
		    <% CtrlABMCTipoElemento ctrlTipo = new CtrlABMCTipoElemento(); %>
    		<% for (TipoElemento te : ctrlTipo.getAll()) {%>
       		<option value="<% out.print(te.getID());%>">
       			<% out.print(te.getNombre());%>
       		</option> 
       		<%};%>
			</select>
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
        <h4 class="modal-title" id="myModalLabel">Baja de Elemento</h4>
      </div>
      <div class="modal-body">        
        <form role="form" id="e_baja" method="post" action="EBaja.do">		  
		  <div class="form-group hidden">
		    <label for="field_idEliminar">ID:</label>
		    <input type="number" class="form-control" id="field_idEliminar" name="idEliminar">
		  </div>
		  <div class="form-group">
		    <label for="Confirmar">¿Esta seguro que desea eliminar el elemento?</label>
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
        <h4 class="modal-title" id="myModalLabel">Modificar Elemento</h4>
      </div>
      <div class="modal-body">        
        <form role="form" id="e_edit" method="post" action="EEdit.do" onsubmit="return validarModificacion()">		  
		  <div class="form-group hidden">
		    <label for="field_idModificar">ID:</label>
		    <input type="number" class="form-control" id="field_idModificar" name="idModificar">
		  </div>
		  <div class="form-group">
		    <label for="field_nombreModificar">Nombre:</label>
		    <input type="text" class="form-control" id="field_nombreModificar" name="nombreModificar">
		  </div>
		  <div class="form-group">
		    <label for="field_tipoModificar">Tipo de Elemento:</label>
		    <select name="tipoelemento" id="field_tipoModificar">
		    <% CtrlABMCTipoElemento ctrlTipoM = new CtrlABMCTipoElemento(); %>
    		<% for (TipoElemento te : ctrlTipoM.getAll()) {%>
       		<option value="<% out.print(te.getID());%>">
       			<% out.print(te.getNombre());%>
       		</option> 
       		<%};%>
			</select>
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