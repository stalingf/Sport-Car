<%-- 
    Document   : galeria
    Created on : 10-dic-2015, 13:33:10
    Author     : staling
--%>

<%@page import="Hibernate.Usuario"%>

<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>



<jsp:include page="header.jsp"/>

<section class="global-page-header">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="block">
                    <h2>Todos los Clientes</h2>
                    <ol class="breadcrumb">


                    </ol>
                </div>
            </div>
        </div>
    </div>
</section><!--/#Page header-->
<section id="gallery" class="gallery">
    <div class="container">
        <div class="row">

            <% ArrayList<Usuario> cliente = (ArrayList<Usuario>) request.getAttribute("ListaClientes");

                String foto = null; %>
            <%if (cliente == null) {%>
            <h1> NO HAY CLIENTES </h1>

            <%} else {
                for (int i = 0; i < cliente.size(); i++) {
                    String nombre = cliente.get(i).getNombre();

                    String apellido = cliente.get(i).getApellido();
                    String cedula = cliente.get(i).getCedula();
                    String telefono = cliente.get(i).getTelefono();
                    foto = cliente.get(i).getFoto();

                    int id = cliente.get(i).getId();

            %>

            <div class="col-sm-4 col-xs-12">
                
                <a href="<%=foto%>.jpg" rel="lightbox [a]" title="fotos">
                    <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">
                        <div class="img-wrapper">
                            <img src="<%=foto%>250x360.jpg" class="img-responsive" alt="this is a title" >

                        </div>
                    </figure> 
                </a>
                <figure>
                    <figcaption>
                        <h4>
                            <a>
                                Nombre <%=" " + nombre%>
                            </a>
                        </h4>
                        <p>
                        <h5>Apellido: <%=" " + apellido%></h5> 
                        </p>
                        <p>
                        <h5>Cedula: <%=" " + cedula%></h5> 

                        <h5>Telefono: <%=" " + telefono%></h5>
                        </p>

                        <% if (session.getAttribute("rango") != null && session.getAttribute("rango").equals("10")) {%>

                        <h4>
                            <a href="clienteEdit.jsp?K=<%=id%>"> <h5> Modificar Cliente<h5>
                                        </a>
                                        </h4>
                                        <%} %>
                                        </figcaption>
                                        </figure>
                                        </div>
                                        <% }
                                            }%> 
                                        </div>
                                        </div>
                                        <% try {

                                                String pagina = request.getParameter("Pagina");
                                                if (pagina == null) {
                                                    pagina = "0";
                                                }
                                                int psagina = Integer.parseInt(pagina);
                                        %>
                                        <center> <% if (psagina > 0) {%>

                                            <a href="/SportCar/Clientes.html?Pagina=<%=psagina - 1%>"><button type="button">Atras</button></a>

                                            <%}%> 

                                            <a href="/SportCar/Clientes.html?Pagina=<%=psagina + 1%>"><button type="button">Siguiente</button></a> </center>


                                        <%} catch (Exception e) {

                                        %>
                                        <script href = "/SportCar" ></script>

                                        <%}%>
                                        </section>
                                        <jsp:include page="footer.jsp"/>

