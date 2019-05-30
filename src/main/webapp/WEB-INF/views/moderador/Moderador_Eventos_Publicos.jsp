<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/" var="rootUrl" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                        <div class="card-header "> <strong> EVENTOS PÚBLICOS</strong> </div>

                        <div class="card-body">


                            <form method="post" action="${rootUrl}moderador/buscar">

                                <div class="row">
                                    <div class="col-lg-11">
                                        <input type="text" class="form-control" name ="nombre" placeholder="Nombre...">
                                    </div>
                                    <span class="input-group-btn">

                                        <input type="submit" class="btn btn-secondary" value="Buscar"/>

                                    </span>
                                </div>
                            </form>
                            <p>  </p>

                            <div class="dropdown">


                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Filtrar Por Tiempo
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="#">Hoy</a>
                                    <a class="dropdown-item" href="#">Mañana</a>
                                    <a class="dropdown-item" href="#">Próximos 7 Días</a>
                                    <a class="dropdown-item" href="#">Próximos 15 Días</a>
                                    <a class="dropdown-item" href="#">Próximos 30 Días</a>
                                </div>

                            </div>

                            <div class="row">
                                <c:forEach items="${listaEvento}" var= "listaEvento">
                                    <div class="col-lg-6"> 

                                        <div class="card mt-4">
                                            <img class="card-img-top img-fluid" src="http://placehold.it/1500x300" alt="">
                                            <div class="card-body">


                                                <!--div class="d-flex">
                                                   <a href="detalles1" ><h3 class="text-left" > <font color="black"> ${listaEvento.getNombre()}</font>  </h3> </a>
                                                   <button type="button" class=" btn btn-sm btn-light  text-dark float-right border-secondary btn-lg" > Categoría: ${listaEvento.getCategoria()} </button>
                                                   <button type="button" class=" btn btn-sm btn-light text-dark float-right border-secondary " > Estado: ${listaEvento.getEstadoEvento()} </button>

                                               </div-->

                                                <a href="detalles1" ><h3 class="text-left" > <font color="black"> ${listaEvento.nombre}</font>  </h3> </a>
                                                <h5 class="text-success" > Categoría: ${listaEvento.categoria.nombreCategoria} </h5>
                                                <p> ${listaEvento.getDescripcion()}</p>
                                                <div >

                                                    <a class="btn btn-primary btn-lg float-right " href="eventosPublicxs" role="button">Asistir</a>

                                                </div>     
                                            </div>
                                        </div>

                                    </div>

                                </c:forEach>
                            </div>

                            <div>
                                <p>                       </p>

                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item">
                                            <a class="page-link" href="#">&larr; Anterior</a>
                                        </li>
                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                                        <li class="page-item"><a class="page-link" href="#">6</a></li>
                                        <li class="page-item"><a class="page-link" href="#">7</a></li>
                                        <li class="page-item"><a class="page-link" href="#">8</a></li>
                                        <li class="page-item"><a class="page-link" href="#">9</a></li>

                                        <li class="page-item">
                                            <a class="page-link" href="#">Siguiente &rarr;</a>
                                        </li>
                                    </ul>
                                </nav>



                            </div>
                        </div>
                    </div>
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
