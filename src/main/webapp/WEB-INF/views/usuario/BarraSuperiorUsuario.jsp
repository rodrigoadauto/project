
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

        <div class="row">
            <div></div>
            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Home</a>
                </li>
                
                <li class="nav-item dropdown justify-content-end">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Dropdown
                    </a>
                    <div class="dropdown-menu " aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>

                <div class="col-sm-2">
                    <button class="btn btn-outline-primary">Usuario</button>
                </div>
            </ul>
        </div>






        <nav class="navbar navbar-expand navbar-dark negro static-top">

            <a class="navbar-brand mr-1" href="#"><p class="text-light">EVENT PUCP</p></a>


            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle"  href="#">

                <i class="fas fa-bars"></i>


            </button>


            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle"id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href=" "> <strong><p class="text-light"> ${sessionScope.usuario.nombre} ${sessionScope.usuario.apellido} </p></strong> <span class="sr-only">(current)</span></a>

                        <div class="dropdown-menu bg-dark border-dark" aria-labelledby="navbarDropdown">

                            <a class="dropdown-item bg-dark text-light" href="${rootUrl} " >  Salir </a>


                        </div>

                    </li> 

                </ul>
            </div>

        </nav>

    </body>
</html>
