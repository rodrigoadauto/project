/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.model.repository;

import com.mycompany.proyectoeventos.model.entity.Categoria;
import com.mycompany.proyectoeventos.model.entity.Evento;
import com.mycompany.proyectoeventos.model.entity.Usuario;
import java.time.LocalDate;
import java.util.List;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Rodrigo
 */
@Repository
public interface EventoRepository extends JpaRepository<Evento, Integer> {

    public List<Evento> findByNombre(String nombre);

    public List<Evento> findByNombreContaining(String nombre);

    public List<Evento> findByCategoria(Categoria categoria);

    public List<Evento> findByUsuario(Usuario usuario);

    @Query(value = "select * from evento e where e.fecha >= curdate() and e.fecha <= DATE_ADD(curdate(),INTERVAL ?1 DAY) order by e.fecha ASC, e.idEvento ASC limit ?2,?3", nativeQuery = true)
    public List<Evento> findFechaBetween(int cantidad, int inicio, int fin);

    @Query(value = "select * from evento e where e.fecha >= curdate() order by e.fecha ASC, e.idEvento ASC limit ?1,?2", nativeQuery = true)
    public List<Evento> findByFechaAfter(int inicio, int tamaño);

    @Query(value = "select * FROM evento e WHERE e.nombre LIKE CONCAT('%',?1,'%') and e.idEvento in ( select v.idEvento from evento v where v.fecha > curdate()) order by e.fecha ASC, e.idEvento ASC limit ?2,?3 ", nativeQuery = true)
    public List<Evento> findBuscadorBase(String nombre, int inicio, int tamaño);

    @Query(value="select * FROM evento e WHERE e.nombre LIKE CONCAT('%',?1,'%') and e.idEvento in ( select v.idEvento from evento v where v.fecha >= curdate() and v.fecha <= DATE_ADD(curdate(),INTERVAL ?2 DAY)) order by e.fecha ASC, e.idEvento ASC limit ?3,?4",nativeQuery = true)
    public List<Evento> findBuscadorFiltro(String nombre, int cantidad, int inicio,int fin);
    
    @Query(value="select count(*) FROM evento e WHERE e.nombre LIKE CONCAT('%',?1,'%') and e.idEvento in ( select v.idEvento from evento v where v.fecha >= curdate() and v.fecha <= DATE_ADD(curdate(),INTERVAL ?2 DAY)) ",nativeQuery = true)
    public int findContadorBuscadorFiltro(String nombre, int cantidad);
    
    @Query(value = "select count(*) FROM evento e WHERE e.nombre LIKE CONCAT('%',?1,'%') and e.idEvento in "
            + "(select v.idEvento from evento v where v.fecha >= curdate() order by v.fecha ASC, v.idEvento ASC)", nativeQuery = true)
    public int findContadorBuscadorBase(String nombre);

    @Query(value = "select count(*) from evento e where e.fecha >= curdate()", nativeQuery = true)
    public int contador();

    @Query(value = "select count(*) from evento e where e.fecha >= curdate() and e.fecha <= DATE_ADD(curdate(), "
            + "INTERVAL ?1 DAY)", nativeQuery = true)
    public int contadorTiempo(int cantidad);
    
    
    ////  Funciones Para MIS EVENTOS CREADOS 
    @Query(value = "select count(*) from evento e where e.fecha > curdate() and e.idCreador = ?1 ", nativeQuery = true)
    public int contador_MisEventos( int idUsuario);
    
    @Query(value = "select count(*) from evento e where e.fecha < curdate() and e.idCreador = ?1 ", nativeQuery = true)
    public int contador_MisEventos1( int idUsuario);
    
    @Query(value = "select * from evento e where e.fecha > curdate() and e.idCreador = ?1 order by e.fecha ASC, e.idEvento ASC limit ?2,?3", nativeQuery = true)
    public List<Evento> findByFechaAfter_MisEventos(int idUsuario,int inicio, int tamaño );
    
     @Query(value = "select * from evento e where e.fecha < curdate() and e.idCreador = ?1 order by e.fecha ASC, e.idEvento ASC limit ?2,?3", nativeQuery = true)
    public List<Evento> findByFechaBefore_MisEventos(int idUsuario,int inicio, int tamaño );
    
    
    // Funciones Para FILTROS DE CATEGORIA
    @Query(value = "select count(*) from evento e where e.fecha > curdate() and e.idCategoria = ?1 ", nativeQuery = true)
    public int contador_Categorias( int idCategoria);
    
    @Query(value = "select count(*) from evento e where e.fecha < curdate() and e.idCategoria = ?1 ", nativeQuery = true)
    public int contador_Categorias1( int idCategoria);
    
    @Query(value = "select * from evento e where e.fecha > curdate() and e.idCategoria = ?1 order by e.fecha ASC, e.idEvento ASC limit ?2,?3", nativeQuery = true)
    public List<Evento> findByFechaAfter_Categorias(int idCategoria,int inicio, int tamaño );
    
    @Query(value = "select * from evento e where e.fecha < curdate() and e.idCategoria = ?1 order by e.fecha ASC, e.idEvento ASC limit ?2,?3", nativeQuery = true)
    public List<Evento> findByFechaBefore_Categorias(int idCategoria,int inicio, int tamaño );
   
   
    // Funciones Para EVENTOS ASISTIDOS
    @Query(value = "select count(*) from evento e inner join asistenciaevento x on (e.idEvento = x.Evento_idEvento) where e.fecha > curdate() and x.Usuario_idUsuario = 12 ", nativeQuery = true)
    public int contador_Asistencias( int idUsuario);
    
    @Query(value = "select count(*) from evento e inner join asistenciaevento x on (e.idEvento = x.Evento_idEvento) where e.fecha < curdate() and x.Usuario_idUsuario = 12 ", nativeQuery = true)
    public int contador_Asistencias1( int idUsuario);
    
    @Query(value = "select * from evento e inner join asistenciaevento x on (e.idEvento = x.Evento_idEvento) where e.fecha > curdate() and x.Usuario_idUsuario = ?1 order by e.fecha ASC, e.idEvento ASC limit ?2,?3", nativeQuery = true)
    public List<Evento> findByFechaAfter_Asitencias(int idUsuario,int inicio, int tamaño );
    
    @Query(value = "select * from evento e inner join asistenciaevento x on (e.idEvento = x.Evento_idEvento) where e.fecha < curdate() and x.Usuario_idUsuario = ?1 order by e.fecha ASC, e.idEvento ASC limit ?2,?3", nativeQuery = true)
    public List<Evento> findByFechaBefore_Asitencias(int idUsuario,int inicio, int tamaño );
    
    
    
    
}
