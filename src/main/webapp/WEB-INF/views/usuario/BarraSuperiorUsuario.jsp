
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/" var="rootUrl" />


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <style>
            .negro{
                background-color: black;
            }


        </style>
    </head>
    <body>


        <nav class="mb-1 navbar navbar-expand-lg navbar-dark info-color">
            <a class="navbar-brand" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">EVENT PUCP</font></font></a>
            <!--
            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle"  href="#">
                <i class="fas fa-bars"></i>
            </button> !-->
            <div class="collapse navbar-collapse" id="navbarSupportedContent-4">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle waves-effect waves-light" id="navbarDropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> ${sessionScope.usuario.nombre} ${sessionScope.usuario.apellido} </font></font></a>
                        <div class="dropdown-menu dropdown-menu-right dropdown-info" aria-labelledby="navbarDropdownMenuLink-4">
                            <a class="dropdown-item waves-effect waves-light" href="${rootUrl}" ><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Cerrar sesión</font></font></a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </body>
</html>
