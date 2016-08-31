<%-- 
    Document   : Login
    Created on : 19-dic-2015, 10:42:14
    Author     : staling
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>

<section class="global-page-header">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="block">
                    <h2>Login</h2>
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

                    <% session.removeAttribute("Mensaje");}%>
                </center>
                 <br/>
                 <br/>
                 <br/>
                <form method="post" action="Entrada.html" ><!--onsubmit="return Rentar()"-->
                    <div class="form-group">
                        <input type="email" class="form-control input-lg" placeholder="Email" name="Email" required="required" id="Email">
                    </div>
                     <br/>
                    <div class="form-group">
                        <input type="password" class="form-control input-lg" placeholder="Clave" name="Clave" required="required" id="Clave">
                    </div>
                     <br/>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary btn-lg btn-block" value="Entrar"> 
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
