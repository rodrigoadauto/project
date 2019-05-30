<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/" var="rootUrl" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>



<!DOCTYPE jsp>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Usuario_MisEventos</title>

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

                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Nombre...">
                                <span class="input-group-btn">
                                    <button class="btn btn-secondary" type="button">Buscar</button>
                                </span>
                            </div>

                            <p>  </p>


                           <div class="row">
                                <c:forEach items="${listaMisEventos}" var= "listaMisEventos">
                                    <div class="col-lg-4"> 

                                        <div class="card mt-4">
                                            <img class="card-img-top img-fluid"  style="width:1500px;height:300px;" src="${rootUrl}fileUploaded/${listaMisEventos.foto}" alt="">
                                            <div class="card-body">


                                                <a ><h3 class="text-left" > <font color="black"> ${listaMisEventos.nombre}</font>  </h3> </a>
                                                <h5 class="text-success" > Categoría: ${listaMisEventos.categoria.nombreCategoria} </h5>
                                                <p>Fecha: ${listaMisEventos.fecha}</p>
                                                <p>Inicio del evento: ${listaMisEventos.horaInicio} horas</p>
                                                <p>Fin del evento: ${listaMisEventos.horaFin} horas </p>                                            
                                                
                                                
                                                <div >
                 
                                                    
                                                    
                                                    
                                                    
                                                    <a class="btn btn-primary btn-lg float-left " href="${rootUrl}moderador/detallesMisEventos/${listaMisEventos.id}" role="button"> Ver Detalles </a>
                                                    <a class="btn btn-danger btn-lg float-right " href="${rootUrl}moderador/eliminarEvento1/${listaMisEventos.id}" role="button"> Eliminar   </a>
                                                    
                                                    
                                                  
                                                    
                                                    
                                                    
                                                </div>     
                                            </div>
                                        </div>

                                    </div>

                                </c:forEach>
                            </div>
                        </div>

                        <div>
                            <p>                       </p>

                             <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">

                                        <c:forEach var="i" begin="1" end="${cantDePaginas}" varStatus="loop">

                                            <c:if test="${paginaActual == i}">
                                                <li class="page-item active"><a style="pointer-events: none;background-color: gray; color:" class="page-link" href="">${i}</a></li>                                                
                                                </c:if>
                                                <c:if test="${paginaActual != i}">
                                                <li class="page-item active"><a class="page-link" href="${rootUrl}moderador/misEventos/${sessionScope.usuario.id}?inicio=${i}">${i}</a></li>                                                
                                                </c:if>

                                        </c:forEach>

                                    </ul>
                                </nav>



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
