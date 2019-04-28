<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container">
                <a class="navbar-brand" href="eventosPublicxs">EVENT PUCP</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle"id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href=" "> <strong> ROBERTO BOLAÑO </strong> <span class="sr-only">(current)</span></a>

                            <div class="dropdown-menu bg-dark border-dark" aria-labelledby="navbarDropdown">

                                <a class="dropdown-item bg-dark text-light" href=" " >  Salir </a>

                            </div>

                        </li> 

                    </ul>
                </div>
            </div>
        </nav>

        <!-- Page Content -->
        <div class="container">

            <div class="row flex-xl-nowrap">

                <div class="col-lg-3 ">
                    <h1 class="my-4"></h1>
                    <div class="list-group text-green">
                        <a href="eventosPublicxs" class="list-group-item active ">Eventos Públicos</a>
                        <a href="misEventos" class="list-group-item ">Mis Eventos</a>
                        <a href="crearEvento" class="list-group-item">Crear Evento</a>
                        <a href="eventosAsistidos" class="list-group-item ">Eventos Asistidos</a>
                        <a href="postular" class="list-group-item">Postular a Moderador</a>

                    </div>

                    <p>

                    </p>

                    <div class="list-group">

                        <a href="#" class="list-group-item active"> Categorías </a>
                        <a href="#" class="list-group-item"> Eventos Culturales </a>
                        <a href="#" class="list-group-item"> Eventos Deportivos </a>
                        <a href="#" class="list-group-item"> Eventos Artísticos </a>
                        <a href="#" class="list-group-item"> Eventos Musicales </a>
                        <a href="#" class="list-group-item"> Eventos Políticos</a>
                        <a href="#" class="list-group-item"> Eventos Religiosos </a>
                        <a href="#" class="list-group-item"> Eventos Culinarios </a>
                        <a href="#" class="list-group-item"> Eventos Bienestar </a>
                        <a href="#" class="list-group-item"> Eventos Recreacionales </a>
                        <a href="#" class="list-group-item"> Otros </a>



                    </div>


                    <div>


                    </div>

                </div>
                <!-- /.col-lg-3 -->

                <div class="col-lg-9">


                    <p>    </p>  
                    <div class="card">
                        <div class="card-header "> <strong> EVENTOS PÚBLICOS</strong> </div>

                        <div class="card-body">

                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Nombre...">
                                <span class="input-group-btn">
                                    <button class="btn btn-secondary" type="button">Buscar</button>
                                </span>
                            </div>

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


                                                <div class="d-flex">
                                                    <a href="detalles1" ><h3 class="text-left" > <font color="black"> ${listaEvento.getNombre()}</font>  </h3> </a>
                                                    <button type="button" class=" btn btn-sm btn-light mb-4 ml-auto mr-4 p-2 text-dark float-right border-secondary rounded-pill" > Categoría: ${listaEvento.getCategoria()} </button>
                                                    <button type="button" class=" btn btn-sm btn-light mb-4  text-dark float-right border-secondary rounded-pill" > Estado: ${listaEvento.getEstadoEvento()} </button>

                                                </div>
                                                <h5></h5>
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
                    <p>  </p>
                </div>

                <!-- /.container -->

                <!-- Footer -->

                <!-- Bootstrap core JavaScript -->
                <script src="${urlPublic}/vendor/jquery/jquery.min.js"></script>
                <script src="${urlPublic}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

                </body>

                </html>
