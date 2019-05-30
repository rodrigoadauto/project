<%-- 
    Document   : registro
    Created on : 08/04/2019, 11:53:46 AM
    Author     : USER
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
        <div id="cabecera"><h4><strong>Registro</strong></h4></div>
            <div id="cuerpo">
                    <form:form action="registrarUsuario" method="POST" modelAttribute="usuario">
                    <div class="form-group">
                        <form:input type="text" path="nombre" class="form-control" id="exampleInputEmail1" placeholder="Nombre"/>
                        <form:errors element="div" cssClass="text-danger" path="nombre"/>
                    </div>
                    <div class="form-group">
                      <form:input type="text" path="apellido" class="form-control" id="exampleInputPassword1" placeholder="Apellidos"/>
                      <form:errors element="div" cssClass="text-danger" path="apellido"/>
                    </div>
                    <div class="form-group">
                      <form:input type="text" path="dni"  class="form-control" id="exampleInputPassword1" placeholder="DNI o Carnet de extranjería"/>
                      <form:errors element="div" cssClass="text-danger" path="dni"/>
                    </div>
                    <div class="form-group">
                      <form:input type="text" path="correo" class="form-control" id="exampleInputPassword1" placeholder="Correo PUCP"/>
                      <form:errors element="div" cssClass="text-danger" path="correo"/>
                    </div>
                    <div class="form-group">
                      <form:input type="password" path="contrasena" class="form-control" id="exampleInputPassword1" placeholder="Contraseña"/>
                      <form:errors element="div" cssClass="text-danger" path="contrasena"/>
                    </div>
                <div class="form-group">
                      <input type="password" name="contrasena2" class="form-control" id="exampleInputPassword1" placeholder="Confirmar Contraseña">
                      <c:if test="${msg != null}">
                          <div class="text-danger">${msg}</div>
                      </c:if>
                    </div>
                    
                    
                    <button type="submit" class="btn btn-default center-block">Registrarme</button>
            </form:form>
                </div>
            
            </div>
    
    
    </body>
</html>