<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic" />


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

        <jsp:include page="BarraSuperiorUsuario.jsp" />

        <!-- Page Content -->
        <div id="wrapper"> 

            <jsp:include page="MenuUsuario.jsp" />

            <div id="content-wrapper">

                <div class="container-fluid">

                    <div class="card">
                        <div class="card-header "> <strong> EDITAR EVENTO</strong> </div>

                        <div class="card-body">


                            <form>


                                <div class="form-group">
                                    <label for="exampleInputEmail1">Foto Del Evento</label>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <img class="card-img-top img-fluid" src="http://placehold.it/900x300" alt="">
                                        </div>

                                        <div class="col-lg-6">
                                            <p class="invisible"> noborrar </p>
                                            <p class="invisible"> noborrar </p>

                                            <a class="btn btn-secondary btn " href="#" role="button"> Actualizar Foto</a> 
                                        </div>

                                        <h6 class="invisible"> no borrar </h6>

                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Nombre del evento</label>
                                        <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Teatro PUCP">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Ubicación</label>
                                        <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Polideportivo PUCP">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Seleccionar Categoría del Evento</label>

                                        <div class="dropdown">

                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Evento Cultural
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                <a class="dropdown-item" href="#">Cultural</a>
                                                <a class="dropdown-item" href="#">Bienestar</a>
                                                <a class="dropdown-item" href="#">Ciencia</a>
                                                <a class="dropdown-item" href="#">Fiesta</a>
                                                <a class="dropdown-item" href="#">Otros</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Fecha</label>
                                        <input type="text" class="form-control" id="exampleInputEmail1" placeholder="17 Abril 2019">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Hora Inicio</label>
                                        <input type="text" class="form-control" id="exampleInputEmail1" placeholder="20:00">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Hora Fin</label>
                                        <input type="text" class="form-control" id="exampleInputEmail1" placeholder="23:00">
                                    </div>


                                    <div class="d-flex ">
                                        <a class="btn btn-secondary btn-lg mr-auto float-left" href="detalles2" role="button">Regresar</a> 
                                        <a class="btn btn-secondary btn-lg float-right" href="detalles2" role="button">Actualizar Evento</a> 

                                    </div>


                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <jsp:include page="codigojs.jsp" />
    </body>

</html>
