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
                CtrlABMCTipoElemento ctrlABMCTipoElemento = new CtrlABMCTipoElemento(); 
                
                    ArrayList<TipoElemento> lista = ctrlABMCTipoElemento.getAll();
                    int i, cantidad = lista.size();
                    TipoElemento te = new TipoElemento();
                    %>
                    <div id="imprimir">
                    <br><h2 style="text-align: center;">Tipos de Elemento</h2><hr>
                    <div style="text-align: center;">
                    <h3 style="font-style: italic;"> Cantidad de Tipos de Elemento encontrados: <%out.print(cantidad); %></h3>
                    <br>
                    </div>

                     
                     <div class="table-responsive"  id="itemsTiposElemento">
                     <table class="table" id="tablaTiposElemento">
                     <!-- CODIGO PARA EL ENCABEZADO-->
                     <br>
                     <tr>
                         <td><strong>ID</strong></td>
                         <td><strong>Nombre</strong></td>
                         <td><strong>Cant Max Reservas Pendientes</strong></td>
                         <td></td>
                         <td></td>
                         <!--<td><button type="button" class="btn btn-default">Volver a página principal</button></td>-->
                         
                    </tr>


                     <!-- VERIFICA SI HAY OBJETOS EN LA LISTA PARA MOSTRALOS-->
                  <% 

                    for(TipoElemento x : lista)
                    {   
                        %>
                         <tr>
                         <td><%out.print(x.getID()); %></td>
                         <td><%out.print(x.getNombre()); %></td>
                         <td><%out.print(x.getCantMaxReservasPendientes()); %></td>
                         <td><button href="" data-toggle="modal" data-target="#modalEdit" class="btn btn-default">Modificar</button></td>
                         <td><button href="" data-toggle="modal" data-target="#modalBaja" class="btn btn-danger">Eliminar</button>
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
         <br><h2 style="text-align: center;">Tipos de Elemento</h2><hr>
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
        <h4 class="modal-title" id="myModalLabel">Nuevo Tipo de Elemento</h4>
      </div>
      <div class="modal-body">
        <form role="form" id="te_alta" method="post" action="TeAlta.do" onsubmit="return valideDatos()">
		  <div class="form-group">
		    <label for="nombre">Nombre:</label>
		    <input type="text" class="form-control" id="nombre" name="nombre">
		  </div>
		  <div class="form-group">
		    <label for="cantidad">Cant Max Reservas Pendientes:</label>
		    <input type="text" class="form-control" id="cantidad" name="cantidad">
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
        <h4 class="modal-title" id="myModalLabel">Baja de Tipo de Elemento</h4>
      </div>
      <div class="modal-body">
        <form role="form" id="te_baja" method="post" action="TeBaja.do">
		  <div class="form-group">
		    <label for="id">ID:</label>
		    <label for="idCampo"></label>
		  </div>
		  <div class="form-group">
		    <label for="nombre">Nombre:</label>
		    <label for="nombreCampo"></label>
		  </div>
		  <div class="form-group">
		    <label for="cantidad">Cant Max Reservas Pendientes:</label>
		    <label for="cantidadCampo"></label>
		  </div>
		  <button type="submit" class="btn btn-default">Eliminar</button>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
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
        <h4 class="modal-title" id="myModalLabel">Modificar Tipo de Elemento</h4>
      </div>
      <div class="modal-body">
        <form role="form" id="te_edit" method="post" action="TeEdit.do">
		  <div class="form-group">
		    <label for="nombre">Nombre:</label>
		    <input type="text" class="form-control" id="nombre" name="nombre">
		  </div>
		  <div class="form-group">
		    <label for="cantidad">Cant Max Reservas Pendientes:</label>
		    <input type="text" class="form-control" id="cantidad" name="cantidad">
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

