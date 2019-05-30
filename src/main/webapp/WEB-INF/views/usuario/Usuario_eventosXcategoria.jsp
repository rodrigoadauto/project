<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/" var="rootUrl" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                $("#categorias").prop('class', 'nav-item active');
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
                                <c:forEach items="${listaEventosCategoria}" var= "listaEventosCategoria">
                                    <div class="col-lg-4"> 

                                        <div class="card mt-4">
                                            <img class="card-img-top img-fluid" src="http://placehold.it/1500x300" alt="">
                                            <div class="card-body">


                                                <a href="detalles1" ><h3 class="text-left" > <font color="black"> ${listaEventosCategoria.nombre}</font>  </h3> </a>
                                                <h5 class="text-success" > Categoría: ${listaEventosCategoria.categoria.nombreCategoria} </h5>
                                                <p> ${listaEventosCategoria.descripcion}</p>
                                                <div >

                                                    <a class="btn btn-primary btn-lg float-right " href="eventosPublicxs" role="button">Asistir</a>

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
                                            <li class="page-item active"><a class="page-link" href="${rootUrl}usuario/eventosCategoria/${listaEventosCategoria.categoria.id}?inicio=${i}">${i}</a></li>                                                
                                            </c:if>

                                    </c:forEach>

                                </ul>
                            </nav>




                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="codigojs.jsp" />
    </body>

</html>
