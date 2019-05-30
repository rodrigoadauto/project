<%-- 
    Document   : codigojs
    Created on : 28/05/2019, 02:55:22 PM
    Author     : Rodrigo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/" var="rootUrl" />
<spring:url value="/resources" var="urlPublic" />



<script src="${urlPublic}/vendor/jquery/jquery.min.js"></script>

<script src="${urlPublic}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${urlPublic}/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Page level plugin JavaScript-->
<script src="${urlPublic}/vendor/chart.js/Chart.min.js"></script>
<script src="${urlPublic}/vendor/datatables/jquery.dataTables.js"></script>
<script src="${urlPublic}/vendor/datatables/dataTables.bootstrap4.js"></script>

<!-- Custom scripts for all pages-->
<script src="${urlPublic}/js/sb-admin.js"></script>

<!-- Demo scripts for this page-->
<script src="${urlPublic}/js/demo/datatables-demo.js"></script>
<script src="${urlPublic}/js/demo/chart-area-demo.js"></script>

