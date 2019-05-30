/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.model.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author USER
 */

@Entity                       /*Le dice a que la clase será una entidad ORM*/
@Table(name = "categoria")  /*Nombre de la tabla categorías de la base de datos*/
public class Categoria implements Serializable{
    
    @Id /* Notación de primary Key que afectara al atributo inferior, id */
    @GeneratedValue(strategy = GenerationType.IDENTITY) /*Le dice que dicho campo será autoincrementable*/    
    @Column(name="idCategoria")
    private int id;
    
    @Column(name="nombreCategoria", nullable = false) /*Informo que el atributo catName corresponde a la columna CategoryName de la base de datos, no nulo*/
    private String nombreCategoria;
    
   

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the nombreCategoria
     */
    public String getNombreCategoria() {
        return nombreCategoria;
    }

    /**
     * @param nombreCategoria the nombreCategoria to set
     */
    public void setNombreCategoria(String nombreCategoria) {
        this.nombreCategoria = nombreCategoria;
    }

       
    
}
