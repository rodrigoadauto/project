<%-- 
    Document   : ejemplo
    Created on : 30/05/2019, 11:49:50 AM
    Author     : Rodrigo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/" var="rootUrl" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="codigolinks.jsp" />
        <style>
            .tamano_img{
                width: 347px;
                height: 240px;
            }

            .movie__label {
                display: flex;
                position: absolute;
                z-index: 2;
                text-transform: uppercase;
               align-items: center;
                justify-content: center;
                opacity:0.8;
            }
            .titulo{
                align-items: center;
                justify-content: center;
                z-index: 4;

            }
            .ayuda{
                 align-items: center;
                 x-index:3;
                
            }
        </style>
    </head>
    <body style="background-color: black">
        <div class="container">
            <div class="row">




                <div class="col-sm-4">
                    <div class="row">
                        <div class="col-sm-2">
                        </div>
                        <div class="col-sm-8">
                            <strong><a href ="" class=""><p class="text-center">Manager PUCP </p></a></strong>
                            
                        </div>
                        <div class="col-sm-2">
                        </div>
                    </div>

                    <div class=" mt-2 ml-2 movie__label">
                        <span class="badge badge-pill badge-danger pl-2 pr-2">Deporte</span>
                        
                    </div>
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row no-gutters">
                            <div class="col-md-12">
                                
                                <img src="${urlPublic}/imagen/manager400.png" class=" card-img-top tamano_img img-responsive">

                            </div>
                            <button class="btn btn-outline-info btn-block">Asistir</button>
                        </div>
                    </div>
                </div>
                                
                <div class="col-sm-4">
                    <div class="row">
                        <div class="col-sm-2">
                        </div>
                        <div class="col-sm-8">
                            <strong><a href ="" class=""><p class="text-center">Fiesta en la Torre </p> </a></strong>
                        </div>
                        <div class="col-sm-2">
                        </div>
                    </div>

                    <div class=" mt-2 ml-2 movie__label">
                        <span class="badge badge-pill badge-danger pl-2 pr-2">Fiesta</span>
                        
                    </div>
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row no-gutters">
                            <div class="col-md-12">
                                <img src="${urlPublic}/imagen/descarga.jpg" class=" card-img-top tamano_img img-responsive">

                            </div>
                            <button class="btn btn-outline-info btn-block">Asistir</button>
                        </div>
                    </div>
                </div>
                                <div class="col-sm-4">
                    <div class="row">
                        <div class="col-sm-2">
                        </div>
                        <div class="col-sm-8">
                            <strong><a href ="" class=""> <p class="text-center">FIesta de disfrases </p></a></strong>
                        </div>
                        <div class="col-sm-2">
                        </div>
                    </div>

                    <div class=" mt-2 ml-2 movie__label">
                        <span class="badge badge-pill badge-danger pl-2 pr-2">Telecomunicaciones</span>
                        
                    </div>
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row no-gutters">
                            <div class="col-md-12">
                                <img src="${urlPublic}/imagen/fondo1.jpg" class=" card-img-top tamano_img img-responsive">

                            </div>
                            <button class="btn btn-outline-info btn-block">Asistir</button>
                        </div>
                    </div>
                </div>
                                
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row no-gutters">
                            <div class="col-md-6">
                                <img src="${urlPublic}/imagen/fondo1.jpg" class="img-fluid img-responsive" >
                            </div>
                            <div class="col-md-6">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text">This is a wider card with supporting text below as a natural..</p>
                                    <p class="card-text"><small class="text-muted">Detalless</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row no-gutters">
                            <div class="col-md-6">
                                <img src="${urlPublic}/imagen/fondo2.jpg" class="img-fluid img-responsive" >
                            </div>
                            <div class="col-md-6">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text">This is a wider card with supporting text below as a natural..</p>
                                    <p class="card-text"><small class="text-muted">Detalless</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>  
                <div class="col-sm-4">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row no-gutters">
                            <div class="col-md-6">
                                <img src="${urlPublic}/imagen/god_of_war_4.jpg" class="img-fluid" >
                            </div>
                            <div class="col-md-6">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text">This is a wider card with supporting text below as a natural..</p>
                                    <p class="card-text"><small class="text-muted">Detalless</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row no-gutters">
                            <div class="col-md-6">
                                <img src="${urlPublic}/imagen/manager400.png" class="img-fluid" >
                            </div>
                            <div class="col-md-6">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text">This is a wider card with supporting text below as a natural..</p>
                                    <p class="card-text"><small class="text-muted">Detalless</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row no-gutters">
                            <div class="col-md-6">
                                <img src="${urlPublic}/imagen/descarga.jpg" class="img-fluid" >
                            </div>
                            <div class="col-md-6">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text">This is a wider card with supporting text below as a natural..</p>
                                    <p class="card-text"><small class="text-muted">Detalless</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>  
                <div class="col-sm-4">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row no-gutters">
                            <div class="col-md-6">
                                <img src="${urlPublic}/imagen/fondo2.jpg" class="img-fluid" >
                            </div>
                            <div class="col-md-6">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text">This is a wider card with supporting text below as a natural..</p>
                                    <p class="card-text"><small class="text-muted">Detalless</small></p>
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
