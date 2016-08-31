<%-- 
    Document   : index
    Created on : 19-dic-2015, 1:11:11
<a href="SvMedex.verInfo(fila.DNI_Usuario)">${fila.DNI_Usuario}</a>
    Author     : staling
--%>
<%@page import="java.lang.String"%>
<%@page import="Hibernate.Query"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Hibernate.Autos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>

<section id="hero-area" >
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="block wow fadeInUp" data-wow-delay=".3s">
                    <section class="cd-intro">
                        <h1 class="wow fadeInUp animated cd-headline slide" data-wow-delay=".4s" >
                            <span>SIEMPRE A TU LADO </span><br>
                            <span class="cd-words-wrapper">
                                <b class="is-visible">SPORTS CAR</b>
                                <b>DEVELOPER</b>
                                <b>FATHER</b>
                            </span>
                        </h1>
                    </section>
                    <h2 class="wow fadeInUp animated" data-wow-delay=".6s" >
                        La mejor oferta para rentar tu Auto hoy mismo en Sport Car  </h2>
                    <a class="btn-lines dark light wow fadeInUp animated smooth-scroll btn btn-default btn-green" data-wow-delay=".9s" href="#works" data-section="#works" >VER GALERIA DE AUTOS</a>
                </div>
            </div>
        </div>
    </div>
</section>

<section >
    <div class="container">
        <div class="row">
            <center><h1>Buscar Auto</h1></center>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5 ">
                <center>
                    <% String error = (String) session.getAttribute("Mensaje"); %>

                    <% if (error != null) {%>
                    <h1><%=error%></h1>

                    <% session.removeAttribute("Mensaje");
                        }%>
                </center>
                <br/>
                <br/>
                <br/>
                <form method="post" action="?Marca=" ><!--onsubmit="return Rentar()"-->
                    <div class="form-group">
                      
                        <select class="form-control input-lg">
                            <option>MARCA</option>
                            <option>TOYOTA</option>
                        </select>    
                    </div>
                   <div class="form-group">
                       <select class="form-control input-lg">
                           <option>MODELO</option>
                           <option>CAMRY</option>
                       </select>
                   </div>
                   <div class="form-group">
                      <select class="form-control input-lg">
                            <option value="0">AÑO</option>
                            <option value="2012">2012</option>
                            <option value="2013">2013</option>
                            <option value="2014">2014</option>
                        </select>
                   </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary btn-lg btn-block" value="Buscar"> 
                    </div>
                </form>
            </div>
        </div>
    </div> 
</section>

<section id="works" class="works">
    <div class="container">
        <div class="container">
            <div class="section-heading">
                <h1 class="title wow fadeInDown" data-wow-delay=".3s"><h1>GALERIA DE AUTOS</h1>
                <p class="wow fadeInDown" data-wow-delay=".5s">

                </p>
            </div>
            <div class="row">
                <% String Pagina = request.getParameter("Pagina");
                    if (Pagina == null) {
                        Pagina = "0";
                    }
                    ArrayList<Autos> auto = new Query().index(Pagina); %>
                <%if (auto == null) {%>
                <h1>Noy hay Autos Disponible</h1>
                <%} else {
                    for (int i = 0; i < auto.size(); i++) {
                        String marca = auto.get(i).getMarca().toUpperCase();
                        String modelo = auto.get(i).getModelo().toUpperCase();
                        String ano = auto.get(i).getAno().toUpperCase();
                        String codigo = auto.get(i).getCodigo().toUpperCase();
                        String foto = auto.get(i).getFoto1();
                        String estado = auto.get(i).getEstado().toUpperCase();
                        String color = auto.get(i).getColor().toUpperCase();
                        String taza = auto.get(i).getTaza();
                        int id = auto.get(i).getId();
                %>
                <div class="col-sm-4 col-xs-12">
                    <a href="detalleauto.jsp?C=<%=codigo%>">
                        <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">
                            <div class="img-wrapper">
                                <img src="<%=foto%>250x360.jpg"  class="img-responsive" alt="this is a title"  >
                            </div>
                        </figure>
                    </a>
                    <figure>
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
                                Taza:  <%="  RD$  " + taza + "  "%> por Dia
                            </p>
                            <p>
                                Codigo: <%=" " + codigo%>
                            </p>
                            <% if (session.getAttribute("rango") != null && session.getAttribute("rango").equals("10")) {%>
                            <p>
                                ID:  <%="   " + id + "  "%>
                            </p>
                            <h5>
                                <a href="editarAuto.jsp?Editar=<%=codigo%>">
                                    Modificar Auto
                                </a>
                            </h5>
                            <%}%>
                        </figcaption>
                    </figure>
                </div>
                <%}
                    }%>
            </div>
        </div>
    </div>
    <% try {
            int psagina = Integer.parseInt(Pagina); %>
    <center> <% if (psagina > 0) {%>

        <a href="/SportCar?Pagina=<%=psagina - 1%>"><button type="button" class="btn btn-success">Atras</button></a>

        <%}%> 

        <a href="/SportCar?Pagina=<%=psagina + 1%>"><button type="button" class=" btn btn-success">Siguiente</button></a> </center>


    <%} catch (Exception e) {

    %>
    <script href = "/SportCar" ></script>

    <%}%>
</section> 
<section id="about">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6">
                <div class="block wow fadeInLeft" data-wow-delay=".3s" data-wow-duration="500ms">
                    <h2>
                        SPORT CAR
                    </h2>
                    <p>
                        Somos una empresa que vela por la comodidad de nuestros clientes a menor precios del mercado tenemos más de 10 años de experiencia y brindado servicios a nuestro Clientes.     
                    </p>

                </div>
            </div>
            <div class="col-md-6 col-sm-6">
                <div class="block wow fadeInRight" data-wow-delay=".3s" data-wow-duration="500ms">
                    <img src="images/about/about.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</section> 
<jsp:include page="footer.jsp"/>