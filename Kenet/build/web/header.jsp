<%-- 
    Document   : header
    Created on : 19-dic-2015, 1:09:42
    Author     : staling
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nombre = (String) session.getAttribute("nombre");
    String clave = (String) session.getAttribute("clave");
    String rango = (String) session.getAttribute("rango");
%> 
<!DOCTYPE html>
<html class="no-js">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="icon" type="image/*" href="images/icos.ico">
        <title>SportCar</title>
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <meta name="format-detection" content="telephone=no">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/ionicons.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/slider.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.css">
        <link rel="stylesheet" href="css/jquery.fancybox.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/responsive.css">
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/slider.js"></script>
        <script src="js/jquery.fancybox.js"></script>
        <script src="js/main.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"> <\/script>')</script>
        <script src="js/jquery.nav.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/main.js"></script>
        <script type="text/javascript" src="js/prototype.js"></script>
        <script type="text/javascript" src="js/scriptaculous.js?load=effects,builder"></script>
        <script type="text/javascript" src="js/lightbox.js"></script>
        <link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen" />

        <style>
            .btn-file {
                position: relative;
                overflow: hidden;
            }
            .btn-file input[type=file] {
                position: absolute;
                top: 0;
                right: 0;
                min-width: 100%;
                min-height: 100%;
                font-size: 100px;
                text-align: right;
                filter: alpha(opacity=0);
                opacity: 0;
                outline: none;
                background: white;
                cursor: inherit;
                display: block;
            }
        </style>

    </head>
    <body>
        <header id="top-bar" class="navbar-fixed-top animated-header">
            <div class="container">
                <div class="navbar-header">
                    <!-- responsive nav button -->
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <div class="navbar-brand">
                        <a href="/SportCar" >
                            <img src="images/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <nav class="collapse navbar-collapse navbar-right" role="navigation">
                    <div class="main-menu">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="/SportCar" >INICIO</a>
                            </li>
                            <li><a data-wow-delay=".9s" href="/SportCar/#about" >Acerca de...</a></li>
                                <%if (nombre == null || nombre.length() < 2) {%>
                            <li><a href="Login.jsp">LOGIN</a></li>
                                <%} else {%>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Autos<span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="Taller.html">taller</a></li>
                                        <li><a href="Autos.html">Lista de Todos los autos</a></li>
                                        <li><a href="Rentados.html">Rentados</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Cliente<span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="RegistroClientes.jsp">Registrar Cliente</a></li>
                                        <li><a href="RegresarAuto.jsp">Regresa auto</a></li>
                                        <li><a href="RentarAuto.jsp">Renta auto</a></li>
                                        <li><a href="Clientes.html">lista de clientes</a></li>
                                    </ul>
                                </div>
                            </li>
                            <% if (rango.equals("10")) {%>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Opciones<span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="RegistarAdmin.jsp">REGISTAR ADMIN</a></li>
                                        <li><a href="RegistrarAutos.jsp">Registrar auto</a></li>
                                    </ul>
                                </div>
                            </li>
                            <%}%>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=nombre%> <span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul> <li><a href="Out">Salir</a></li>
                                    </ul>
                                </div>
                            </li>
                            <%}%>
                        </ul>
                    </div>
                </nav>
            </div>
        </header>
