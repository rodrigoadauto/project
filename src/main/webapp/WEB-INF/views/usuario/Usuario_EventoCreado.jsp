<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/" var="urlBase" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>



<!DOCTYPE jsp>
<html >

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Eventos_Publicos</title>
        <jsp:include page="codigolinks.jsp" />

        <script>
            $(document).ready(function () {
                
                $("#sidebarToggle").click(function () {


                    if ($("#MainMenu").css("display") == "none") {
                        $("#MainMenu").css("display", "flex");
                    } else {
                        $("#MainMenu").css("display", "none");
                    }

                });
            })
        </script>
        <style>
            .color{
                background-color: black;
                padding-top: 0px !important; 
            }
            .bd-sidebar{
                position: sticky; 
                height: calc(-4rem + 100vh); 
                z-index: 1000;
                top: 3rem;
            }
            .flex-xl-nowrap{
                -ms-flex-nowrap: nowrap !important;
                flex-wrap: nowrap !important ;

            }

        </style>
    </head>

    <body class="color" >

        <jsp:include page="BarraSuperiorUsuario.jsp" />

        <!-- Page Content -->
        <div id="wrapper"> 

            <jsp:include page="MenuUsuario.jsp" />

            <div id="content-wrapper">


                <div class="container-fluid">

                    <div class="card">
                        <div class="card-header "> <strong> Evento Creado Satisfactoriamente</strong> </div>

                        <div class="card-body">
                            <p>Muchas gracias por usar nuestros servicios tu evento ha sido creado,ya lo puede visualizar en los eventos públicos.Los modeadores y administradores lo revisarán para corroborar que todo está bien</p>


                        </div>

                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="codigojs.jsp" />
    </body>

</html>


