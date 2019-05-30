/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.model.repository;

import com.mycompany.proyectoeventos.model.entity.Sesion;
import com.mycompany.proyectoeventos.model.entity.Usuario;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Rodrigo
 */
@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Integer>{
    
    
    public Usuario findByCorreo(String correo);
   
    public List<Usuario> findByNombreContaining(String nombre);
    
    public List<Usuario> findBySesion ( Sesion sesion); 
    public List<Usuario> findBySesionAndActivo (Sesion sesion , int Activo); 
    public Usuario findByContrasena(String hash);
    
    
    // Querys Para Usuarios y Mods Totales 
    @Query(value = "select count(*) from usuario u  inner join sesion s on (s.idsesion = u.idSesion)  where u.idSesion = ?1 ", nativeQuery = true)
    public int contador_Usuarios( int idSesion);
    
    @Query(value = "select * from usuario u  inner join sesion s on (s.idsesion = u.idSesion)  where u.idSesion = ?1 order by u.nombre ASC limit ?2,?3 ", nativeQuery = true)
    public List<Usuario> paginacion_Usuarios( int idSesion ,int inicio, int tamaño);
    
    @Query(value = "select count(*) from usuario u  inner join sesion s on (s.idsesion = u.idSesion) where u.activo=?1 and u.idSesion = ?2 ", nativeQuery = true)
    public int contador_Bloqueados( int activo, int idSesion);   
    
    @Query(value = "select * from usuario u  inner join sesion s on (s.idsesion = u.idSesion)  where u.activo =?1 and u.idSesion = ?2 order by u.nombre ASC limit ?3,?4 ", nativeQuery = true)
    public List<Usuario> paginacion_Bloqueados( int activo ,int idSesion ,int inicio, int tamaño);
}
