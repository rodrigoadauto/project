<%-- 
    Document   : lista
    Created on : 24/04/2019, 11:33:38 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/" var="raiz" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="${raiz}category/crear">Crear Categoría</a>
        <br />
        <table>
            <tr>
                <th>#</th>
                <th>Nombre de Categoría</th>
                
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="category" items="${lista}" varStatus="indice" >
                <tr>
                    <td>${indice.index + 1}</td>
                    <td>${category.catName}</td>
                    
                    <td><a href="${raiz}category/editar/${category.id}">Editar</a></td>
                    <td><a href="${raiz}category/borrar/${category.id}">Borrar</a></td>
                </tr>
            </c:forEach>
        </table>
        
    </body>
</html>
