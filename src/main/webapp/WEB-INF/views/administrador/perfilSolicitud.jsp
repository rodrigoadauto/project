<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/" var="rootUrl" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE jsp>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Eventos_Publicos</title>

        <!-- Bootstrap core CSS -->
        <link href="${urlPublic}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="${urlPublic}/css/shop-item.css" rel="stylesheet">

        <style>
            .color{
                background-color: black;
                padding-top: 0px !important; 
            }
            .bd-sidebar{
                position: sticky; 
                height: calc(-4rem + 100vh); 
                z-index: 1000;
                top: 3rem;
            }
            .flex-xl-nowrap{
                -ms-flex-nowrap: nowrap !important;
                flex-wrap: nowrap !important ;

            }

        </style>
        <link href="${urlPublic}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="${urlPublic}/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="${urlPublic}/css/sb-admin.css" rel="stylesheet">

    </head>

    <body class="color" >

        <jsp:include page="BarraSuperiorAdmin.jsp" />

        <!-- Page Content -->
        <div id="wrapper"> 

            <jsp:include page="MenuAdmin.jsp" />

            <div id="content-wrapper">

                <div class="container-fluid">

                    <div class="card">
                        <div class="card-header"> <strong> Detalles de la Solicitud </strong></div>

                        <div class="card-body">
                            <div class="input-group">

                            </div>

                            
                                
                                    
                                    <div class="card-body">


                                        
                            
                            <h5> Nombre Usuario Postulante : ${solicitud.usuario.nombre} ${solicitud.usuario.apellido}</h5>
                            <br>
                            <h5> Correo Usuario Postulante : ${solicitud.usuario.correo}</h5>  
                            <br>
                            <h5> DNI Usuario Postulante : ${solicitud.usuario.dni}</h5>
                            <br>
                            <h5> Categoria Postulada  : ${solicitud.categoria.nombreCategoria }</h5> 
                            <br>
                            <h5> Justificacion  : ${solicitud.justificacion} </h5>
                            <br>                        
                            <h5>Estado Solicitud: <strong>  ${solicitud.estadoSolicitud} </strong></h5>
                            <br>
                           
                              <c:if test="${solicitud.usuario.sesion.id == 1}" >
                                
                                <td> <a class="btn btn-primary" href="${rootUrl}administrador/aceptarSolicitud/${listaSolicitudes.usuario.id}/${listaSolicitudes.id}">Aceptar</a> </td> 
                                
                            </c:if>
                            
                           
                                        
                                        
                                        <div >
                                            
                                            
                                            
                                          

                                            
                                             
                                            




                                         



                                        </div>     
                                    </div>
                                
                  
                    </div>
                </div>
            </div>
        </div>

        <!-- OJO todas estas lineas son importantes para el menu  -->                    
        <!-- Bootstrap core JavaScript-->
        <script src="${urlPublic}/vendor/jquery/jquery.min.js"></script>
        <script src="${urlPublic}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="${urlPublic}/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Page level plugin JavaScript-->
        <script src="${urlPublic}/vendor/chart.js/Chart.min.js"></script>
        <script src="${urlPublic}/vendor/datatables/jquery.dataTables.js"></script>
        <script src="${urlPublic}/vendor/datatables/dataTables.bootstrap4.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="${urlPublic}/js/sb-admin.min.js"></script>

        <!-- Demo scripts for this page-->
        <script src="${urlPublic}/js/demo/datatables-demo.js"></script>
        <script src="${urlPublic}/js/demo/chart-area-demo.js"></script>

    </body>

</html>
