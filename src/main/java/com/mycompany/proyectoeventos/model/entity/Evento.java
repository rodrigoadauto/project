/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.model.entity;

import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Rodrigo
 */

@Entity
@Table(name = "evento")
public class Evento {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idEvento")
    private int id; 
    
    @Column(name = "Nombre", nullable = false)
    private String Nombre; 
    
    @Column(name = "descripcion", nullable = false)
    private String descripcion; 
    
    @Column(name = "fecha", nullable = false)
    private Date fecha;
    
    @Column(name = "horaInicio", nullable = false)
    private Date horaInicio;
    
    @Column(name = "horaFin", nullable = false)
    private Date horaFin;
    
    @Column(name = "lugar", nullable = false)
    private String lugar;
    
    //@Column(name = "foto", nullable = false)
    //private byte[] foto;
    
    @Column(name = "foto")
    private int idCreador; 
    
    @Column(name = "estadoEvento", nullable = false)
    private String estadoEvento;
    
    @Column(name = "categoria", nullable = false)
    private String categoria;

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
     * @return the Nombre
     */
    public String getNombre() {
        return Nombre;
    }

    /**
     * @param Nombre the Nombre to set
     */
    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
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
     * @return the fecha
     */
    public Date getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    /**
     * @return the horaInicio
     */
    public Date getHoraInicio() {
        return horaInicio;
    }

    /**
     * @param horaInicio the horaInicio to set
     */
    public void setHoraInicio(Date horaInicio) {
        this.horaInicio = horaInicio;
    }

    /**
     * @return the horaFin
     */
    public Date getHoraFin() {
        return horaFin;
    }

    /**
     * @param horaFin the horaFin to set
     */
    public void setHoraFin(Date horaFin) {
        this.horaFin = horaFin;
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
//    public byte[] getFoto() {
//        return foto;
//    }
//
//    /**
//     * @param foto the foto to set
//     */
//    public void setFoto(byte[] foto) {
//        this.foto = foto;
//    }

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
     * @return the categoria
     */
    public String getCategoria() {
        return categoria;
    }

    /**
     * @param categoria the categoria to set
     */
    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
    
    
}
