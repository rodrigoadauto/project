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

        <title>Admin_VerModeradores</title>

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
 
    
    <div class="card-header "> 
        <ul class="nav nav-tabs card-header-tabs">
        <li class="nav-item">
        <a class="nav-link active " href="${rootUrl}administrador/usuario"> Moderador </a>
        </li>
       
        
        <li class="nav-item">
        <a class="nav-link " href="${rootUrl}administrador/ModeradoresBloqueados"> Bloqueados </a>
        </li>
        </ul>
   </div>


  <div class="card-body">

        <p>  </p>
            <div class="row">


       <div class="container">
            <h1>Lista de Moderadores</h1>
            
    
           <div class="col-md-8">
                    <form class="form-inline mt-2 d-flex justify-content-end" action="${rootUrl}administrador/buscar" method="GET">
                        <input class="form-control mr-sm-2 col-md-8" name="search" value="${search}" type="search" placeholder="Usuario" aria-label="Search">                        
                        <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Buscar</button>
                    </form>
                </div>
            
            
            
            <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nombre de Moderador</th>
                        <th>Correo</th>
                        <th>Documento</th>
                        <th>Categoria</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="listaModeradores" items="${listaModeradores}" varStatus="loop">
                        <tr>
                            <th>${loop.index+1}</th>
                            <td>${listaModeradores.nombre}  ${listaModeradores.apellido}</td>
                            <td>${listaModeradores.correo}</td>
                            <td>${listaModeradores.dni}</td>
                            <td>${listaModeradores.nombreCategoria}</td>
                            <td><a class="btn btn-primary" href="${rootUrl}administrador/degradarModerador/${listaModeradores.idUsuario}">Degradar</a></td>
                            <td><a class="btn btn-danger" href="${rootUrl}administrador/bloquearModerador/${listaModeradores.idUsuario}">Bloquear</a></td>
                            <td></td>
                        </tr>
                    </c:forEach>               
                </tbody>
            </table>
        </div>


      
      <p>                       </p>

     


    

</div>
  </div>
  <p>  </p>
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
