<%-- 
    Document   : codigojs
    Created on : 27/05/2019, 08:26:38 PM
    Author     : Rodrigo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/" var="rootUrl" />
<spring:url value="/resources" var="urlPublic" />


<link href="${urlPublic}/css/shop-item.css" rel="stylesheet">

<link href="${urlPublic}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="${urlPublic}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="${urlPublic}/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${urlPublic}/css/sb-admin.css" rel="stylesheet">


<script src="${urlPublic}/js/sb-admin.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

