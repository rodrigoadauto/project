/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.model.repository;

import com.mycompany.proyectoeventos.dto.Usuario_DTO;
import com.mycompany.proyectoeventos.model.entity.Usuario;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Labtel
 */
public class AdministradorRepositoryImpl implements AdministradorRepositoryCustom {

    
    @PersistenceContext
    EntityManager entityManager;
    
   
    @Override
    public List<Usuario_DTO> obtenerListaUsuarios() {
        
        String sql = "Select u.idUsuario, u.nombre, u.apellido, u.dni, u.correo, u.activo, c.nombreCategoria, s.autoridad  from usuario u \n" +
                     "inner join categoria c on (u.idCategoria = c.idCategoria)\n" +
                     "inner join sesion s on (u.idSesion = s.idSesion) \n" +
                     "where activo = \"1\" and autoridad = \"usuario\"" ;
          
        Query query = entityManager.createNativeQuery(sql,"UsuarioDTO_Mapping");
        List<Usuario_DTO> listaUsuarios = query.getResultList();
        return listaUsuarios; 
          
    }
    
     @Override
    public List<Usuario_DTO> obtenerTotalUsuarios() {
        
        String sql = "Select u.idUsuario, u.nombre, u.apellido, u.dni, u.correo, u.activo, c.nombreCategoria, s.autoridad  from usuario u \n" +
                     "inner join categoria c on (u.idCategoria = c.idCategoria)\n" +
                     "inner join sesion s on (u.idSesion = s.idSesion) \n" +
                     "where  autoridad = \"usuario\"" ;
          
        Query query = entityManager.createNativeQuery(sql,"UsuarioDTO_Mapping");
        List<Usuario_DTO> listaUsuarios = query.getResultList();
        return listaUsuarios; 
          
    }
     @Override
    public List<Usuario_DTO> obtenerBloqueadosUsuarios() {
        
        String sql = "Select u.idUsuario, u.nombre, u.apellido, u.dni, u.correo, u.activo, c.nombreCategoria, s.autoridad  from usuario u \n" +
"inner join categoria c on (u.idCategoria = c.idCategoria)\n" +
"inner join sesion s on (u.idSesion = s.idSesion) \n" +
"where activo = \"0\" and autoridad = \"usuario\"" ;
          
        Query query = entityManager.createNativeQuery(sql,"UsuarioDTO_Mapping");
        List<Usuario_DTO> listaUsuarios = query.getResultList();
        return listaUsuarios; 
          
    }
    

    @Override
    public List<Usuario_DTO> obtenerListaModeradores() {
        
         String sql = "Select u.idUsuario, u.nombre, u.apellido, u.dni, u.correo, u.activo, c.nombreCategoria, s.autoridad  from usuario u \n" +
                       "inner join categoria c on (u.idCategoria = c.idCategoria)\n" +
                       "inner join sesion s on (u.idSesion = s.idSesion) \n" +
                       "where activo = \"1\" and autoridad = \"moderador\"" ;

        
        Query query = entityManager.createNativeQuery(sql,"UsuarioDTO_Mapping");
        List<Usuario_DTO> listaModeradores = query.getResultList();
        return listaModeradores; 
      
    }
    
    @Override
    public List<Usuario_DTO> obtenerTotalModeradores() {
        
        String sql = "Select u.idUsuario, u.nombre, u.apellido, u.dni, u.correo, u.activo, c.nombreCategoria, s.autoridad  from usuario u \n" +
                     "inner join categoria c on (u.idCategoria = c.idCategoria)\n" +
                     "inner join sesion s on (u.idSesion = s.idSesion) \n" +
                     "where  autoridad = \"moderador\"" ;
          
        Query query = entityManager.createNativeQuery(sql,"UsuarioDTO_Mapping");
        List<Usuario_DTO> listaUsuarios = query.getResultList();
        return listaUsuarios; 
          
    }
     @Override
    public List<Usuario_DTO> obtenerBloqueadosModeradores() {
        
        String sql = "Select u.idUsuario, u.nombre, u.apellido, u.dni, u.correo, u.activo, c.nombreCategoria, s.autoridad  from usuario u \n" +
"inner join categoria c on (u.idCategoria = c.idCategoria)\n" +
"inner join sesion s on (u.idSesion = s.idSesion) \n" +
"where activo = \"0\" and autoridad = \"moderador\"" ;
          
        Query query = entityManager.createNativeQuery(sql,"UsuarioDTO_Mapping");
        List<Usuario_DTO> listaUsuarios = query.getResultList();
        return listaUsuarios; 
          
    }

    @Override
    public List<Usuario_DTO> buscador(String buscar) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
   

   
    
    
    
  
  

    
   
        
    }

   

  
        
    

 
        
        
  

 
       
    

   
    
    
    
    
