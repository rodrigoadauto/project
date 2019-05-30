/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.model.repository;

import com.mycompany.proyectoeventos.dto.Evento_DTO;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Labtel
 */
public class EventoRepositoryImpl implements EventoRepositoryCustom {

    @PersistenceContext
    EntityManager entityManager;

    @Override
    public List<Evento_DTO> listarMisEventos(int idUsuario) {
        String sql = "select e.idEvento , e.nombre, e.descripcion , e.lugar, e.foto , e.idCreador, e.estadoEvento , e.idCategoria ,\n"
                + " concat (u.nombre , \" \", u.apellido) as 'Usuario' , c.nombreCategoria from evento e \n"
                + "inner join usuario u on (u.idUsuario = e.idCreador) \n"
                + "inner join categoria c on (e.idCategoria = c.idCategoria)  \n"
                + "where idUsuario = ? ";

        Query query = entityManager.createNativeQuery(sql, "EventoDTO_Mapping");
        query.setParameter(1, idUsuario);
        List<Evento_DTO> listaMisEventos = query.getResultList();
        return listaMisEventos;

    }


    @Override
    public List<Evento_DTO> listarEventosModerados() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    /// Eventos Por Categoria 
    @Override
    public List<Evento_DTO> eventosCategoria(String categoria) {

        String sql = "select e.idEvento , e.nombre, e.descripcion , e.lugar, e.foto , e.idCreador, e.estadoEvento , e.idCategoria ,\n"
                + "concat (u.nombre , \" \", u.apellido) as 'Usuario' , c.nombreCategoria from evento e \n"
                + "inner join usuario u on (u.idUsuario = e.idCreador) \n"
                + "inner join categoria c on (e.idCategoria = c.idCategoria)  \n"
                + "where c.nombreCategoria = ? ";

        Query query = entityManager.createNativeQuery(sql, "EventoDTO_Mapping");
        query.setParameter(1, categoria);
        List<Evento_DTO> listaCategorias = query.getResultList();
        return listaCategorias;

    }

}
