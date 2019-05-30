/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.model.entity;

import com.mycompany.proyectoeventos.dto.Evento_DTO;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.ConstructorResult;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.Table;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author Rodrigo
 */
@SqlResultSetMapping(name = "EventoDTO_Mapping",
        classes = {
            @ConstructorResult(
                    targetClass = Evento_DTO.class,
                    columns = {
                        @ColumnResult(name = "idEvento", type = int.class)
                        ,
                            @ColumnResult(name = "nombre", type = String.class)
                        ,
                            @ColumnResult(name = "descripcion", type = String.class)
                        ,  
                            //@ColumnResult(name = "fecha", type = Date.class) ,  
                            //@ColumnResult(name = "horaInicio", type = Date.class) ,  
                            //@ColumnResult(name = "horaFin", type = Date.class) ,  
                            @ColumnResult(name = "lugar", type = String.class)
                        ,  
                            @ColumnResult(name = "foto", type = String.class)
                        ,  
                            @ColumnResult(name = "idCreador", type = int.class)
                        ,
                            @ColumnResult(name = "estadoEvento", type = String.class)
                        ,  
                            @ColumnResult(name = "idCategoria", type = int.class)
                        ,
                            @ColumnResult(name = "Usuario", type = String.class)
                        ,
                            @ColumnResult(name = "nombreCategoria", type = String.class),})
        })

@Entity
@Table(name = "evento")
public class Evento implements Serializable {

    /**
     * @return the fecha
     */
    public LocalDate getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    /**
     * @return the horaInicio
     */
    public LocalTime getHoraInicio() {
        return horaInicio;
    }

    /**
     * @param horaInicio the horaInicio to set
     */
    public void setHoraInicio(LocalTime horaInicio) {
        this.horaInicio = horaInicio;
    }

    /**
     * @return the horaFin
     */
    public LocalTime getHoraFin() {
        return horaFin;
    }

    /**
     * @param horaFin the horaFin to set
     */
    public void setHoraFin(LocalTime horaFin) {
        this.horaFin = horaFin;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idEvento")
    private int id;

    @Column(name = "nombre", nullable = false)
    @NotBlank
    @Size(max = 40, message = "El nombre no puede ser más largo de 40 caracteres")
    private String nombre;

    @Column(name = "descripcion", nullable = false)
    @NotBlank
    @Size(min = 10, max = 40, message = "Ingrese una descripcion entre 10 a 400 caracteres")
    private String descripcion;

    @Column(name = "fecha", nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @NotNull(message = "Este campo es obligatorio")
    @Future(message = "Debe ingresar una fecha válida")
    private LocalDate fecha;

    @Column(name = "horaInicio", nullable = false)
    @DateTimeFormat(pattern = "HH:mm")
    @NotNull(message = "Este campo es obligatorio")
    private LocalTime horaInicio;

    @Column(name = "horaFin", nullable = false)
    @DateTimeFormat(pattern = "HH:mm")
    @NotNull(message = "Este campo es obligatorio")
    private LocalTime horaFin;

    @Column(name = "lugar", nullable = false)
    @NotBlank
    private String lugar;

    @Column(name = "foto", nullable = false)
    private String foto;

    @ManyToOne
    @JoinColumn(name = "idCreador")
    private Usuario usuario;

    @Column(name = "estadoEvento", nullable = false)
    private String estadoEvento;

    @ManyToOne
    @JoinColumn(name = "idCategoria")
    private Categoria categoria;

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
     * @return the usuario
     */
    public Usuario getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the categoria
     */
    public Categoria getCategoria() {
        return categoria;
    }

    /**
     * @param categoria the categoria to set
     */
    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

}
