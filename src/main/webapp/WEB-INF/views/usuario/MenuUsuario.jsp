<%-- 
    Document   : Menu
    Created on : 05/05/2019, 02:40:27 AM
    Author     : Rodrigo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/" var="rootUrl" />


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <style>
            .negro{
                background-color: black;
            }
            
            #MainMenu{
                
                display: flex;
            }
           

        </style>
    </head>
    <body>

        <!-- Sidebar -->
        <div id="MainMenu">
            <ul class="sidebar navbar-nav negro toggled" >
                <li class="nav-item" id="eventosPublicos">
                    <a class="nav-link" href="${rootUrl}usuario/listar">
                        <i class="far fa-eye"></i>
                        <span>Eventos Publicos</span>
                    </a>
                </li>
                <li class="nav-item dropdown" id="categorias">
                    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Categorias</span>
                    </a>
                    <div class="dropdown-menu bg-indigo" aria-labelledby="pagesDropdown">
                        <a class="dropdown-item " href="${rootUrl}usuario/eventosCategoria/1">Culturales</a>
                        <a class="dropdown-item " href="${rootUrl}usuario/eventosCategoria/2">Deportivos</a>
                        <a class="dropdown-item" href="${rootUrl}usuario/eventosCategoria/3">Artisticos</a>
                        <a class="dropdown-item" href="${rootUrl}usuario/eventosCategoria/4">Musicales</a>
                        <a class="dropdown-item" href="${rootUrl}usuario/eventosCategoria/5">Políticos</a>
                        <a class="dropdown-item" href="${rootUrl}usuario/eventosCategoria/6">Religiosos</a>
                        <a class="dropdown-item" href="${rootUrl}usuario/eventosCategoria/7">Culinarios</a>
                        <a class="dropdown-item" href="${rootUrl}usuario/eventosCategoria/8">Bienestar</a>
                        <a class="dropdown-item" href="${rootUrl}usuario/eventosCategoria/9">Recreacionales</a>
                        <a class="dropdown-item" href="${rootUrl}usuario/eventosCategoria/10">Otros</a>
                    </div>
                </li>


                <li class="nav-item" id="crearEvento">
                    <a class="nav-link" href="${rootUrl}usuario/crearEvento">
                        <i class="far fa-calendar-plus"></i>
                        <span>Crear Evento</span></a>
                </li>


                <li class="nav-item dropdown" id="eventosAsistidos">
                    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Eventos Asistidos</span>
                    </a>
                    <div class="dropdown-menu bg-indigo" aria-labelledby="pagesDropdown">
                        <a class="dropdown-item "href="${rootUrl}usuario/eventosAsistidos/${sessionScope.usuario.id}" > Eventos Por Asitir </a>
                        <a class="dropdown-item " href="${rootUrl}usuario/eventosAsistidosOcurridos/${sessionScope.usuario.id}" > Eventos Asistidos</a>

                    </div>
                </li>

                <li class="nav-item dropdown" id="misEventos">
                    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Mis Eventos </span>
                    </a>
                    <div class="dropdown-menu bg-indigo" aria-labelledby="pagesDropdown">
                        <a class="dropdown-item " href="${rootUrl}usuario/misEventos/${sessionScope.usuario.id}" > Eventos Proximos  </a>
                        <a class="dropdown-item " href="${rootUrl}usuario/misEventosOcurridos/${sessionScope.usuario.id}" > Eventos Ocurridos </a>

                    </div>
                </li>


                <li class="nav-item" id="postularModerador">
                    <a class="nav-link" href="${rootUrl}usuario/postularModerador/${sessionScope.usuario.id}">
                        <i class="far fa-heart"></i>
                        <span> Postular Moderador </span></a>
                </li>

            </ul>

        </div>

    </body>
</html>
