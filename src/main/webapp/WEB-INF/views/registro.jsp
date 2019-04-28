<%-- 
    Document   : registro
    Created on : 08/04/2019, 11:53:46 AM
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
        <div id="cabecera"><h4><strong>Registro</strong></h4></div>
            <div id="cuerpo">
                <form method="post" action="registrarUsuario" >
                    <div class="form-group">
                        <input type="text" name="nombre" class="form-control" id="exampleInputEmail1" placeholder="Nombre" required>
                    </div>
                    <div class="form-group">
                      <input type="text" name="apellido" class="form-control" id="exampleInputPassword1" placeholder="Apellidos" required>
                    </div>
                    <div class="form-group">
                      <input type="text" name="documento"  class="form-control" id="exampleInputPassword1" placeholder="DNI o Carnet de extranjería required ">
                    </div>
                    <div class="form-group">
                      <input type="email" name="correo" class="form-control" id="exampleInputPassword1" placeholder="Correo PUCP" required>
                    </div>
                    <div class="form-group">
                      <input type="password" name="psw" class="form-control" id="exampleInputPassword1" placeholder="Contraseña" required>
                    </div>
                <div class="form-group">
                      <input type="password" name="psw2" class="form-control" id="exampleInputPassword1" placeholder="Confirmar Contraseña" required>
                    </div>
                    
                    
                    <button type="submit" class="btn btn-default center-block">Registrarme</button>
            </form>
                </div>
            
            </div>
    
    
    </body>
</html>
