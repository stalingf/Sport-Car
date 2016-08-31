<%-- 
    Document   : editarAuto
    Created on : 25-dic-2015, 19:01:53
    Author     : staling
--%>

<%@page import="Hibernate.Autos"%>
<%@page import="Hibernate.Query"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("rango") == null || !session.getAttribute("rango").equals("10")) {
        response.sendRedirect("/SportCar");
    }%>


<jsp:include page="header.jsp"/>

<section class="global-page-header">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="block">
                    <h2>Editar Autos</h2>
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
                    <% String Marca = "", Modelo = "", Ano = "", Codigo = "", Color = "", Taza = "", id = "", edit = "", foto = "", foto2 = "";
                        String foto3 = "";
                        String foto4 = "";
                        String foto5 = "";
                        String codigo = "";
                        Autos auto = null;
                        if (request.getParameter("Editar") != null) {
                            edit = request.getParameter("Editar").toString();
                            auto = new Query().buscarporid(edit);
                            Marca = auto.getMarca().toUpperCase();
                            Modelo = auto.getModelo().toUpperCase();
                            Ano = auto.getAno().toUpperCase();
                            Color = auto.getColor().toUpperCase();
                            Taza = auto.getTaza().toUpperCase();
                            foto = auto.getFoto1();
                            foto2 = auto.getFoto2();
                            foto3 = auto.getFoto3();
                            foto4 = auto.getFoto4();
                            foto5 = auto.getFoto5();
                            codigo = auto.getCodigo();
                            id = auto.getId().toString().toUpperCase();
                        }%>
                    <% String Mensaje = (String) session.getAttribute("Mensaje"); %>
                    <% if (Mensaje != null) {%>
                    <h1><%=Mensaje%></h1>
                    <% session.removeAttribute("Mensaje"); %>
                    <%}%>
                </center>
                <form name="<%=edit%>" method="post" action="Editar.html?codigo=<%=codigo%>" enctype="multipart/form-data"><!--onsubmit="return Rentar()"-->
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" placeholder="Marca" required="required" value="<%=Marca%>" name="Marca" id="Marca">
                    </div>
                    <br/>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" placeholder="Modelo" required="required" value="<%=Modelo%>" name="Modelo" id="Modelo">
                    </div>
                    <div class="form-group">
                        <input type="number" min="1980" max="2017" class="form-control input-lg" placeholder="Año" required="required" value="<%=Ano%>" name="Ano" id="ano">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" placeholder="Color" required="required" value="<%=Color%>"name="Color" id="Email">
                    </div>
                    <div class="form-group">
                        <input type="number" min="100" max="1000"  class="form-control input-lg" placeholder="Taza" required="required" value="<%=Taza%>"name="Taza" id="Taza">
                    </div>
                    <div class="form-group">
                        <span class="btn btn-primary btn-file">
                            Principal <input type="file" accept="image/*" name="foto1"id="foto1">
                        </span>
                        <span class="btn btn-success btn-file">
                            Foto2 <input type="file" accept="image/*"  name="foto2"id="foto2">
                        </span>
                        <span class="btn btn-success btn-file">
                            Foto3 <input type="file" accept="image/*"  name="foto3"id="foto3">
                        </span>
                        <span class="btn btn-success btn-file">
                            Foto4 <input type="file" accept="image/*"  name="foto4"id="foto4">
                        </span>
                        <span class="btn btn-success btn-file">
                            Foto5 <input type="file" accept="image/*"  name="foto5"id="foto5">
                        </span>
                    </div>
                    <br/>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary btn-lg btn-block" value="Guardar"> 
                    </div>
                </form>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 wow fadeInLeft" data-wow-delay=".3s" >
                <div class="row">
                    <div class="col-xs-12  col-md-6 ">
                        <a href="<%=foto%>.jpg" rel="lightbox [a]" title="fotos">
                            <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">
                                <div class="img-wrapper">
                                    <img src="<%=foto%>250x360.jpg" alt="" class="img-responsive">
                                </div>
                                <figcaption>foto 1</figcaption>
                            </figure>
                        </a>

                    </div>
                    <%if (foto2 != null) {%>
                    <div class="col-xs-12  col-md-3 ">
                        <a href="<%=foto2%>.jpg" rel="lightbox [a]" title="fotos">
                            <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">
                                <div class="img-wrapper">
                                    <img src="<%=foto2%>250x360.jpg" alt="" class="img-responsive">
                                </div>
                                <figcaption>foto 2</figcaption>
                            </figure>
                        </a>
                    </div>
                    <%}
                        if (foto3 != null) {%>
                    <div class="col-xs-12  col-md-3 ">
                        <a href="<%=foto3%>.jpg" rel="lightbox [a]" title="fotos">
                            <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">
                                <div class="img-wrapper">
                                    <img src="<%=foto3%>250x360.jpg" alt="" class="img-responsive">
                                </div>
                                <figcaption>foto 3</figcaption>
                            </figure>
                        </a>
                    </div>
                    <%}
                        if (foto4 != null) {%>
                    <div class="col-xs-12  col-md-3 ">
                        <a href="<%=foto4%>.jpg" rel="lightbox [a]" title="fotos">
                            <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">
                                <div class="img-wrapper">
                                    <img src="<%=foto4%>250x360.jpg" alt="" class="img-responsive">
                                </div>
                                <figcaption>foto 4</figcaption>
                            </figure>
                        </a>
                    </div>
                    <%}
                        if (foto5 != null) {%>
                    <div class="col-xs-12 col-md-3">
                        <a href="<%=foto5%>.jpg" rel="lightbox [a]" title="fotos">
                            <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">
                                <div class="img-wrapper">
                                    <img src="<%=foto5%>250x360.jpg" alt="" class="img-responsive">
                                </div>
                                <figcaption>foto 5</figcaption>
                            </figure>
                        </a>
                    </div>
                    <%}%>
                </div>
                <figure>
                    <figcaption>foto Del Auto</figcaption>
                </figure>
            </div>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp"/>





