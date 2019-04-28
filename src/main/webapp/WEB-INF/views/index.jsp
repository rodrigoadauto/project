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
        <div id="cabecera"><h4><strong>Ingreso al sistema de eventos PUCP</strong></h4></div>
            <div id="cuerpo">
                <form method="post" action="usuario/listar">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Correo PUCP</label>
                      <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Contraseña</label>
                      <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                    </div>
                    
                    
                    <button type="submit" class="btn btn-default center-block">Ingresar (Usuario) </button>
            </form>
                
                
                 <form method="post" action="eventosPublicos1">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Correo PUCP</label>
                      <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Contraseña</label>
                      <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                    </div>
                    
                    
                    <button type="submit" class="btn btn-default center-block">Ingresar (Moderador) </button>
            </form>
                
                
                 <form method="post" action="admin">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Correo PUCP</label>
                      <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Contraseña</label>
                      <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                    </div>
                    
                    
                    <button type="submit" class="btn btn-default center-block">Ingresar (Administrador) </button>
            </form>
                
                
                </div>
            <div id="nuevo"><strong>Nuevo usuario</strong></div>
                              <a class="btn btn-default center-block" style=" width:100px" href="registro" role="butjsp"ton">Registrarse</a>
            </div>

        
    </body>
</html>
