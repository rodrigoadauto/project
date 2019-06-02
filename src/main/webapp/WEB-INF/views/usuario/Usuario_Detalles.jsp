<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



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
                        <div class="card-header"> <strong>Detalles del Evento</strong></div>

                        <div class="card-body">
                            <div class="input-group">

                            </div>

                            <div class="card mt-12">

                                <div class="card-body">



                                    <!-- Page Content 
                                              <div class="d-flex">
                                       <h3 class="text-left" > Representacion Teatral PUCP </h3>
                                    <button type="button" class=" btn btn-sm btn-light mb-4 ml-auto mr-4 p-2 text-dark float-right border-secondary rounded-pill" > Categoría: ARTE </button>
                                    
                                    </div>
                                    --> 


                                    <div class="col-lg-12"> 

                                        <div class="card mt-4">
                                            <img class="card-img-top img-fluid"  style="width:1500px;height:400px;" src="${rootUrl}fileUploaded/${evento.foto}" alt="">

                                            <div class="card-body">
                                                <h3 class="text-left" > ${evento.nombre}</h3>

                                                <h5 class="text-success" > Categoría: ${evento.categoria.nombreCategoria} </h5>
                                                <p> Creador del evento: ${usuario.nombre} ${usuario.apellido}</p>
                                                <p> ${evento.descripcion}</p>
                                                <p>Fecha: ${evento.fecha}</p>
                                                <p>Inicio del evento: ${evento.horaInicio} horas</p>
                                                <p>Fin del evento: ${evento.horaFin} horas </p>

                                            </div>
                                            <div >
                                            </div>
                                            <c:if test="${asistencia==false}" >
                                                <form:form action="${rootUrl}usuario/asistirEvento" modelAttribute="asistenciaDeEvento" method="POST">
                                                    <form:hidden path="id" />
                                                    <form:hidden path="evento.id" value="${evento.id}" />

                                                    <form:hidden path="usuario.id" value="${sessionScope.usuario.id}" />
                                                    <button type="submit" class="btn btn-primary btn-lg float-left">Asistir</button>

                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                    <a class="btn btn-primary btn-lg float-right " href="${rootUrl}usuario/listar" role="button">Regresar</a>
                                                </form:form>
                                            </c:if>
                                            <c:if test="${asistencia}" >
                                                <form:form action="${rootUrl}usuario/noAsistirEvento" modelAttribute="asistenciaDeEvento" method="POST">
                                                    <form:hidden path="id" value="${idAsistenciaDeEvento}"/>
                                                    <form:hidden path="evento.id" value="${evento.id}" />

                                                    <form:hidden path="usuario.id" value="${sessionScope.usuario.id}" />
                                                    <button type="submit" class="btn btn-danger btn-lg float-left ">Cancelar asistencia</button>

                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                    <a class="btn btn-primary btn-lg float-right " href="${rootUrl}usuario/listar" role="button">Regresar</a>
                                                </form:form>
                                            </c:if> </div>

                                    </div>

                                    <div>






                                    </div>     
                                </div>
                            </div>



                            <p>  </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="codigojs.jsp" />
    </body>

</html>
