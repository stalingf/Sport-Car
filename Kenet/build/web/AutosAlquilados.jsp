<%-- 
    Document   : AutosAlquilados
    Created on : 25-dic-2015, 14:25:39
    Author     : staling
--%>
<%@page import="Hibernate.Alquilado"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="header.jsp"/>

<section class="global-page-header">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="block">
                    <h2>AUTOS ALQUILADOS</h2>
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

            <% ArrayList<Alquilado> auto = (ArrayList<Alquilado>) request.getAttribute("Alquilados"); %>
            <% if (auto == null) {%>
            <h1> NO HAY CARROS EN TALLER </h1>

            <%} else {
                for (int i = 0; i < auto.size(); i++) {
                    String nombre = auto.get(i).getNombreCliente();
                    String apellido = auto.get(i).getApellidoCliente();
                    String cedula = auto.get(i).getCedulaCliente();
                    String fotocliente = auto.get(i).getFotoCliente();
                    String marca = auto.get(i).getMarcaAuto();
                    String modelo = auto.get(i).getModeloAuto();
                    String codigo = auto.get(i).getCodigoAuto();
                    String fotoauto = auto.get(i).getFotoAuto();

                    int id = auto.get(i).getId();
            %>

            <div class="col-sm-4 col-xs-12">
                <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">
                    <div class="img-wrapper">
                        <img src="<%=fotocliente%>250x360.jpg"  class="img-responsive" alt="this is a title" >
                        <div class="overlay">
                            <div class="buttons">
                               <!-- <a target="_blank" class="fancybox" href="IMG.jsp?K=<%=fotocliente%>&P=usuario">Cliente</a>
                                <a target="_blank" class="fancybox" href="IMG.jsp?P=autos&K=<%=fotoauto%>">Auto</a>
                                -->
                            </div>
                        </div>
                    </div>
                </figure>   
                <figure>   
                    <figcaption>
                        <h4>
                            <a>
                                Nombre: <%=" " + nombre%>
                            </a>
                        </h4>
                        <p>
                            Apellido: <%=" " + apellido%>
                        </p>
                        <p>
                            Cedula: <%=" " + cedula%>
                        </p>

                        <p>
                            Marca del auto: <%=" " + marca%>
                        </p>

                        <p>
                            Modelo del auto: <%=" " + modelo%>
                        </p>
                        <p>
                            Codigo del auto: <%=" " + codigo%>
                        </p>

                    </figcaption>
                </figure>
            </div>
            <%}
                    //  session.removeAttribute("Taller");
                }%>


        </div>
    </div>
                 <% try {
       
         String pagina = request.getParameter("Pagina");
        if(pagina==null){
            pagina = "0";
        }
        int psagina = Integer.parseInt(pagina);
                      %>
    <center> <% if (psagina > 0) {%>

        <a href="/SportCar/Rentados.html?Pagina=<%=psagina - 1%>"><button type="button">Atras</button></a>

        <%}%> 

        <a href="/SportCar/Rentados.html?Pagina=<%=psagina + 1%>"><button type="button">Siguiente</button></a> </center>


    <%} catch (Exception e) {

    %>
    <script href = "/SportCar" ></script>

    <%}%>
</section>
<jsp:include page="footer.jsp"/>

