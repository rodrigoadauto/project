/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.controllers;

import com.mycompany.proyectoeventos.dto.Usuario_DTO;
import com.mycompany.proyectoeventos.model.entity.Categoria;
import com.mycompany.proyectoeventos.model.entity.Sesion;
import com.mycompany.proyectoeventos.model.entity.Solicitud;
import com.mycompany.proyectoeventos.model.entity.Usuario;
import com.mycompany.proyectoeventos.model.repository.AdministradorRepository;
import com.mycompany.proyectoeventos.model.repository.AdministradorRepositoryImpl;
import java.util.List;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import com.mycompany.proyectoeventos.model.repository.CategoriaRepository;
import com.mycompany.proyectoeventos.model.repository.SesionRepository;
import com.mycompany.proyectoeventos.model.repository.SolicitudRepository;
import com.mycompany.proyectoeventos.model.repository.UsuarioRepository;
import java.util.Optional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
/**
 *
 * @author Rodrigo
 */
@Controller
public class AdministradorController {
    
    
// Pagina De Logueo   
@GetMapping("/administrador/usuario")
public String generalAdmin(Model model    ) {
    
   model.addAttribute("listaUsuarios",usuarioRepository.findAll()) ; 
   return "redirect:/administrador/usuarios/1";   }


@Autowired
AdministradorRepository administradorRepository;

@Autowired
AdministradorRepositoryImpl administradorRepositoryImpl;

@Autowired
UsuarioRepository usuarioRepository;

@Autowired
SesionRepository sesionRepository; 

@Autowired
SolicitudRepository solicitudRepository; 


// Listar Usuarios (idSesion = 1)  o Moderadores (idSesion = 2) 
@GetMapping("/administrador/usuarios/{idsesion}")
public String listarUsuarios(Model model , @PathVariable("idsesion") int idsesion ,  @RequestParam(name = "inicio", required = false) Integer inicio,
            RedirectAttributes attr) {
    
   if (inicio == null) {
            inicio = 0;

        } else if (inicio > 0) {
            inicio--;
        }
        double paginas = (double) usuarioRepository.contador_Usuarios(idsesion);
        double cantPorPaginaDouble = Math.ceil(paginas / 5);
        int cantDePaginas = (int) cantPorPaginaDouble;

        List<Usuario> listaUsuarios = usuarioRepository.paginacion_Usuarios(idsesion, inicio*5, 5);
        
       
        if ( idsesion == 1) {
        model.addAttribute("usuario", 1); }
        else { model.addAttribute("usuario",0) ; } 
        
        
        model.addAttribute("cantDePaginas", cantDePaginas);
        model.addAttribute("listaUsuarios", listaUsuarios);
        model.addAttribute("paginaActual", ++inicio);

        return "administrador/verUsuarios";
    }


// Listar Usuarios (idSesion = 1) y Moderadores Bloqueados (idSesion = 2)  
@GetMapping("/administrador/bloqueados/{idsesion}/{activo}")
public String listarUsuariosBloqueados(Model model , @PathVariable("idsesion") int idsesion, @PathVariable("activo") int activo , @RequestParam(name = "inicio", required = false) Integer inicio) {
    
     if (inicio == null) {
            inicio = 0;

        } else if (inicio > 0) {
            inicio--;
        }
        double paginas = (double) usuarioRepository.contador_Bloqueados(activo, idsesion);
        double cantPorPaginaDouble = Math.ceil(paginas / 5);
        int cantDePaginas = (int) cantPorPaginaDouble;
        
         if ( idsesion == 1) {
        model.addAttribute("usuario", 1); }
        else { model.addAttribute("usuario",0) ; }

        List<Usuario> listaBloqueados = usuarioRepository.paginacion_Bloqueados(activo, idsesion, inicio*5, 5);

        model.addAttribute("cantDePaginas", cantDePaginas);
        model.addAttribute("listaBloqueados", listaBloqueados);
        model.addAttribute("paginaActual", ++inicio);

        return "administrador/verBloqueados";
}



// Bloquear Usuario - Borrado Logico 
@GetMapping("/administrador/bloquearUsuario/{idUsuario}")
public String bloquearUsuario(@PathVariable("idUsuario") int idUsuario) {
    
    Optional<Usuario> opt = usuarioRepository.findById(idUsuario);
    
    if(opt.isPresent()){
        Usuario u = opt.get();
        u.setActivo(0);
        usuarioRepository.save(u); }
      
return "redirect:/administrador/usuarios/1" ; 
}

// Bloquear Moderador - Borrado Logico 
@GetMapping("/administrador/bloquearModerador/{idUsuario}")
public String bloquearModerador(@PathVariable("idUsuario") int idUsuario) {
    
    Optional<Usuario> opt = usuarioRepository.findById(idUsuario);
    
    if(opt.isPresent()){
        Usuario u = opt.get();
        u.setActivo(0);
        usuarioRepository.save(u); }
    
return "redirect:/administrador/usuarios/2" ; 
}

// Desbloquear Usuario 
@GetMapping("/administrador/desbloquearUsuario/{idUsuario}")
public String desbloquearUsuario(@PathVariable("idUsuario") int idUsuario) { 
    
     Optional<Usuario> opt = usuarioRepository.findById(idUsuario);
    
    if(opt.isPresent()){
        Usuario u = opt.get();
        u.setActivo(1);
        usuarioRepository.save(u); }
    
return "redirect:/administrador/bloqueados/1/0" ; 
}

// Desbloquear Moderador
@GetMapping("/administrador/desbloquearModerador/{idUsuario}")
public String desbloquearModerador(@PathVariable("idUsuario") int idUsuario) { 
    
     Optional<Usuario> opt = usuarioRepository.findById(idUsuario);
    
    if(opt.isPresent()){
        Usuario u = opt.get();
        u.setActivo(1);
        usuarioRepository.save(u); }
    
return "redirect:/administrador/bloqueados/2/0" ; 
}



// Degradar Moderador - Volverlo Usuario 
@GetMapping("/administrador/degradarModerador/{idUsuario}")
public String degradarModerador(@PathVariable("idUsuario") int idUsuario) {
    
    
        Optional<Usuario> opt = usuarioRepository.findById(idUsuario);
    
    if(opt.isPresent()){
        Usuario u = opt.get();
        Sesion session = new Sesion();
        session.setId(1);
        u.setSesion(session);
        usuarioRepository.save(u); }
             
return "redirect:/administrador/usuarios/2" ; 
}

//Solicitudes A Moderador
@GetMapping("/administrador/solicitudes")
    public String solicitudes (Model model){ 
        
        List<Solicitud> listaSolicitudes = solicitudRepository.findAll();
        model.addAttribute("listaSolicitudes", listaSolicitudes ); 
        return "administrador/Solicitudes"; 
    }
    
// Aceptar Solicitud Moderador 
@GetMapping("/administrador/aceptarSolicitud/{idUsuario}/{idSolicitud}")    
public String aceptarSolicitud(Model model , @PathVariable("idUsuario") int idUsuario ,  @PathVariable("idSolicitud") int idSolicitud ) {
    
       Optional<Usuario> opt = usuarioRepository.findById(idUsuario);
       Optional<Solicitud> opt1 = solicitudRepository.findById(idSolicitud);
    
    if(opt.isPresent()){
        Usuario u = opt.get();
        Sesion session = new Sesion();
        session.setId(2);
        u.setSesion(session);
        usuarioRepository.save(u); }
    
    if(opt1.isPresent()){
        Solicitud s = opt1.get();
        s.setEstadoSolicitud("Aprobado");
        solicitudRepository.save(s);
    }
    
    return "redirect:/administrador/solicitudes" ; 
 
}

// Perfil Usuario 
@GetMapping("/administrador/perfil/{idUsuario}")
public String perfilUsuario(Model model , @PathVariable("idUsuario") int idUsuario  ) {
    Optional <Usuario> optional = usuarioRepository.findById(idUsuario);
    if(optional.isPresent()){
        Usuario usuaria = optional.get();
        model.addAttribute("usuario", usuaria);
        return "administrador/perfilUsuario"; }
    else { return "redirect:/administrador/usuario/1" ;}
    
}

// Perfil Solicitud 
@GetMapping("/administrador/perfilSolicitud/{idSolicitud}")
public String perfilSolicitud(Model model , @PathVariable("idSolicitud") int idSolicitud  ) {
    Optional <Solicitud> optional = solicitudRepository.findById(idSolicitud);
    if(optional.isPresent()){
        Solicitud solicty = optional.get();
        model.addAttribute("solicitud", solicty);
        return "administrador/perfilSolicitud"; }
    else { return "redirect:/administrador/usuario/1" ;}
    
}
    
//Buscar Usuario
@GetMapping("/administrador/buscar")
public String buscarUsuario(Model model,@RequestParam(value = "search", defaultValue = "") String search ) {
   
  model.addAttribute("listaUsuarios" ,usuarioRepository.findByNombreContaining(search)) ;
    
return "administrador/verUsuarios"; }

//@GetMapping("/administrador/eventosReportados")
//public String eventosReportados (Model model )


}