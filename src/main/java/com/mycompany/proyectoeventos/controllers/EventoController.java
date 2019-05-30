/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.controllers;

import com.mycompany.proyectoeventos.model.entity.Categoria;
import com.mycompany.proyectoeventos.model.entity.Evento;
import java.util.List;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import com.mycompany.proyectoeventos.model.repository.CategoriaRepository;
import com.mycompany.proyectoeventos.model.repository.EventoRepository;
import com.mycompany.proyectoeventos.model.repository.EventoRepositoryImpl;
import com.mycompany.proyectoeventos.model.repository.UsuarioRepository;
import java.util.Optional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Rodrigo
 */
@Controller
public class EventoController {

    @Autowired
    public EventoRepository eventoRepository;
    
    @Autowired
    public CategoriaRepository categoriaRepository;
    
    @Autowired
    EventoRepositoryImpl eventoRepositoryImpl;

 
    }

   
    
    
    


