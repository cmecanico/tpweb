<%@page import="org.eclipse.jdt.internal.compiler.ast.ForeachStatement"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="entidades.TipoElemento"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.*"%>

<div style="margin-top: 60px; background-color: #FFF; margin-bottom: 10px">
  <div class="row" style="margin-left: 15%; margin-right: 15%; margin-bottom: 2%" >   
   
    
     <% 
       
       //VERIFICA SI HAY USUARIO LOGUEADO
       if(session.getAttribute("username")!=null)
       {                   
                CtrlABMCTipoElemento ctrlABMCTipoElemento = new CtrlABMCTipoElemento(); 
                
                    ArrayList<TipoElemento> lista = ctrlABMCTipoElemento.getAll();
                    TipoElemento te = new TipoElemento();
                    %>
                    <div id="imprimir">
                    <br><h2 style="text-align: center;">Seleccione el Tipo de Elemento que desea reservar</h2>
                     
                     <div class="table-responsive"  id="itemsTiposElemento">
                     <table class="table" id="tablaTiposElemento">
                     <!-- CODIGO PARA EL ENCABEZADO-->
                     <br><br>
                     <tr>
                         <td><strong>ID</strong></td>
                         <td><strong>Nombre</strong></td>
                         <td></td>
                    </tr>

                     <!-- VERIFICA SI HAY OBJETOS EN LA LISTA PARA MOSTRALOS-->
                  <% 
                    for(TipoElemento x : lista)
                    {   
                        %>
                         <tr>
                         <td><%out.print(x.getID()); %></td>
                         <td><%out.print(x.getNombre()); %></td>
                         <td>
                         	<button href="" data-toggle="modal" data-target="#modalConfirmaTipo" 
                         	 onclick="setInputsConfirmaTipo(
                         		'<%out.print(x.getID());%>',
                         		'<%out.print(x.getNombre()); %>'	 
                         	 )"
                         	class="btn btn-default">
                         		Seleccionar
                         	</button>
                       	 </td>
                         </tr>
                 <%}%>
                     </table>
                     </div>
                     </div>                     
                     <br> 
               <%}                
             
       //MENSAJE PARA USUARIOS NO LOGUEADOS
       else{
            %>
         <br><h2 style="text-align: center;">Seleccione el Tipo de Elemento que desea reservar</h2><hr>
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

<!-- Modal de Confirma Tipo -->
<div class="modal fade" id="modalConfirmaTipo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Confirme Tipo de Elemento seleccionado</h4>
      </div>
      <div class="modal-body">
        <form role="form" id="preReserva" method="post" action="PreReserva.do">
		  <div class="form-group">
		    <label for="labelSeleccion">Usted ha Seleccinado ---->  </label>
		    <label for="labelNombre" id="labelNombre"></label>
		  </div>
		  <div class="form-group hidden">
		    <input type="text" class="form-control" id="id" name="id">
		  </div>
		  <div class="form-group hidden">
		    <input type="text" class="form-control" id="nombre" name="nombre">
		  </div>
		  <button type="submit" class="btn btn-default">Confirmar</button>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
      </div>
    </div>
  </div>
</div>