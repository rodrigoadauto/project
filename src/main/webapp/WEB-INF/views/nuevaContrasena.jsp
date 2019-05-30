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
                    <c:if test="${msg != null}">
                          <div class=" alert-danger" role="alert">${msg}</div>
                    </c:if>  
                
            <form class="form-signin" action="${rootUrl}cambiarContrasena" method="post"> 
               
                <div id="nuevo"><strong>Ingrese su nueva contrasena</strong></div>
                
                <label for="username" class="sr-only">Contraseña</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="Contraseña" required autofocus>
                <p> </p>
                <label for="username" class="sr-only">Confirmar contraseña</label>
                <input type="password" id="contrasena" name="contrasena" class="form-control" placeholder="Confirmar Contraseña" required autofocus>
                
                <input type="hidden" name="hash" value="${hash}">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <p> </p>              
                <input type="submit" class="btn btn-default center-block" value="Recuperar"/>
            </form>
                
                
    </body>
</html>
