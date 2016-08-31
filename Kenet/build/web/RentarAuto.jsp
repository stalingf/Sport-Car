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
                    <h2>Rentar Auto</h2>
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
                    <% session.removeAttribute("Mensaje");%>
                    <%}%>
                </center>
                <form method="post" action="Rentar.html" ><!--onsubmit="return Rentar()"-->
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" placeholder="Cedula Cliente" name="Cedula" required="required" id="Cedula">
                    </div>
                    <br/>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" placeholder="Codigo del auto" name="Codigo" required="required" id="Codigo">
                    </div>
                   
                    <div class="form-group">
                        
                        <span class="btn btn-primary btn-xm">
                          Fecha de regreso <input type="date" class="form-control input-xs" name="Regresar" required="required" id="Regresar">
                            
                        </span>
                        
                    </div>
                   
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



