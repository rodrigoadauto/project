<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/" var="rootUrl" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
                $("#eventosPublicos").prop('class', 'nav-item active');
                
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
                        <div class="card-header "> <strong> EVENTOS PÚBLICOS</strong> </div>

                        <div class="card-body">

                            <form method="GET" action="${rootUrl}usuario/buscarPorFiltro" >

                                <div class="row">
                                    <div class="col-lg-11">
                                        <input type="text" class="form-control" name ="nombre" placeholder="Nombre..." value="${search}"/>
                                    </div>
                                    <input type="hidden" name ="tiempo" value="${tiempo}"/>
                                    <span class="input-group-btn">

                                        <input type="submit" class="btn btn-secondary" value="Buscar"/>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                    </span>
                                </div>
                            </form>


                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Filtrar Por Tiempo
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="${rootUrl}usuario/filtroTiempo?tiempo=0">Hoy</a>
                                    <a class="dropdown-item" href="${rootUrl}usuario/filtroTiempo?tiempo=1">Mañana</a>
                                    <a class="dropdown-item" href="${rootUrl}usuario/filtroTiempo?tiempo=7">Próximos 7 dias</a>
                                    <a class="dropdown-item" href="${rootUrl}usuario/filtroTiempo?tiempo=15">Próximos 15 dias</a>
                                    <a class="dropdown-item" href="${rootUrl}usuario/filtroTiempo?tiempo=30">Próximos 30 dias</a>
                                </div>
                            </div>


                            <div class="row">

                                <c:forEach items="${listaEvento}" var= "listaEvento">
                                    <div class="col-lg-4"> 

                                        <div class="card mt-4">
                                            <img class="card-img-top img-fluid"  style="width:1500px;height:300px;" src="${rootUrl}fileUploaded/${listaEvento.foto}" alt="">

                                            <div class="card-body">



                                                <form method="post" action="${rootUrl}usuario/detalles" class="inline">
                                                    <input type="hidden" name="idEvento" value="${listaEvento.id}">

                                                    <button type="submit"  class="btn btn-primary-outline">

                                                        <h3 class="text-left" > <font color="black"> ${listaEvento.nombre}</font>  </h3>
                                                    </button>
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                </form>
                                                <h5 class="text-success" > Categoría: ${listaEvento.categoria.nombreCategoria} </h5>

                                                <p>Fecha: ${listaEvento.fecha}</p>
                                                <p>Inicio del evento: ${listaEvento.horaInicio} horas</p>
                                                <p>Fin del evento: ${listaEvento.horaFin} horas </p>                                            


                                                <div >

                                                    <form method="post" action="${rootUrl}usuario/detalles" class="inline">
                                                        <input type="hidden" name="idEvento" value="${listaEvento.id}">
                                                        <button type="submit"  class="btn btn-primary">Asistir/Ver detalles</button>

                                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                                                    </form>
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

                                        <c:forEach var="i" begin="1" end="${cantDePaginas}" varStatus="loop">

                                            <c:if test="${paginaActual == i}">
                                                <li class="page-item active"><a style="pointer-events: none;background-color: gray; color:" class="page-link" href="">${i}</a></li>                                                
                                                </c:if>
                                                <c:if test="${paginaActual != i}">
                                                <li class="page-item active"><a class="page-link" href="${rootUrl}usuario/buscarPorFiltro?inicio=${i}&nombre=${search}&tiempo=${tiempo}">${i}</a></li>                                                
                                                </c:if>





                                        </c:forEach>


                                    </ul>
                                </nav>



                            </div>
                        </div>
                    </div>
                    <p>  </p>
                </div>

            </div>
        </div>
        <jsp:include page="codigojs.jsp" />
    </body>

</html>

</body>
</html>
