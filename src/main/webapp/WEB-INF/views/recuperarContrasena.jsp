<%-- 
    Document   : index
    Created on : 08/04/2019, 10:06:31 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${urlPublic}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${urlPublic}/css/estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
    <center>
        <img src="${urlPublic}/imagen/manager400.png" alt=""/>
    </center>
    <div id="cuadro" class="container well">
        <div id="cabecera"><h4><strong>Recuperar contraseña</strong></h4></div>
            <div id="cuerpo">
               
                
            <form class="form-signin" action="${rootUrl}procesarCorreo" method="post"> 
               
                <div id="nuevo"><strong>Ingrese su correo para recuperar la contraseña</strong></div>
                
                <label for="username" class="sr-only">Correo</label>
                <input type="text" id="username" name="correo" class="form-control" placeholder="Correo PUCP" required autofocus>
                <p> </p>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <p> </p>              
                <input type="submit" class="btn btn-default center-block" value="Recuperar"/>
            </form>
                
                <a href="${rootUrl}l"><button>Volver</button></a>
                
                
    </body>
</html>
