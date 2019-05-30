/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.model.repository;

import com.mycompany.proyectoeventos.dto.Evento_DTO;
import java.util.List;

/**
 *
 * @author Labtel
 */
public interface EventoRepositoryCustom  {
    
    List<Evento_DTO> listarMisEventos ( int idUsuario) ;
    
    List<Evento_DTO> eventosCategoria ( String categoria) ; 
   
    
    List<Evento_DTO> listarEventosModerados () ; 
    
    


    
}
