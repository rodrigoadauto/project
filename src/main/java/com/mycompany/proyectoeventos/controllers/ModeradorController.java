/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.controllers;

import com.mycompany.proyectoeventos.model.entity.AsistenciaDeEvento;
import com.mycompany.proyectoeventos.model.entity.Categoria;
import com.mycompany.proyectoeventos.model.entity.Evento;
import com.mycompany.proyectoeventos.model.entity.Usuario;
import com.mycompany.proyectoeventos.model.repository.AsistenciaDeEventoRepository;
import java.util.List;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import com.mycompany.proyectoeventos.model.repository.CategoriaRepository;
import com.mycompany.proyectoeventos.model.repository.EventoRepository;
import com.mycompany.proyectoeventos.model.repository.ModeradorRepository;
import com.mycompany.proyectoeventos.model.repository.UsuarioRepository;
import java.time.LocalDate;
import java.util.Optional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Rodrigo
 */
@Controller
public class ModeradorController {

    @Autowired
    public ModeradorRepository moderadorRepositorio;

    @Autowired
    public EventoRepository eventoRepository;

    @Autowired
    public CategoriaRepository categoriaRepository;

    @Autowired
    public UsuarioRepository usuarioRepository;
    
    @Autowired
    public AsistenciaDeEventoRepository asistenciaDeEventoRepository;

    //Inicio de Sesion Usuario
    @PostMapping("moderador/sesion")
    public String moderadorSesion() {

        return "redirect:/moderador/listar";

    }

    @GetMapping("moderador/listar")
    public String moderadorListar(Model model, @RequestParam(name = "inicio", required = false) Integer inicio,
            RedirectAttributes attr) {
        
        if (inicio == null) {
            inicio = 0;

        } else if (inicio > 0) {
            inicio--;
        }
        
        
        double paginas = (double) eventoRepository.contador();
        double cantPorPaginaDouble = Math.ceil(paginas / 4);
        int cantDePaginas = (int) cantPorPaginaDouble;
        List<Evento> listaEvento = eventoRepository.findByFechaAfter(inicio * 4, 4);

        attr.addFlashAttribute("cantDePaginas", cantDePaginas);

        attr.addFlashAttribute("listaEvento", listaEvento);
        attr.addFlashAttribute("paginaActual", ++inicio);

        return "redirect:/moderador/listaFiltroBase";
       
        
    }

    @GetMapping("moderador/listaFiltroBase")
    public String listadoFiltradoBase() {

        return "moderador/Moderador_Eventos_Publicos";
    }
    
    @PostMapping("moderador/buscar")
    public String buscarEventoModerador(Model model, @RequestParam(name = "nombre") String nombre) {

        List<Evento> listaEvento = eventoRepository.findByNombreContaining(nombre);
        model.addAttribute("listaEvento", listaEvento);
        return "moderador/Moderador_Eventos_Publicos";

    }

    // Eventos Por Categoria (Moderador) 
    @GetMapping("/moderador/eventosCategoria/{categoria}")
    public String eventosCategoriaMod(Model model, @PathVariable("categoria") int categoria) {

        Optional<Categoria> optional = categoriaRepository.findById(categoria);

        if (optional.isPresent()) {
            Categoria category = optional.get();

            model.addAttribute("listaEventosCategoria", eventoRepository.findByCategoria(category));
            return "moderador/Moderador_eventosXcategoria";
        } else {
            return "redirect:/moderador/listar";
        }

    }

  //// EVENTOS CREADOS POR EL USUARIO con Paginacion y Fecha
    @GetMapping("/moderador/misEventos/{idUsu}")
    public String misEventosMod(Model model, @PathVariable("idUsu") int idUsu, @RequestParam(name = "inicio", required = false) Integer inicio,
            RedirectAttributes attr) {

        if (inicio == null) {
            inicio = 0;

        } else if (inicio > 0) {
            inicio--;
        }
        double paginas = (double) eventoRepository.contador_MisEventos(idUsu);
        double cantPorPaginaDouble = Math.ceil(paginas / 6);
        int cantDePaginas = (int) cantPorPaginaDouble;

        List<Evento> listaMisEventos = eventoRepository.findByFechaAfter_MisEventos(idUsu, inicio * 6, 6);

        attr.addFlashAttribute("cantDePaginas", cantDePaginas);
        attr.addFlashAttribute("listaMisEventos", listaMisEventos);
        attr.addFlashAttribute("paginaActual", ++inicio);

        return "redirect:/moderador/misEventos1";
    }

    @GetMapping("moderador/misEventos1")
    public String misEventos(Model model) {

        /*
        List<FechaHoy> fecha = eventoRepository.findFecha();
        model.addAttribute("fechahoy", listafecha);
         */
        return "moderador/Moderador_MisEventos";
    }

    @GetMapping("/moderador/misEventosOcurridos/{idUsu}")
    public String misEventosOcurridosMod(Model model, @PathVariable("idUsu") int idUsu, @RequestParam(name = "inicio", required = false) Integer inicio,
            RedirectAttributes attr) {

        if (inicio == null) {
            inicio = 0;

        } else if (inicio > 0) {
            inicio--;
        }
        double paginas = (double) eventoRepository.contador_MisEventos1(idUsu);
        double cantPorPaginaDouble = Math.ceil(paginas / 6);
        int cantDePaginas = (int) cantPorPaginaDouble;

        List<Evento> listaMisEventos = eventoRepository.findByFechaBefore_MisEventos(idUsu, inicio * 6, 6);

        attr.addFlashAttribute("cantDePaginas", cantDePaginas);
        attr.addFlashAttribute("listaMisEventos", listaMisEventos);
        attr.addFlashAttribute("paginaActual", ++inicio);

        return "redirect:/moderador/misEventosOcurridos1";
    }

    @GetMapping("moderador/misEventosOcurridos1")
    public String misEventosOcurridos() {

        return "moderador/Moderador_MisEventosOcurridos";
    }

    @GetMapping("moderador/detallesMisEventos/{idEvento}")
    public String detallesMisEventos(Model model, @PathVariable("idEvento") int idEvento) {

        Optional<Evento> optional = eventoRepository.findById(idEvento);

        if (optional.isPresent()) {
            Evento event = optional.get();
            model.addAttribute("evento", event);    
            return "moderador/detalle2";
        } else {
            return "redirect:/moderador/listar";
        }
    }
    
    @GetMapping("moderador/detallesMisEventos1/{idEvento}")
    public String detallesMisEventos1(Model model, @PathVariable("idEvento") int idEvento) {

        Optional<Evento> optional = eventoRepository.findById(idEvento);

        if (optional.isPresent()) {
            Evento event = optional.get();
            model.addAttribute("evento", event);    
            return "moderador/detalle21";
        } else {
            return "redirect:/moderador/listar";
        }
    }

    @GetMapping("moderador/eliminarEvento1/{idEvento}")
    public String eliminarEvento1(Model model, @PathVariable("idEvento") int idEvento ) {
      
        eventoRepository.deleteById(idEvento);
        return "redirect:/moderador/misEventos/13";
    }
    
    @GetMapping("moderador/eliminarEvento2/{idEvento}")
    public String eliminarEvento2(Model model, @PathVariable("idEvento") int idEvento) {
        eventoRepository.deleteById(idEvento);
        return "redirect:/moderador/misEventosOcurridos/13";
    }

   //////////////////////////////////////// 
    
    
    
    // ASISTENCIA A EVENTO 
    @PostMapping("moderador/asistirEvento")
    public String asistirEvento(@ModelAttribute("asistenciaDeEvento") AsistenciaDeEvento asistenciaDeEvento) {
        asistenciaDeEventoRepository.save(asistenciaDeEvento);
        return "redirect:/moderador/listar";
    }
    
    

    // EVENTOS ASISTIDOS con Paginacion y Fecha
    @GetMapping("moderador/eventosAsistidos/{idUsuario}")
    public String eventosAsistidosUsu(Model model, @PathVariable("idUsuario") int idUsuario, @RequestParam(name = "inicio", required = false) Integer inicio,
            RedirectAttributes attr) {

        if (inicio == null) {
            inicio = 0;

        } else if (inicio > 0) {
            inicio--;
        }
        double paginas = (double) eventoRepository.contador_Asistencias(idUsuario);
        double cantPorPaginaDouble = Math.ceil(paginas / 6);
        int cantDePaginas = (int) cantPorPaginaDouble;

        List<Evento> listaAsistencias = eventoRepository.findByFechaAfter_Asitencias(idUsuario, inicio * 6, 6);

        attr.addFlashAttribute("cantDePaginas", cantDePaginas);
        attr.addFlashAttribute("listaAsistencias", listaAsistencias);
        attr.addFlashAttribute("paginaActual", ++inicio);

        return "redirect:/moderador/eventosAsitidos1";
    }

    @GetMapping("moderador/eventosAsitidos1")
    public String eventosAsistidos() {

        return "moderador/Moderador_Eventos_Asistidos";
    }

    @GetMapping("moderador/eventosAsistidosOcurridos/{idUsuario}")
    public String eventosAsistidosOcurridosUsu(Model model, @PathVariable("idUsuario") int idUsuario, @RequestParam(name = "inicio", required = false) Integer inicio,
            RedirectAttributes attr) {

        if (inicio == null) {
            inicio = 0;

        } else if (inicio > 0) {
            inicio--;
        }

        double paginas = (double) eventoRepository.contador_Asistencias1(idUsuario);
        double cantPorPaginaDouble = Math.ceil(paginas / 6);
        int cantDePaginas = (int) cantPorPaginaDouble;

        List<Evento> listaAsistencias = eventoRepository.findByFechaBefore_Asitencias(idUsuario, inicio * 6, 6);

        attr.addFlashAttribute("cantDePaginas", cantDePaginas);
        attr.addFlashAttribute("listaAsistencias", listaAsistencias);
        attr.addFlashAttribute("paginaActual", ++inicio);

        return "redirect:/moderador/eventosAsistidosOcurridos1";
    }

    @GetMapping("moderador/eventosAsistidosOcurridos1")
    public String eventosAsistidosOcurridos() {

        return "moderador/Moderador_PorAsistir";
    }
    
    @GetMapping("moderador/detallesAsistidos/{idEvento}")
    public String detallesAsistidos(Model model, @PathVariable("idEvento") int idEvento) {

        Optional<Evento> optional = eventoRepository.findById(idEvento);

        if (optional.isPresent()) {
            Evento event = optional.get();
            model.addAttribute("evento", event);    
            return "moderador/detalle3";
        } else {
            return "redirect:/moderador/listar";
        }
    }
    
     @GetMapping("moderador/detallesAsistidos1/{idEvento}")
    public String detallesAsistidos1(Model model, @PathVariable("idEvento") int idEvento) {

        Optional<Evento> optional = eventoRepository.findById(idEvento);

        if (optional.isPresent()) {
            Evento event = optional.get();
            model.addAttribute("evento", event);    
            return "moderador/detalle31";
        } else {
            return "redirect:/moderador/listar";
        }
    }


    // Evaluar Eventos De Mi Categoria 
    @GetMapping("/moderador/evaluarEventos/{categoria}")
    public String evaluarEventos(Model model, @PathVariable("categoria") int categoria) {

        Optional<Categoria> optional = categoriaRepository.findById(categoria);

        if (optional.isPresent()) {
            Categoria category = optional.get();
            model.addAttribute("listaEventosCategoria", eventoRepository.findByCategoria(category));
            return "moderador/Moderador_EvaluarEvento";
        } else {
            return "redirect:/moderador/listar";
        }
    }


}
