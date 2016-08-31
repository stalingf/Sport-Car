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
                    <h2>Registro de Administradores</h2>
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
                <form  method="post" action="RegistrarAdmin.html" enctype="multipart/form-data"><!--onsubmit="return Rentar()"-->
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
                        <input type="number" class="form-control input-lg" placeholder="Telefono" name="Telefono" required="required" id="Telefono">
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control input-lg" placeholder="Email" name="Email" required="required" id="Email">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control input-lg" placeholder="Clave" name="clave" required="required" id="clave">
                    </div>
                    <div class="form-group">
                        
                        <span class="btn btn-primary btn-file">
                            Rango <input type="number" class="form-control bfh-number" min="1" max="10" value="1"  name="rango" required="required" id="rango">
                        </span>
                        
                             </div>
                    <div class="form-group">

                        <span class="btn btn-primary btn-file btn-lg">
                            Foto Admin <input type="file" accept="image/*"  name="foto"id="foto">
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



