

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/" var="rootUrl" />
<spring:url value="/resources" var="urlPublic" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" 
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" 
              integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" 
              crossorigin="anonymous">
        <link href="${urlPublic}/css/signin.css" rel="stylesheet">
        <title>Login</title>
    </head>
    <body>
        <div class="container theme-showcase">            
           <form class="form-signin" action="${rootUrl}loginForm" method="post"> 
                <c:if test="${param.error!= null}">
                    <h4 class="form-signin-heading" style="color:red">Acceso denegado</h4>
                </c:if>
                <h3 class="form-signin-heading">Logueo Eventos PUCP</h3>
                
                <label for="username" class="sr-only">Correo</label>
                <input type="text" id="username" name="correo" class="form-control" placeholder="Correo PUCP" required autofocus>
               
                <label for="password" class="sr-only">Contraseña</label>
                <input type="password" id="password" name="contrasena" class="form-control" placeholder="Contraseña" required>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                
                <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
            </form>
        </div>
    </body>
</html>