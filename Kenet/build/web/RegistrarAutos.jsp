<%-- 
    Document   : Login
    Created on : 19-dic-2015, 10:42:14
    Author     : staling

--%>

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
                    <h2>Registro de Autos</h2>
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

                    <% String Mensaje = (String) session.getAttribute("Mensaje"); %>

                    <% if (Mensaje != null) {%>
                    <h1><%=Mensaje%></h1>
                    <% session.removeAttribute("Mensaje"); %>
                    <%}%>
                </center>
                <form  method="post" action="Autosr.html" enctype="multipart/form-data"><!--onsubmit="return Rentar()"-->
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" placeholder="Marca" name="Marca" required="required" id="Marca">
                    </div>
                    <br/>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" placeholder="Modelo" name="Modelo" required="required" id="Modelo">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" placeholder="Año" name="Ano" required="required" id="ano">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" placeholder="Color" name="Color" required="required" id="Email">
                    </div>
                    <div class="form-group">
                        <input type="number" min="100" max="1000" class="form-control input-lg" placeholder="Taza" name="Taza" required="required" id="Taza">
                    </div>
                    <div class="form-group">
                        <span class="btn btn-primary btn-file">
                            Principal <input type="file" accept="image/*"  name="foto1"id="foto1">
                        </span>
                        <span class="btn btn-success btn-file">
                            Foto2 <input type="file" accept="image/*"  name="foto2"id="foto2">
                        </span>
                        <span class="btn btn-success btn-file">
                            Foto3 <input type="file" accept="image/*"   name="foto3"id="foto3">
                        </span>
                        <span class="btn btn-success btn-file">
                            Foto4 <input type="file" accept="image/*"    name="foto4"id="foto4">
                        </span>
                        <span class="btn btn-success btn-file">
                            Foto5 <input type="file" accept="image/*"  name="foto5" id="foto5">
                        </span>
                    </div>
                    <br/>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary btn-lg btn-block" value="Guardar"> 
                    </div>
                </form>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7 wow fadeInLeft" data-wow-delay=".3s" >
                <img src="images/about/about-company.jpg" alt="" class="img-responsive">
            </div>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp"/>



