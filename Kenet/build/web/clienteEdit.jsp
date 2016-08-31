<%-- 
    Document   : clienteEdit
    Created on : 29-dic-2015, 23:33:13
    Author     : staling
--%>

<%@page import="Hibernate.Query"%>
<%@page import="Hibernate.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (!session.getAttribute("rango").equals("10") && !session.getAttribute("rango").equals("2")) {
        response.sendRedirect("/SportCar");
    }%>

<jsp:include page="header.jsp"/>

<section class="global-page-header">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="block">
                    <h2>Editar Clientes</h2>
                    <ol class="breadcrumb">
                    </ol>
                </div>
            </div>
        </div>
    </div>
</section>


<section id="gallery" class="gallery">
    <div class="container">
        <div class="row">

            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5 ">
                <center>

                    <% int id = 0;
                        String Nombre = "", Apellido = "", Telefono = "", foto = "", Cedula = "";
                        String edit = "";

                        Usuario user = null;
                        if (request.getParameter("K") != null) {
                            edit = request.getParameter("K").toString();
                            user = new Query().BuscarUserparaeditar(edit);
                            Nombre = user.getNombre();
                            Apellido = user.getApellido();
                            Telefono = user.getTelefono();
                            Cedula = user.getCedula();
                            foto = user.getFoto();
                            id = user.getId();

                        }


                    %>
                    <% String error = (String) session.getAttribute("Mensaje"); %>

                    <% if (error != null) {%>
                    <h1 style="color: black"><%=error%></h1>
                    <% session.removeAttribute("Mensaje"); %>
                    <%}%>
                </center>
                <form method="post" action="EditClientes.html?K=<%=id%>"  enctype="multipart/form-data"><!--onsubmit="return Rentar()"-->
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" placeholder="Nombre" value=<%=Nombre%> name="Nombre" required="required" id="Email">
                    </div>
                    <br/>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" placeholder="Apellido" value="<%=Apellido%>"name="Apellido" required="required" id="Apellido">
                    </div>

                    <div class="form-group">
                        <input type="text" class="form-control input-lg" placeholder="Telefon" value="<%=Telefono%> "name="Telefono" required="required" id="Telefono">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" placeholder="Cedula" value="<%=Cedula%> "name="Cedula" required="required" id="Telefono">
                    </div>
                    <div class="form-group">
                        <span class="btn btn-primary btn-file">
                            Foto Cliente <input type="file" accept="image/*"  name="foto" id="foto">
                        </span>
                        </div>
                    <br/>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary btn-lg btn-block" value="Guardar"> 
                    </div>
                </form>
            </div>



            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7 wow fadeInLeft" data-wow-delay=".3s" >

                <a href="<%=foto%>.jpg" rel="lightbox [a]" title="fotos">
                    <img src="<%=foto%>.jpg" class="img-responsive" alt="" >
                    <figure>
                        <figcaption>foto Del Cliente</figcaption>
                    </figure>
                </a>

            </div>

        </div>
    </div>
</section>
<jsp:include page="footer.jsp"/>





