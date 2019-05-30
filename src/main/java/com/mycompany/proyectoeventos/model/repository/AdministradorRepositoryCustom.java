/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.model.repository;

import com.mycompany.proyectoeventos.dto.Usuario_DTO;
import com.mycompany.proyectoeventos.model.entity.Usuario;
import java.util.List;

/**
 *
 * @author Labtel
 */
public interface AdministradorRepositoryCustom {
    
    // Listar 
    
    public List<Usuario_DTO> obtenerListaUsuarios () ;
    public List<Usuario_DTO> obtenerTotalUsuarios();
    public List<Usuario_DTO> obtenerBloqueadosUsuarios();
    
    public List<Usuario_DTO> obtenerListaModeradores () ;
    public List<Usuario_DTO> obtenerTotalModeradores();
    public List<Usuario_DTO> obtenerBloqueadosModeradores();
    
    
    

    
    // Buscar 
    
     public List<Usuario_DTO> buscador  (String buscar) ;
    
    //  Actualizacion 
     
  
                     
}
