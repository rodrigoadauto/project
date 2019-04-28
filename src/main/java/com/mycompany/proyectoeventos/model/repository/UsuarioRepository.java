/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.model.repository;

import com.mycompany.proyectoeventos.model.entity.Category;
import com.mycompany.proyectoeventos.model.entity.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Rodrigo
 */
public interface UsuarioRepository extends JpaRepository<Usuario, Integer>{
    
}
