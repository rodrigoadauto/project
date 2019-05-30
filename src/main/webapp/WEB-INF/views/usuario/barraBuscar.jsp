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

        <form:form method="POST" action="${rootUrl}usuario/buscar" modelAttribute ="nombre">

            <div class="row">
                <div class="col-lg-11">
                    <form:input type="text" class="form-control" path ="nombre" placeholder="Nombre..." />
                </div>
                <span class="input-group-btn">

                    <input type="submit" class="btn btn-secondary" value="Buscar"/>
                </span>
            </div>
        </form:form>

        <jsp:include page="codigojs.jsp" />
    </body>

</html>
