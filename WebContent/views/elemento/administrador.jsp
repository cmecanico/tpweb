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
                
                    ArrayList<Elemento> lista = ctrlABMCElemento.getall();
                    int i, cantidad = lista.size();
                    TipoElemento te = new TipoElemento();
                    %>
                    <div id="imprimir">
                    <br><h2 style="text-align: center;">Elementos</h2><hr>
                    <div style="text-align: center;">
                    <h3 style="font-style: italic;"> Cantidad de Elementos encontrados: <%out.print(cantidad); %></h3>
                    <br>
                    </div>

                     
                     <div class="table-responsive"  id="itemsTiposElemento">
                     <table class="table" id="tablaTiposElemento">
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
