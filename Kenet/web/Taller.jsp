<%-- 
    Document   : galeria
    Created on : 10-dic-2015, 13:33:10
    Author     : staling
--%>

<%@page import="Hibernate.Autos"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


        <jsp:include page="header.jsp"/>
       
        <section class="global-page-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <h2>TALLER</h2>
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

                    <% ArrayList<Autos> auto = null;
                    auto = (ArrayList<Autos>) request.getAttribute("Taller"); %>
                    <% if (auto == null) {%>
                    <h1> NO HAY CARROS EN TALLER </h1>

                    <%} else {
                        for (int i = 0; i < auto.size(); i++) {
                            String marca = auto.get(i).getMarca();
                            String modelo = auto.get(i).getModelo();
                            String ano = auto.get(i).getAno();
                            String codigo = auto.get(i).getCodigo();
                            String foto1 = auto.get(i).getFoto1();
                            String estado = auto.get(i).getEstado();
                            String color = auto.get(i).getColor();
                            String taza = auto.get(i).getTaza();
                            String motivo = auto.get(i).getMotivo();
                            int id = auto.get(i).getId();
                    %>

                    <div class="col-sm-4 col-xs-12">
                        <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">
                            <div class="img-wrapper">
                                <img src="<%=foto1%>250x360.jpg" class="img-responsive" alt="this is a title" >
                                <div class="overlay">
                                    <div class="buttons">

                                    </div>
                                </div>
                            </div>
                                
                            <figcaption>
                                <h4>
                                    <a>
                                        Marca: <%=" " + marca%>
                                    </a>
                                </h4>
                                <p>
                                    Modelo: <%=" " + modelo%>
                                </p>
                                <p>
                                    Año: <%=" " + ano%>
                                </p>
                                <%
                                  if (session.getAttribute("rango") != null && session.getAttribute("rango").equals("1") | session.getAttribute("rango").equals("10")) {%>
                                <p> 
                                    Codigo: <%=" " + codigo%>
                                </p>

                                <p>
                                    Estado: <%=" " + estado%>
                                </p>
                                <%}%>
                                <p>
                                    Color: <%=" " + color%>
                                </p>

                                <p>
                                    Motivo por esta en el taller  <%=" " + motivo%> 
                                </p>
                                <% if (session.getAttribute("rango") != null && session.getAttribute("rango").equals("10")) {%>

                                <p>
                                   
                                        ID del Carro :  <%=" " + id%>
                                    
                                    
                                <p>
                                <%} if (session.getAttribute("rango") != null && session.getAttribute("rango").equals("10") | session.getAttribute("rango").equals("1")){%>
                                <h4>
                                    <a href="Despachar.html?Despachar=<%=codigo%>">
                                        Despachar auto
                                       
                                    </a>
                                    
                                </h4>
                                
                                <%}%>
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

        <a href="/SportCar/Taller.html?Pagina=<%=psagina - 1%>"><button type="button">Atras</button></a>

        <%}%> 

        <a href="/SportCar/Taller.html?Pagina=<%=psagina + 1%>"><button type="button">Siguiente</button></a> </center>


    <%} catch (Exception e) {

    %>
    <script href = "/SportCar" ></script>

    <%}%>
    </section>
    <jsp:include page="footer.jsp"/>

