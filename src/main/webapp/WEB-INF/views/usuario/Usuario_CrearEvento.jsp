<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/" var="urlBase" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>



<!DOCTYPE jsp>
<html >

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Eventos_Publicos</title>
        <jsp:include page="codigolinks.jsp" />

        <script>
            $(document).ready(function () {
                $("#crearEvento").prop('class', 'nav-item active');
                
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
                        <div class="card-header "> <strong> CREAR EVENTO</strong> </div>

                        <div class="card-body">


                            <form:form action="${urlBase}usuario/eventoCreado?${_csrf.parameterName}=${_csrf.token}" modelAttribute="evento" method="POST"  enctype="multipart/form-data">
                                <form:hidden path="id" />
                                <!-- Se guarda el Id del creador -->
                                <form:hidden path="usuario.id" value="${sessionScope.usuario.id}" />

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Foto Del Evento</label>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <img class="card-img-top img-fluid" src="http://placehold.it/900x300" alt="">

                                        </div>

                                        <div class="col-lg-6">

                                            <p class="invisible"> noborrar </p>
                                            <p class="invisible"> noborrar </p>
                                            <div class="form-group">
                                                <label for="file"> Foto</label>
                                                <input class="form-control-file" type="file" name="file"/>
                                                <c:if test="${msgFile!=null}">
                                                    <div class="text-danger">${msgFile}</div>
                                                </c:if> 

                                            </div>

                                        </div>

                                        <h6 class="invisible"> no borrar </h6>

                                    </div>



                                    <div class="form-group"> 
                                        <label for="nombre">Nombre del evento</label>
                                        <form:input type="text" class="form-control" path="nombre"/>
                                        <form:errors path="nombre" element="div" cssClass="text-danger" />
                                    </div>



                                    <div class="form-group">
                                        <label for="lugar">Ubicación</label>
                                        <form:input type="text" class="form-control" path="lugar"/>
                                        <form:errors path="lugar" element="div" cssClass="text-danger" />
                                    </div>


                                    <div class="form-group">
                                        <label for="descripcion">Descripción</label>
                                        <form:textarea type="text" class="form-control" id="exampleFormControlTextarea3" path="descripcion" rows="5"/>
                                        <form:errors path="descripcion" element="div" cssClass="text-danger" />
                                    </div>
                                    <div class="form-group"> 
                                        <label for="categoria">Categoria</label>
                                        <form:select  class="form-control" path="categoria.id"
                                                      items="${listaCategorias}" itemValue="id" itemLabel="nombreCategoria"/> 

                                    </div>

                                    <form:input type="hidden" path="estadoEvento" value="Por atender"/>

                                    <div class="form-group">
                                        <label for="fecha">Fecha</label>
                                        <form:input type="date" id="textboxid" class="form-control" path="fecha" placeholder="YYYY-MM-DD"/> 
                                        <form:errors path="fecha" element="div" cssClass="text-danger" />
                                    </div>

                                    <div class="form-group">
                                        <label for="horaInicio">Hora Incio</label>
                                        <form:input type="time" id="textboxid" class="form-control" path="horaInicio" placeholder="00:00:00"/>
                                        <form:errors path="horaInicio" element="div" cssClass="text-danger" />
                                    </div>

                                    <div class="form-group">
                                        <label for="horaFin">Hora Fin</label>
                                        <form:input type="time" id="textboxid" class="form-control" path="horaFin" placeholder="00:00:00"/>
                                        <form:errors path="horaFin" element="div" cssClass="text-danger" />

                                    </div>







                                    <!-- Bootstrap core CSS <div class="form-group">
                                   <label for="exampleInputEmail1">Fecha fin</label>

                                   <input type="text" data-role="calendarpicker" name="fechaEvento"  placeholder="Selecciona la fecha">

                               </div> -->



                                    <button type="submit" class="btn btn-primary">Guardar</button>







                                </form:form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>


        <jsp:include page="codigojs.jsp" />
    </body>

</html>
