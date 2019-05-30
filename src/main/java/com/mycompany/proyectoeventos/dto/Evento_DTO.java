/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.dto;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author Labtel
 */
public class Evento_DTO {
    
    // Mis Eventos 
    
    //Evento
    private int idEvento; 
    private String nombre; 
    private String descripcion; 
   //private LocalDate fecha;
   //  private LocalTime horaInicio;
   //  private LocalTime horaFin; 
    private String lugar; 
    private String foto; 
    private int idCreador;
    private String estadoEvento;    
    private int idCategoria;
    private String Usuario;  
    private String nombreCategoria;
    
    public Evento_DTO (int idEvento, String nombre, String descripcion, String lugar, String foto,int idCreador, String estadoEvento ,
                         int idCategoria, String Usuario , String nombreCategoria) { 
    
        this.idEvento = idEvento;
        this.nombre = nombre;
        this.descripcion = descripcion; 
        //this.fecha = fecha;
        // this.horaInicio = horaInicio;
        // this.horaFin = horaFin;
        this.lugar = lugar; 
        this.foto = foto;
        this.idCreador = idCreador; 
        this.estadoEvento = estadoEvento; 
        this.idCategoria = idCategoria;
        this.Usuario = Usuario; 
        this.nombreCategoria = nombreCategoria; } 

    /**
     * @return the idEvento
     */
    public int getIdEvento() {
        return idEvento;
    }

    /**
     * @param idEvento the idEvento to set
     */
    public void setIdEvento(int idEvento) {
        this.idEvento = idEvento;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the lugar
     */
    public String getLugar() {
        return lugar;
    }

    /**
     * @param lugar the lugar to set
     */
    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    /**
     * @return the foto
     */
    public String getFoto() {
        return foto;
    }

    /**
     * @param foto the foto to set
     */
    public void setFoto(String foto) {
        this.foto = foto;
    }

    /**
     * @return the idCreador
     */
    public int getIdCreador() {
        return idCreador;
    }

    /**
     * @param idCreador the idCreador to set
     */
    public void setIdCreador(int idCreador) {
        this.idCreador = idCreador;
    }

    /**
     * @return the estadoEvento
     */
    public String getEstadoEvento() {
        return estadoEvento;
    }

    /**
     * @param estadoEvento the estadoEvento to set
     */
    public void setEstadoEvento(String estadoEvento) {
        this.estadoEvento = estadoEvento;
    }

    /**
     * @return the idCategoria
     */
    public int getIdCategoria() {
        return idCategoria;
    }

    /**
     * @param idCategoria the idCategoria to set
     */
    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    /**
     * @return the Usuario
     */
    public String getUsuario() {
        return Usuario;
    }

    /**
     * @param Usuario the Usuario to set
     */
    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
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
