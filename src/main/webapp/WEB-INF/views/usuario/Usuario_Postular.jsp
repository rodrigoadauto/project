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
      <a class="navbar-brand" href="eventosPublicxs">EVENT PUCP</a>
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
          <a href="eventosPublicxs" class="list-group-item active ">Eventos Públicos</a>
          <a href="misEventos" class="list-group-item ">Mis Eventos</a>
          <a href="crearEvento" class="list-group-item">Crear Evento</a>
          <a href="eventosAsistidos" class="list-group-item ">Eventos Asistidos</a>
          <a href="postular" class="list-group-item">Postular a Moderador</a>
 
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
<div class="card" >
  <div class="card-header"><strong>POSTULAR A MODERADOR </strong> </div>
 <br>
 
  <form action="/action_page.php" class="was-validated">
   <select class="browser-default custom-select">
  <option selected>Selecciona la categoría a la que deseas postular</option>
  <option value="1">Eventos Culturales</option>
  <option value="2">Eventos Deportivos</option>
  <option value="3">Eventos Artisticos</option>
  <option value="1">Eventos Musicales</option>
  <option value="2">Eventos Políticos</option>
  <option value="3">Eventos Religiosos</option>
  <option value="1">Eventos Culinarios</option>
  <option value="2">Eventos Bienestar</option>
  <option value="3">Eventos Recreacionales</option>
  <option value="3">Otros</option>
  
</select>
    <div class="form-group">
   <br>
  <label for="comment"   style="margin-left: 8px";>Ingresa el motivo por el cual deseas ser moderador de esta categoría:</label>
  <textarea class="form-control" rows="5" id="comment"></textarea>

      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <button href="eventosPublicxs" class="btn btn-primary">Enviar solicitud</button>
    <button href="eventosPublicxs" class="btn btn-primary">Cancelar</button>
  </form>
  
</div>
</div>
</div>
</div>






  <!-- /.container -->

  <!-- Footer -->
  
  <!-- Bootstrap core JavaScript -->
  <script src="${urlPublic}/vendor/jquery/jquery.min.js"></script>
  <script src="${urlPublic}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
