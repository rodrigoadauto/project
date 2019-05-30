/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.model.repository;

import com.mycompany.proyectoeventos.model.entity.AsistenciaDeEvento;
import com.mycompany.proyectoeventos.model.entity.Evento;
import com.mycompany.proyectoeventos.model.entity.Sesion;
import com.mycompany.proyectoeventos.model.entity.Usuario;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Rodrigo
 */
@Repository
public interface AsistenciaDeEventoRepository extends JpaRepository<AsistenciaDeEvento, Integer> {

    public List<AsistenciaDeEvento> findByUsuario(Usuario usuario);
   public List<AsistenciaDeEvento> findByUsuarioAndEvento(Usuario usuario, Evento evento);
    
   
    
}
