<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic" />


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

</head>

<body class="color" >

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="eventosPublicxs1">EVENT PUCP</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          
          <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle"id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href=" "> <strong> ROBERTO BOLAÑO </strong> <span class="sr-only">(current)</span></a>

                            <div class="dropdown-menu bg-dark border-dark" aria-labelledby="navbarDropdown">
                               
                                <a class="dropdown-item bg-dark text-light" href=" " >  Salir </a>

                            </div>

                        </li> 
         
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row flex-xl-nowrap">

      <div class="col-lg-3 ">
        <h1 class="my-4"></h1>
        <div class="list-group text-green">
          <a href="eventosPublicxs1" class="list-group-item  ">Eventos Públicos</a>
          <a href="misEventos1" class="list-group-item active ">Mis Eventos</a>
          <a href="crearEvento1" class="list-group-item ">Crear Evento</a>
          <a href="eventosAsistidos1" class="list-group-item ">Eventos Asistidos</a>
          <a href="evaluar" class="list-group-item">Evaluar Eventos</a>
 
        </div>

        <p>
          
        </p>

          <div class="list-group">

          <a href="#" class="list-group-item active"> Categorías </a>
          <a href="#" class="list-group-item"> Eventos Culturales </a>
          <a href="#" class="list-group-item"> Eventos Deportivos </a>
          <a href="#" class="list-group-item"> Eventos Artísticos </a>
          <a href="#" class="list-group-item"> Eventos Musicales </a>
          <a href="#" class="list-group-item"> Eventos Políticos</a>
          <a href="#" class="list-group-item"> Eventos Religiosos </a>
          <a href="#" class="list-group-item"> Eventos Culinarios </a>
          <a href="#" class="list-group-item"> Eventos Bienestar </a>
          <a href="#" class="list-group-item"> Eventos Recreacionales </a>
          <a href="#" class="list-group-item"> Otros </a>
          
          
  
        </div>


        <div>
          

        </div>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">
          
<p>    </p>  
<div class="card">
  <div class="card-header "> <strong> EDITAR EVENTO</strong> </div>

  <div class="card-body">

       
            <form>


            <div class="form-group">
              <label for="exampleInputEmail1">Foto Del Evento</label>
              <div class="row">
                <div class="col-lg-6">
                   <img class="card-img-top img-fluid" src="http://placehold.it/900x300" alt="">
              </div>

              <div class="col-lg-6">
                  <p class="invisible"> noborrar </p>
                  <p class="invisible"> noborrar </p>
                  
                  <a class="btn btn-secondary btn " href="#" role="button"> Actualizar Foto</a> 
              </div>
              
               <h6 class="invisible"> no borrar </h6>

            </div>
            
            <div class="form-group">
              <label for="exampleInputEmail1">Nombre del evento</label>
              <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Teatro PUCP">
            </div>

             <div class="form-group">
              <label for="exampleInputEmail1">Ubicación</label>
              <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Polideportivo PUCP">
            </div>

            <div class="form-group">
              <label for="exampleInputEmail1">Seleccionar Categoría del Evento</label>

             <div class="dropdown">

            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Evento Cultural
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
              <a class="dropdown-item" href="#">Cultural</a>
              <a class="dropdown-item" href="#">Bienestar</a>
              <a class="dropdown-item" href="#">Ciencia</a>
              <a class="dropdown-item" href="#">Fiesta</a>
              <a class="dropdown-item" href="#">Otros</a>
          </div>
          </div>
        </div>

            <div class="form-group">
              <label for="exampleInputEmail1">Fecha</label>
              <input type="text" class="form-control" id="exampleInputEmail1" placeholder="17 Abril 2019">
            </div>

                <div class="form-group">
              <label for="exampleInputEmail1">Hora Inicio</label>
              <input type="text" class="form-control" id="exampleInputEmail1" placeholder="20:00">
            </div>

                <div class="form-group">
              <label for="exampleInputEmail1">Hora Fin</label>
              <input type="text" class="form-control" id="exampleInputEmail1" placeholder="23:00">
            </div>
               
               
               <div class="d-flex ">
                <a class="btn btn-secondary btn-lg mr-auto float-left" href="misEventos1" role="button">Regresar</a> 
                <a class="btn btn-secondary btn-lg float-right" href="misEventos1" role="button">Actualizar Evento</a> 

                            </div>
            
                
   </div>
 </form>
</div>
</div>


<p>    </p>  

  <p>  </p>
</div>

  <!-- /.container -->

  <!-- Footer -->
  
  <!-- Bootstrap core JavaScript -->
  <script src="${urlPublic}/vendor/jquery/jquery.min.js"></script>
  <script src="${urlPublic}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
