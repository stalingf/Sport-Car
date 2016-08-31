<%-- 
    Document   : Login
    Created on : 19-dic-2015, 10:42:14
    Author     : staling
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% if (session.getAttribute("rango") != null) {
        if (!session.getAttribute("rango").equals("10") && !session.getAttribute("rango").equals("2")) {
            response.sendRedirect("/SportCar");
        }
    } else {
        response.sendRedirect("/SportCar");
    }
%>

<jsp:include page="header.jsp"/>

<section class="global-page-header">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="block">
                    <h2>Registro de Clientes</h2>
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
                    <% String error = (String) session.getAttribute("Mensaje"); %>

                    <% if (error != null) {%>
                    <h1><%=error%></h1>
                    <% session.removeAttribute("Mensaje"); %>
                    <%}%>
                </center>
                <form method="post" action="RClientes.html" enctype="multipart/form-data"><!--onsubmit="return Rentar()"-->
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" placeholder="Nombre" name="Nombre" required="required" id="Email">
                    </div>
                    <br/>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" placeholder="Apellido" name="Apellido" required="required" id="Apellido">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" placeholder="Cedula" name="Cedula" required="required" id="Cedula">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" placeholder="Telefon" name="Telefono" required="required" id="Telefono">
                    </div>
                    <div class="form-group">
                           
                        <span class="btn btn-primary btn-file btn-lg">
                          FOTO CLIENTE <input type="file" accept="image/*" class="form-control input-lg" name="foto" required="required" id="foto">
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

</body>
</html>



