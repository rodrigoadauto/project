/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.model.entity;

import com.mycompany.proyectoeventos.dto.Usuario_DTO;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.ConstructorResult;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.Table;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;


/**
 *
 * @author Rodrigo
 */


 @SqlResultSetMapping(name = "UsuarioDTO_Mapping",
            classes = {
                @ConstructorResult(
                        targetClass = Usuario_DTO.class,
                        columns = {
                            @ColumnResult(name = "idUsuario", type = int.class) ,
                            @ColumnResult(name = "nombre", type = String.class) ,
                            @ColumnResult(name = "apellido", type = String.class) ,
                            @ColumnResult(name = "dni", type = String.class) ,
                            @ColumnResult(name = "correo", type = String.class) ,   
                            @ColumnResult(name = "activo", type = int.class) ,
                            @ColumnResult(name = "nombreCategoria", type = String.class) ,
                            @ColumnResult(name = "autoridad", type = String.class) ,
                             
                        })
            })
 
@Entity
@Table(name = "usuario")
public class Usuario implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idUsuario")
    private int id; 
    
    @Column(name = "nombre", nullable = false)
    @NotBlank(message = "Por favor llene este campo")
    private String nombre; 
    
    @Column(name = "apellido", nullable = false)
    @NotBlank(message = "Por favor llene este campo")
    private String apellido; 
    
    @Column(name = "dni", nullable = false)
    @Digits(integer=8,fraction=0, message="Los digitos no pertenecen a un documento valido")
    private String dni; 
    
    @Column(name = "correo", nullable = false)
    @Email(message = "Debe tener formato de correo")
    private String correo; 
    
    @Column(name = "contrasena", nullable = false)
    @NotBlank(message = "La contraseña no es vacia")
    private String contrasena; 
    
    @Column(name = "tipo", nullable = false)
    private String tipo; 
    
    @Column(name = "estadoUsuario", nullable = false)
    private String estadoUsuario; 
 
    @ManyToOne
    @JoinColumn(name="idCategoria")
    private Categoria categoria;
    
    @Column (name = "activo" , nullable = false)
    private int activo ; 
    
    @ManyToOne
    @JoinColumn (name = "idsesion")
    private Sesion sesion; 
    

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
     * @return the apellido
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * @param apellido the apellido to set
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }


    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the estadoUsuario
     */
    public String getEstadoUsuario() {
        return estadoUsuario;
    }

    /**
     * @param estadoUsuario the estadoUsuario to set
     */
    public void setEstadoUsuario(String estadoUsuario) {
        this.estadoUsuario = estadoUsuario;
    }

    /**
     * @return the dni
     */
    public String getDni() {
        return dni;
    }

    /**
     * @param dni the dni to set
     */
    public void setDni(String dni) {
        this.dni = dni;
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

    /**
     * @return the contrasena
     */
    public String getContrasena() {
        return contrasena;
    }

    /**
     * @param contrasena the contrasena to set
     */
    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    /**
     * @return the correo
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * @param correo the correo to set
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     * @return the activo
     */
    public int getActivo() {
        return activo;
    }

    /**
     * @param activo the activo to set
     */
    public void setActivo(int activo) {
        this.activo = activo;
    }

    /**
     * @return the sesion
     */
    public Sesion getSesion() {
        return sesion;
    }

    /**
     * @param sesion the sesion to set
     */
    public void setSesion(Sesion sesion) {
        this.sesion = sesion;
    }

}
