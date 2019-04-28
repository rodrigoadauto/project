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
          <a href="eventosPublicxs" class="list-group-item  ">Eventos Públicos</a>
          <a href="misEventos" class="list-group-item active ">Mis Eventos</a>
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
<div class="card">
  <div class="card-header"> Detalles del evento</div>

  <div class="card-body">
        <div class="input-group">

            </div>

        <div class="card mt-4">
          <img class="card-img-top img-fluid" src="http://placehold.it/1500x400" alt="">
          <div class="card-body">

            
                            <div class="d-flex">
                                <h3 class="text-left" > Representacion Teatral PUCP </h3>
                                <button type="button" class=" btn btn-sm btn-light mb-4 ml-auto mr-4 p-2 text-dark float-right border-secondary rounded-pill" > Categoría: ARTE </button>

                            </div>
                            <h5> Creador : Roberto Bolaño </h5>
            <h5> Fecha de inicio: 17-04-19 12:00:00 </h5>
      <h5> Fecha de fin: 17-04-19 14:30:00 </h5>
      <h5> Lugar: Complejo Polideportivo </h5>
      <h5> Descripción: </h5>
            <p> La facultad de derecho los invita a todos al Complejo Polideportivo a ver una adaptación de la clásica película "El Rey Lear" </p>
       <div class="form-group">
        <label for="exampleFormControlTextarea1">Deja tu comentario aquí:</label>
      <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
  
    </div>
    
    <div class="container">
    <div class="form-group">
        <label>Sube una foto:</label>
        <div class="input-group">
            <span class="input-group-btn">
                <span class="btn btn-default btn-file">
                    Navegar... <input type="file" id="imgInp">
                </span>
            </span>
        </div>
        <img id='img-upload'/>
    </div>
</div>
    
         <div >
          
                   <a class="btn btn-danger btn-lg float-right " href="misEventosOcurridos" role="button">Eliminar</a>  

                  <a class="btn btn-primary btn-lg float-left " href="misEventosOcurridos" role="button">Regresar</a>
                            </div>     
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
