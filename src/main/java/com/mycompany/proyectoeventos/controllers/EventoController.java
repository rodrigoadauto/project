/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.controllers;

import com.mycompany.proyectoeventos.model.entity.Evento;
import com.mycompany.proyectoeventos.model.repository.EventoRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author Rodrigo
 */
@Controller
public class EventoController {
    
    @Autowired
    public EventoRepository evento_repositorio; 
    
    @PostMapping("usuario/listar")
    public String eventosPublicos(Model model){
        
        List<Evento> listaEvento = evento_repositorio.findAll();
        model.addAttribute("listaEvento",listaEvento);
        return "usuario/Usuario_Eventos_Publicos";
    }
}
