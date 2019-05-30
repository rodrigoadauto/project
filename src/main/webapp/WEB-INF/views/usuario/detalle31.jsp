/${sessionScope.usuario.id}<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/" var="rootUrl" />


<!DOCTYPE jsp>
<html>

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
        <link href="${urlPublic}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="${urlPublic}/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="${urlPublic}/css/sb-admin.css" rel="stylesheet">

    </head>

    <body class="color" >

        <jsp:include page="BarraSuperiorModerador.jsp" />

        <!-- Page Content -->
        <div id="wrapper"> 

            <jsp:include page="MenuModerador.jsp" />

            <div id="content-wrapper">

                <div class="container-fluid">

                    <div class="card">
                        <div class="card-header"> <strong> DETALLES DEL EVENTO </strong></div>

                        <div class="card-body">
                            <div class="input-group">

                            </div>

                            <c:forEach items="${evento}" var= "evento">

                                <div class="card mt-4">
                                    <img class="card-img-top img-fluid"  style="width:1500px;height:300px;" src="${rootUrl}fileUploaded/${evento.foto}" alt="">
                                    <div class="card-body">


                                        <div class="d-flex">
                                            <h3 class="text-left" > ${evento.nombre}   </h3>
                                            <button type="button" class=" btn btn-sm btn-light mb-4 ml-auto mr-4 p-2 text-dark float-right border-secondary rounded-pill" > ${evento.categoria.nombreCategoria}  </button>

                                        </div>
                                        <h5> Creador : ${evento.usuario.nombre} ${evento.usuario.apellido} </h5>
                                        <h5> Fecha de inicio: ${evento.fecha} ${evento.horaInicio} </h5>
                                        <h5> Fecha de fin: ${evento.fecha} ${evento.horaFin} </h5>
                                        <h5> Lugar: ${evento.lugar} </h5>
                                        <h5> Descripción:${evento.descripcion} </h5>

                                        <div >


                                            <a class="btn btn-danger btn-lg float-right " href="${rootUrl}moderador/eventosAsistidosOcurridos/${sessionScope.usuario.id}" role="button"> Regresar </a>












                                            </c:forEach>



                                        </div>     
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <jsp:include page="codigojs.jsp" />
    </body>

</html>
