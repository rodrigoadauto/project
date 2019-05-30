/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.model.repository;

import com.mycompany.proyectoeventos.model.entity.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author USER
 */
@Repository /*Indica que será un repositorio*/
public interface CategoriaRepository extends JpaRepository<Categoria, Integer> { /*La interface hereda de JPARepository y recibe dos parametros, la entidad a gestionar "CATEGORY" y el tipo de datos de la primary key "INTEGER"*/
    
    public Categoria findByNombreCategoria(String nombreCategoria); 
}
