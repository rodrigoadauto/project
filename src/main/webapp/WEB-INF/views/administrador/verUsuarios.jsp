<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/" var="rootUrl" />

<!DOCTYPE jsp>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Admin_VerUsuarios</title>

        <!-- Bootstrap core CSS -->
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
 
   
  <div class="card-body">

        <p>  </p>
            <div class="row">


       <div class="container">
            <h1>Lista de Usuarios</h1>
            
            
            
           <div class="col-md-8">
                    <form class="form-inline mt-2 d-flex justify-content-end" action="${rootUrl}administrador/buscar" method="Get">
                        <input class="form-control mr-sm-2 col-md-8" name="search" value="${search}" type="search" placeholder="Usuario" aria-label="Search">                        
                        <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Buscar</button>
                    </form>
                </div>
            
            
            
            <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nombre de Usuario</th>
                        <th>Correo</th>
                        <th>Documento</th>
                        <th>Categoria</th>
                        <th>Estado</th>
                        <th>Perfil</th>
                        
                       
                        
                    </tr>
                </thead>
                <tbody>
                    
                    <c:forEach var="listaUsuarios" items="${listaUsuarios}" varStatus="loop">
                        <tr>
                            <th>${loop.index+1}</th>
                            <td>${listaUsuarios.nombre} ${listaUsuarios.apellido}</td>
                            <td>${listaUsuarios.correo}</td>
                            <td>${listaUsuarios.dni}</td>  
                            <td>${listaUsuarios.sesion.id == 1 ? '--' : listaUsuarios.categoria.nombreCategoria } </td>
                            <td><strong> ${listaUsuarios.activo == 1 ? 'Activo' : 'Bloqueado'} </strong></td>
                            <td><a  href="${rootUrl}administrador/perfil/${listaUsuarios.id}"> Ver Perfil </a></td> 
                            
                            <c:if test="${listaUsuarios.sesion.id == 1}">
                               <td> <a class="btn btn-danger" href="${rootUrl}administrador/bloquearUsuario/${listaUsuarios.id}">Bloquear</a> </td> 
                            </c:if>
                            
                            <c:if test="${listaUsuarios.sesion.id == 2}"> 
                             <td> <a class="btn btn-danger" href="${rootUrl}administrador/bloquearModerador/${listaUsuarios.id}">Bloquear</a>    </td>
                             <td> <a class="btn btn-primary" href="${rootUrl}administrador/degradarModerador/${listaUsuarios.id}">Degradar</a>    </td>    
                            </c:if>
                           
                             
                            
                        </tr>
                    </c:forEach>               
                </tbody>
            </table>
        </div>


      
      <p>                       </p>
      
      <c:if test="${usuario eq 1}">
      <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">

                                        <c:forEach var="i" begin="1" end="${cantDePaginas}" varStatus="loop">

                                            <c:if test="${paginaActual == i}">
                                                <li class="page-item active"><a style="pointer-events: none;background-color: gray; color:" class="page-link" href="">${i}</a></li>                                                
                                                </c:if>
                                                <c:if test="${paginaActual != i}">
                                                <li class="page-item active"><a class="page-link" href="${rootUrl}administrador/usuarios/1?inicio=${i}">${i}</a></li>                                                
                                                </c:if>
                                                
                                        </c:forEach>
                       </ul>
                                </nav>
      
      </c:if>
      
      <c:if test="${usuario ne 1}">
      <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">

                                        <c:forEach var="i" begin="1" end="${cantDePaginas}" varStatus="loop">

                                            <c:if test="${paginaActual == i}">
                                                <li class="page-item active"><a style="pointer-events: none;background-color: gray; color:" class="page-link" href="">${i}</a></li>                                                
                                                </c:if>
                                                <c:if test="${paginaActual != i}">
                                                <li class="page-item active"><a class="page-link" href="${rootUrl}administrador/usuarios/2?inicio=${i}">${i}</a></li>                                                
                                                </c:if>
                                                
                                        </c:forEach>
                       </ul>
                                </nav>
      
      </c:if>
      
      



                            </div>
                        </div>
                    </div>
                    <p>  </p>
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
