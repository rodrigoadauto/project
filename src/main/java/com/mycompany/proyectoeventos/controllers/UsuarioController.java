/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.controllers;

import com.mycompany.proyectoeventos.model.repository.UsuarioRepository;
import javax.enterprise.inject.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author Rodrigo
 */
@Controller
public class UsuarioController {
    
    @Autowired
    public UsuarioRepository usuario_repositorio; 
    
    @GetMapping(value = "/")
    public String paginaPrincipal()
    {
        
        return "index";
    }
    @GetMapping(value = "/registro")
    public String registro()
    {
        return "registro";
    }
    
    @PostMapping(value = "/registrarUsuario")
    public String agregarUsuario()
    {
        //Guardar todo en la base de datos con JPA
        return "index";
    }
    
    
    
     @PostMapping("eventosPublicos1")
    public String eventosPublicos1(){
        return "moderador/Moderador_Eventos_Publicos";
    }
    
    
     @PostMapping("admin")
    public String admin(){
        return "admin/admin";
    }
    ////////////////// USUARIO ////// 
    
    @GetMapping("eventosPublicxs")
    public String eventosPublicxs(){
        return "usuario/Usuario_Eventos_Publicos";
    }
    
     @GetMapping("detalles1")
    public String detalles1(){
        return "usuario/Usuario_Detalles";
    }
    
    
     @GetMapping("misEventos")
    public String misEventos(){
        return "usuario/Usuario_MisEventos";
    }
    
     @GetMapping("misEventosOcurridos")
    public String misEventosOcurridos(){
        return "usuario/Usuario_MisEventosOcurridos";
    }
    
     @GetMapping("detalles2")
    public String detalles2(){
        return "usuario/detalle2";
    }
    
     @GetMapping("despues2")
    public String despues2(){
        return "usuario/despues2";
    }
    
      @GetMapping("editar")
    public String editar(){
        
        return "usuario/Usuario_EditarEvento";
    }
    
      @GetMapping("editar2")
    public String editar2(){
        return "usuario/editar2";
    }
  
   
    @GetMapping("crearEvento")
    public String crearEvento()
    {
        return "usuario/Usuario_CrearEvento";
    }
    
    @GetMapping("eventosAsistidos")
    public String eventosAsistidos()
    {
        return "usuario/Usuario_Eventos_Asistidos";
    }
    
     @GetMapping("eventosPorAsistir")
    public String eventosPorAsistir()
    {
        return "usuario/Usuario_PorAsistir";
    }
    
     @GetMapping("detalles3")
    public String detalles3()
    {
        return "usuario/detalle3";
    }
    
     @GetMapping("despues3")
    public String despues3()
    {
        return "usuario/despues3";
    }
    
    @GetMapping("postular")
    public String postular()
    {
        return "usuario/Usuario_Postular";
    }
    
    ///////// 
    
    ///// MODERADOR /////
    
     
    @GetMapping("eventosPublicxs1")
    public String eventosPublicxs1(){
        return "moderador/Moderador_Eventos_Publicos";
    }
    
     @GetMapping("detalles11")
    public String detalles11(){
        return "moderador/Moderador_Detalles";
    }
    
    @GetMapping("detalles111")
    public String detalles111(){
        return "moderador/detalles111";
    }
    
    
     @GetMapping("misEventos1")
    public String misEventos1(){
        return "moderador/Moderador_MisEventos";
    }
    
     @GetMapping("misEventosOcurridos1")
    public String misEventosOcurridos1(){
        return "moderador/Moderador_MisEventosOcurridos";
    }
    
     @GetMapping("detalles21")
    public String detalles21(){
        return "moderador/detalle2";
    }
    
     @GetMapping("despues21")
    public String despues21(){
        return "moderador/despues2";
    }
    
      @GetMapping("editar1")
    public String editar1(){
        return "moderador/Moderador_EditarEvento";
    }
    
      @GetMapping("editar21")
    public String editar21(){
        return "moderador/editar2";
    }
  
   
    @GetMapping("crearEvento1")
    public String crearEvento1()
    {
        return "moderador/Moderador_CrearEvento";
    }
    
    @GetMapping("eventosAsistidos1")
    public String eventosAsistidos1()
    {
        return "moderador/Moderador_Eventos_Asistidos";
    }
    
     @GetMapping("eventosPorAsistir1")
    public String eventosPorAsistir1()
    {
        return "moderador/Moderador_PorAsistir";
    }
    
     @GetMapping("detalles31")
    public String detalles31()
    {
        return "moderador/detalle3";
    }
    
     @GetMapping("despues31")
    public String despues31()
    {
        return "moderador/despues3";
    }
    
    @GetMapping("evaluar")
    public String evaluar()
    {
        return "moderador/Moderador_EvaluarEvento";
    }
    
    
    
    
    
    
    
    @GetMapping("/registrarEvento")
    public String registrarEvento()
    {
        return "index";
    }
    @GetMapping("/salir")
    public String salir()
    {
        return "index";
    }
    
    
}
