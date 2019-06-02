<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/" var="rootUrl" />

<!DOCTYPE jsp>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Eventos_Publicos</title>
        <jsp:include page="codigolinks.jsp" />

        <script>
            $(document).ready(function () {
                $("#postularModerador").prop('class', 'nav-item active');

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

    <body class="color" >

        <jsp:include page="BarraSuperiorUsuario.jsp" />

        <!-- Page Content -->
        <div id="wrapper"> 

            <jsp:include page="MenuUsuario.jsp" />

            <div id="content-wrapper">

                <div class="container-fluid">

                    <div class="card">
                        <div class="card-header"><strong>Postular a Moderador</strong> </div>

                        <div class="card-body">
                            <br>
                            <form:form action="${rootUrl}agregarSolicitud" method="POST" modelAttribute="solicitud">
                                <div class="form-group"> 
                                    <form:hidden path="id"  />
                                    <label for="categoria"><strong>Categoria</strong></label>
                                    <form:select  class="form-control" path="categoria.id"
                                                  items="${listaCategorias}" itemValue="id" itemLabel="nombreCategoria"/> 

                                </div>
                                <form:hidden path="usuario.id" value="${sessionScope.usuario.id}" />
                                <div class="form-group">
                                    <br>
                                    <label for="comment"   style="margin-left: 8px"><strong>Motivo por el cual deseas ser moderador de esta categoría:
                                    </strong></label>

                                    <form:textarea
                                        id="comment"
                                        class="form-control"
                                        path="justificacion"
                                        rows="5"
                                        placeholder="Ingrese la justificacion"/>



                                    <div class="valid-feedback">Valid.</div>
                                    <div class="invalid-feedback">Please fill out this field.</div>
                                </div>

                                <button type="submit" class="btn btn-primary">Enviar solicitud </button>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>







        <jsp:include page="codigojs.jsp" />
    </body>

</html>
