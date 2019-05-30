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
                        <div class="card-header"> Detalles del evento</div>

                        <div class="card-body">
                            <div class="input-group">

                            </div>

                            <div class="card mt-4">
                                <img class="card-img-top img-fluid" src="http://placehold.it/1500x400" alt="">
                                <div class="card-body">


                                    <div class="d-flex">
                                        <h3 class="text-left" > Representacion Teatral PUCP </h3>
                                        <button type="button" class=" btn btn-sm btn-light mb-4 ml-auto mr-4 p-2 text-dark float-right border-secondary rounded-pill" > Categoría: ARTE </button>

                                    </div>
                                    <h5> Creador : Roberto Bolaño </h5>
                                    <h5> Fecha de inicio: 17-04-19 12:00:00 </h5>
                                    <h5> Fecha de fin: 17-04-19 14:30:00 </h5>
                                    <h5> Lugar: Complejo Polideportivo </h5>
                                    <h5> Descripción: </h5>
                                    <p> La facultad de derecho los invita a todos al Complejo Polideportivo a ver una adaptación de la clásica película "El Rey Lear" </p>
                                    <div class="form-group">
                                        <label for="exampleFormControlTextarea1">Deja tu comentario aquí:</label>
                                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>

                                    </div>

                                    <div class="container">
                                        <div class="form-group">
                                            <label>Sube una foto:</label>
                                            <div class="input-group">
                                                <span class="input-group-btn">
                                                    <span class="btn btn-default btn-file">
                                                        Navegar... <input type="file" id="imgInp">
                                                    </span>
                                                </span>
                                            </div>
                                            <img id='img-upload'/>
                                        </div>
                                    </div>

                                    <div >

                                        <a class="btn btn-danger btn-lg float-right " href="misEventosOcurridos1" role="button">Eliminar</a>  

                                        <a class="btn btn-primary btn-lg float-left " href="misEventosOcurridos1" role="button">Regresar</a>
                                    </div>     
                                </div>
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
