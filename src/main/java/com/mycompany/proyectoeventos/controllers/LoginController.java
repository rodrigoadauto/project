/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.controllers;

import com.mycompany.proyectoeventos.model.entity.Usuario;
import com.mycompany.proyectoeventos.model.repository.UsuarioRepository;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


/**
 *
 * @author USER
 */
@Controller
public class LoginController {

  
    @GetMapping(value="/")
    public String loginform(){
        return "index";
    }  

@Autowired 
UsuarioRepository usuario_repositorio; 
    
    @GetMapping(value = "/redirectPorRol")
    public String redirectByRole(Authentication auth, HttpSession session) {
        
        String autoridad = "";
       
        for (GrantedAuthority role : auth.getAuthorities()) {
            autoridad = role.getAuthority();
            break;
        }
        
        String nombreDeUsuario = auth.getName(); // Esta obteniendo aqui el nombre del correo ingresado para loguear 
        
        Usuario usuario = usuario_repositorio.findByCorreo(nombreDeUsuario);
        
        session.setAttribute("usuario", usuario);           
        
        if (autoridad.equals("usuario")) {
            return "redirect:/usuario/listar";
            
        } if (autoridad.equals("moderador") ) {
            return "redirect:/moderador/listar";
        }
        
        else { return "redirect:/administrador/usuario";}
    }
 
    }


        
        
        
    
