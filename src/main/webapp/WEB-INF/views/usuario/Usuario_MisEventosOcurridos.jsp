<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/" var="rootUrl" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>



<!DOCTYPE jsp>
<html>

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Usuario_MisEventos</title>
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
                $(function () {
                    $('[data-toggle="popover"]').popover()
                })
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
            .tamano_img{
               width: 100%;
                height: 240px;
            }
            .movie__label {
                display: flex;
                position: absolute;
                z-index: 2;
                text-transform: uppercase;
                align-items: center;
                justify-content: center;
                opacity:0.8;
            }
            .titulo{
                align-items: center;
                justify-content: center;
                z-index: 4;

            }
            .boton1{

                position: absolute;
                top: 0;
                right: 0;
            }
            .boton2{

                position: absolute;
                top: 5px;
                left: 5px;
                text-transform: uppercase;
                align-items: center;
                justify-content: center;
                opacity:0.8;
            }
            .transparente::before{
                opacity: 0.5;
            }
            .transparente::after{
                opacity: .5;
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
                        <div class="card-header "> <strong> Mis Eventos Ocurridos</strong> </div>

                        <div class="card-body">

                            <form method="GET" action="${rootUrl}usuario/buscarMisEventosOcurridos" >

                                <div class="row">
                                    <div class="col-sm-11">
                                        <input type="text" class="form-control" name ="nombre" placeholder="Buscador por nombre de evento" value="${search}"/>
                                        <input type="hidden" value="${id}" name="id"/>
                                    </div>
                                    <span class="input-group-btn">

                                        <input type="submit" class="btn btn-primary" value="Buscar"/>
                                    </span>
                                </div>
                            </form>

                            <p>  </p>
                            <c:if test="${mensaje != null}">
                                <div class="alert alert-danger" role="alert"> ${mensaje}</div>
                            </c:if>

                            <div class="row">
                                <c:forEach items="${listaEvento}" var= "listaEvento">


                                    <div class="col-sm-4">



                                        <div class="card mb-3" style="max-width: 540px;">
                                            <div class="row no-gutters">
                                                <div class="col-sm-12">
                                                    <form method="post" action="${rootUrl}usuario/detalles" class="inline" style="margin-bottom:0px ">
                                                        <input type="hidden" name="idEvento" value="${listaEvento.id}">
                                                        <button type="submit"  class="btn btn-dark btn-block">   ${listaEvento.nombre} </button>
                                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                    </form>
                                                </div>
                                                <div class="col-sm-12 ">

                                                    <img src="${rootUrl}fileUploaded/${listaEvento.foto}" class=" card-img-top img-responsive tamano_img">
                                                    <button type="button" class="btn btn-outline-primary boton1 transparente" data-toggle="popover" title="${listaEvento.descripcion}" data-placement="left" 
                                                            data-content="Inicio del evento: ${listaEvento.horaInicio} horas  /                         
                                                            Fin del evento: ${listaEvento.horaFin} horas " >
                                                        <i class="far fa-eye"></i></button>
                                                    <button type="button" class="badge badge-pill badge-danger boton2">${listaEvento.categoria.nombreCategoria}</button>
                                                </div>

                                                <div class="col-sm-12">
                                                    <button type="submit"  class="btn btn-light btn-block disabled">Fecha: ${listaEvento.fecha}</button>


                                                </div> 
                                                <div class="col-sm-12">
                                                    <form method="post" action="${rootUrl}usuario/detalles" class="inline">
                                                        <input type="hidden" name="idEvento" value="${listaEvento.id}">
                                                        <button type="submit"  class="btn btn-outline-info btn-block">Asistir/Ver detalles</button>
                                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                                                    </form>

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
                                            <li class="page-item active"><a class="page-link" href="${rootUrl}usuario/misEventosOcurridos/${id}?inicio=${i}">${i}</a></li>                                                
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
