<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic" />


<!DOCTYPE jsp>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Eventos_Publicos</title>

        <!-- Bootstrap core CSS -->
        <link href="${urlPublic}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="${urlPublic}/css/shop-item.css" rel="stylesheet">

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


        <jsp:include page="BarraSuperiorModerador.jsp" />

        <!-- Page Content -->
        <div id="wrapper"> 

            <jsp:include page="MenuModerador.jsp" />

            <div id="content-wrapper">


                <div class="container-fluid">

                    <div class="card">
                        <div class="card-header "> <strong> CREAR EVENTO</strong> </div>

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

                                            <a class="btn btn-secondary btn " href="#" role="button">Subir Foto</a> 
                                        </div>

                                        <h6 class="invisible"> no borrar </h6>

                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Nombre del evento</label>
                                        <input type="text" class="form-control" id="exampleInputEmail1">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Ubicación</label>
                                        <input type="text" class="form-control" id="exampleInputEmail1">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Seleccionar Categoría del Evento</label>

                                        <div class="dropdown">

                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Categorías
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
                                        <input type="text" class="form-control" id="exampleInputEmail1" placeholder="dd/mm/aaaa">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Hora inicio</label>
                                        <input type="text" class="form-control" id="exampleInputEmail1" placeholder="hh:mm">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Hora fin</label>
                                        <input type="text" class="form-control" id="exampleInputEmail1" placeholder="hh:mm">
                                    </div>


                                    <div class="d-flex ">
                                        <a class="btn btn-secondary btn-lg mr-auto float-left" href="eventosPublicxs1" role="button">Regresar</a> 
                                        <a class="btn btn-secondary btn-lg float-right" href="misEventos1" role="button">Crear Evento</a> 

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>




                    <p>  </p>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="${urlPublic}/vendor/jquery/jquery.min.js"></script>
        <script src="${urlPublic}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="${urlPublic}/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Page level plugin JavaScript-->
        <script src="${urlPublic}/vendor/chart.js/Chart.min.js"></script>
        <script src="${urlPublic}/vendor/datatables/jquery.dataTables.js"></script>
        <script src="${urlPublic}/vendor/datatables/dataTables.bootstrap4.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="${urlPublic}/js/sb-admin.min.js"></script>

        <!-- Demo scripts for this page-->
        <script src="${urlPublic}/js/demo/datatables-demo.js"></script>
        <script src="${urlPublic}/js/demo/chart-area-demo.js"></script>

    </body>

</html>
