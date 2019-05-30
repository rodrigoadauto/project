/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.controllers;

import com.mycompany.proyectoeventos.model.entity.Categoria;
import com.mycompany.proyectoeventos.model.entity.Evento;
import com.mycompany.proyectoeventos.model.entity.Sesion;
import com.mycompany.proyectoeventos.model.entity.Usuario;
import java.util.List;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import com.mycompany.proyectoeventos.model.repository.CategoriaRepository;
import com.mycompany.proyectoeventos.model.repository.UsuarioRepository;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.validation.Valid;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author USER
 */
@Controller
public class HomeController {

    @Autowired
    public UsuarioRepository usuario_repositorio;

    @GetMapping(value = "/l")
    public String paginaPrincipal() {

        return "index";
    }
  
    @GetMapping(value = "/registro")
    public String registro(@ModelAttribute("usuario") Usuario usuario, Model model) {
        return "registro";
    }

       @PostMapping(value = "/registrarUsuario")
    public String agregarUsuario(@ModelAttribute("usuario") @Valid Usuario usuario, BindingResult bindingResult, Model model, @RequestParam("contrasena2") String contrasena2, RedirectAttributes attr) {
        //Guardar todo en la base de datos con JPA
        if (bindingResult.hasErrors()) {
            if (usuario.getContrasena().equals(contrasena2)){
            return "registro";
            } else {
            model.addAttribute("msg", "Las contraseñas deben coincidir");
            return "registro";
            }
            
        } else {
            if (usuario.getContrasena().equals(contrasena2)){
            Sesion sesion = new Sesion();
            sesion.setId(1);
            sesion.setAutoridad("usuario");
            usuario.setSesion(sesion);
            usuario.setContrasena(new BCryptPasswordEncoder().encode(usuario.getContrasena()));
            usuario.setTipo("U");
            usuario.setEstadoUsuario("Activo");
            usuario.setActivo(1);
            Categoria categoria = new Categoria();
            categoria.setId(1);
            usuario.setCategoria(categoria);
            
             //usuario.setActivo(1);
            //
//            Sesion sesion = new Sesion();
//            sesion.setidSesion(1);
//            usuario.setSesion(sesion);
            usuario_repositorio.save(usuario);
            attr.addFlashAttribute("msg", "Registro realizado exitosamente");
            
                    Properties props = new Properties();
                    // Nombre del host de correo, es smtp.gmail.com
                    props.setProperty("mail.smtp.host", "smtp.gmail.com");
                    // TLS si está disponible
                    props.setProperty("mail.smtp.starttls.enable", "true");
                    // Puerto de gmail para envio de correos
                    props.setProperty("mail.smtp.port","587");
                    // Nombre del usuario
                    props.setProperty("mail.smtp.user", "alvaroburgalarco@gmail.com");
                    // Si requiere o no usuario y password para conectarse.
                    props.setProperty("mail.smtp.auth", "true");

                    Session sesion2 = Session.getDefaultInstance(props);
                    sesion2.setDebug(true);

                    MimeMessage message = new MimeMessage(sesion2);
            try {
                message.setFrom(new InternetAddress("alvaroburgalarco@gmail.com"));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(usuario.getCorreo()));
                message.setSubject("Registro Exitoso");
                String text= "Bienvenido a Manager PUCP <br> Agradecemos por su preferencia.";
                message.setText(text, "UTF-8", "html");
                Transport t = sesion2.getTransport("smtp");
                t.connect("alvaroburgalarco@gmail.com","password");
                t.sendMessage(message,message.getAllRecipients());
                t.close();
            } catch (AddressException ex) {
                System.out.println("Ocurrio un error");
            }   catch (MessagingException ex) { 
                    Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);            
            }
            
            return "redirect:/l";
            }
            else {
            model.addAttribute("msg", "Las contraseñas deben coincidir");
            return "registro";
            }
        }
    }
    
    @PostMapping("eventosPublicos1")
    public String eventosPublicos1() {
        return "moderador/Moderador_Eventos_Publicos";
    }

    @PostMapping("admin")
    public String admin() {
        return "admin/admin";
    }

    ///////// 
    ///// MODERADOR /////
    

    @GetMapping("/registrarEvento")
    public String registrarEvento() {
        return "index";
    }

    @GetMapping("/salir")
    public String salir() {
        return "index";
    }
    
        @GetMapping("/recuperarContrasena")
    public String recuperarContraseña()
    {
        return "recuperarContrasena";
    }

    @PostMapping("/procesarCorreo")
    public String procesarCorreo(@RequestParam("correo") String correo, RedirectAttributes attr, Model model) throws MessagingException {
        
        Usuario user = usuario_repositorio.findByCorreo(correo);
        
        if(user != null)
        {
            
            Properties props = new Properties();
            // Nombre del host de correo, es smtp.gmail.com
            props.setProperty("mail.smtp.host", "smtp.gmail.com");
            // TLS si está disponible
            props.setProperty("mail.smtp.starttls.enable", "true");
            // Puerto de gmail para envio de correos
            props.setProperty("mail.smtp.port","587");
            // Nombre del usuario
            props.setProperty("mail.smtp.user", "alvaroburgalarco@gmail.com");
            // Si requiere o no usuario y password para conectarse.
            props.setProperty("mail.smtp.auth", "true");

            Session sesion2 = Session.getDefaultInstance(props);
            sesion2.setDebug(true);

            MimeMessage message = new MimeMessage(sesion2);
            try {
                message.setFrom(new InternetAddress("alvaroburgalarco@gmail.com"));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(correo));
                message.setSubject("Recuperar contraseña");
                String text= "Para recuperar tu contraseña haga click <a href=\"http://localhost:8084/ProyectoEventos/nuevaContrasena?hash="+user.getContrasena()+"\">aqui</a>";
                message.setText(text, "UTF-8", "html");
                Transport t = sesion2.getTransport("smtp");
                t.connect("alvaroburgalarco@gmail.com","pitipiti");
                t.sendMessage(message,message.getAllRecipients());
                t.close();
            } catch (AddressException ex) {
                System.out.println("Ocurrio un error");
            }   catch (MessagingException ex) { 
                    Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);            
            }            
            attr.addFlashAttribute("msg", "Se ha enviado un correo para recuperar la cuenta");
            
        }
        else
        {
            attr.addFlashAttribute("msg", "No se encontro el correo");
        }
        
        
        return "redirect:/l";
    }
    @GetMapping("/nuevaContrasena")
    public String nuevaContrasena(Model model,@RequestParam("hash") String hash )
    {
        model.addAttribute("hash", hash);
        return "/nuevaContrasena";
    }
    
    @PostMapping("/cambiarContrasena")
    public String cambiarContrasena(@RequestParam("password") String password,
            @RequestParam("contrasena") String contrasena,
            RedirectAttributes attr, 
            @RequestParam("hash") String hash)
    {
            if(password.equals(contrasena))
            {
                Usuario usuario = usuario_repositorio.findByContrasena(hash);
                if(usuario!= null)
                {
                    usuario.setContrasena( new BCryptPasswordEncoder().encode(password)); 
                    usuario_repositorio.save(usuario);
                    attr.addFlashAttribute("msg", "Contraseña actualizada");
                    return "redirect:/l";
                }  
                else attr.addFlashAttribute("msg", "No tiene permiso para modificar esto");
            }
        else attr.addFlashAttribute("msg", "Las contraseñas no coinciden");
        attr.addAttribute("hash", hash);
        return "redirect:/nuevaContrasena";
    }
    

}
