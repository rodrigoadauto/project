<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic" />


<!DOCTYPE jsp>
<html>

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Eventos_Publicos</title>
        <jsp:include page="codigolinks.jsp" />
        <script>
            $(document).ready(function () {
                
                $("#sidebarToggle").click(function () {


                    if ($("#MainMenu").css("display") == "none") {
                        $("#MainMenu").css("display", "flex");
                    } else {
                        $("#MainMenu").css("display", "none");
                    }

                });

            })


        </script>

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

    </head>

    <body class="color" >

        <jsp:include page="BarraSuperiorUsuario.jsp" />

        <!-- Page Content -->
        <div id="wrapper"> 

            <jsp:include page="MenuUsuario.jsp" />

            <div id="content-wrapper">

                <div class="container-fluid">

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
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <jsp:include page="codigojs.jsp" />
    </body>

</html>
