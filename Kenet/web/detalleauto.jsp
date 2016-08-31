<%-- 
    Document   : detalleauto
    Created on : 18-ene-2016, 20:57:17
    Author     : staling
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Hibernate.Autos"%>
<%@page import="Hibernate.Query"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String detalle = request.getParameter("C");%>
<jsp:include page="header.jsp"/>
<section class="global-page-header">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="block">
                    <h2>DETALLES</h2>
                    <ol class="breadcrumb">
                    </ol>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="portfolio-single">
    <div class="container">
        <div class="row">
            <% Autos auto = auto = new Query().buscarporid(detalle);
                if (auto == null) {%>
            <h1>No Disponible</h1>
            <%} else {
                String marca = auto.getMarca().toUpperCase();
                String modelo = auto.getModelo().toUpperCase();
                String ano = auto.getAno().toUpperCase();
                String codigo = auto.getCodigo().toUpperCase();
                String foto = auto.getFoto1();
                String foto2 = auto.getFoto2();
                String foto3 = auto.getFoto3();
                String foto4 = auto.getFoto4();
                String foto5 = auto.getFoto5();
                String estado = auto.getEstado().toUpperCase();
                String color = auto.getColor().toUpperCase();
                String taza = auto.getTaza();
                int id = auto.getId();
                if (foto != null) {%>
            <div class="col-xs-12 col-sm-4">
                <a href="<%=foto%>.jpg" rel="lightbox [a]" title="fotos">
                    <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">

                        <div class="img-wrapper"> 
                            <img src="<%=foto%>250x360.jpg"  class="img-responsive" alt="this is a title"/>

                        </div>

                    </figure>
                </a>
                <figcaption>
                    <h4>
                        <a>
                            Marca:   <%="  " + marca%>
                        </a>
                    </h4>
                    <p>
                        Modelo: <%="  " + modelo%>
                    </p>
                    <p>
                        Año: <%="  " + ano%>
                    </p>
                    <p>
                        Codigo: <%="  " + codigo%>
                    </p>

                    <p>
                        Color: <%="  " + color%>
                    </p>
                    <p>
                        Taza:  <%="  RD$  " + taza + "  "%> por Dia
                    </p>

                </figcaption>
            </div>
            <%}
                if (foto2 != null) {%>
            <div class="col-xs-12 col-sm-3">
                <a href="<%=foto2%>.jpg" rel="lightbox [a]" title="fotos">
                    <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">

                        <div class="img-wrapper"> 
                            <img src="<%=foto2%>250x360.jpg"  class="img-responsive" alt="this is a title"/>

                        </div>
                    </figure>
                </a>
            </div>
            <%}
                if (foto3 != null) {%>
            <div class="col-xs-12 col-sm-3">
                <a href="<%=foto3%>.jpg" rel="lightbox [a]" title="fotos">
                    <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">
                        <div class="img-wrapper"> 
                            <img src="<%=foto3%>250x360.jpg"  class="img-responsive" alt="this is a title"  >

                        </div>
                    </figure>
                </a>
            </div>
            <%}
                if (foto4 != null) {%>
            <div class="col-xs-12 col-sm-3">
                <a href="<%=foto4%>.jpg" rel="lightbox [a]" title="fotos">
                    <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">
                        <div class="img-wrapper"> 
                            <img src="<%=foto4%>250x360.jpg"  class="img-responsive" alt="this is a title"  >
                        </div>
                    </figure>
                </a>
            </div>
            <%}
                if (foto5 != null) {%>
            <div class="col-xs-12 col-sm-3">
                <a href="<%=foto5%>.jpg" rel="lightbox [a]" title="fotos">
                    <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">
                        <div class="img-wrapper"> 
                            <img src="<%=foto5%>250x360.jpg"  class="img-responsive" alt="this is a title"  >
                        </div>
                    </figure>
                </a>
            </div>
            <%}%>
        </div>
        <%}%>
    </div>
</section>
<section class="works works-fit">
    <div class="container">
        <h2 class="subtitle">ULTIMOS AUTOS</h2>
        <p class="subtitle-des">
        </p>
        <div class="row">
            <% ArrayList<Autos> auto2 = new Query().index2();
                for (int i = 0; i < auto2.size(); i++) {
                    String fotoINICIO = auto2.get(i).getFoto1();
                    String modeloINICIO = auto2.get(i).getModelo();
                    String marcaINICIO = auto2.get(i).getMarca();
                    String tazaINICIO = auto2.get(i).getTaza();
                    String codigo = auto2.get(i).getCodigo();
                   
            %>
            <div class="col-sm-3">
                <a href="detalleauto.jsp?C=<%=codigo%>">
                    <figure class="wow fadeInLeft animated portfolio-item animated" data-wow-duration="300ms" data-wow-delay="0ms" style="visibility: visible; animation-duration: 300ms; -webkit-animation-duration: 300ms; animation-delay: 0ms; -webkit-animation-delay: 0ms; animation-name: fadeInLeft; -webkit-animation-name: fadeInLeft;">
                        <div class="img-wrapper">
                            <img src="<%=fotoINICIO%>250x360.jpg" class="img-responsive" alt="portfolio items">
                        </div>
                        <figcaption>
                            <h4>
                                <a>
                                    Marca: <%=" " + marcaINICIO%>     
                                </a>
                            </h4>
                            <p>
                                Modelo: <%=" " + modeloINICIO%> 
                            </p>
                            <p>
                                Taza: <%=" " + tazaINICIO + " "%> Por Dia 
                            </p>
                        </figcaption>
                    </figure
                </a>
            </div>
            <% }%>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp"/>