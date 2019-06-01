/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectoeventos.controllers;

import com.mycompany.proyectoeventos.model.entity.AsistenciaDeEvento;
import com.mycompany.proyectoeventos.model.entity.Categoria;
import com.mycompany.proyectoeventos.model.entity.Evento;
import com.mycompany.proyectoeventos.model.entity.Solicitud;
import com.mycompany.proyectoeventos.model.entity.Usuario;
import com.mycompany.proyectoeventos.model.repository.AsistenciaDeEventoRepository;
import java.util.List;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import com.mycompany.proyectoeventos.model.repository.CategoriaRepository;
import com.mycompany.proyectoeventos.model.repository.EventoRepository;
import com.mycompany.proyectoeventos.model.repository.SolicitudRepository;
import com.mycompany.proyectoeventos.model.repository.UsuarioRepository;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Rodrigo
 */
@Controller
public class UsuarioController {

    String rutaAbsoluta = "d:/";

    @Autowired
    public UsuarioRepository usuarioRepository;

    @Autowired
    public SolicitudRepository solicitudRepository;

    @Autowired
    public EventoRepository eventoRepository;

    @Autowired
    public CategoriaRepository categoriaRepository;

    @Autowired
    public AsistenciaDeEventoRepository asitenciaDeEventoRepository;

    //Inicio de Sesion Usuario
    @PostMapping("usuario/sesion")
    public String usuarioSesion() {

        return "redirect:/usuario/listar";
    }

    //Listado Eventos Publicos Usuario
    @GetMapping("usuario/listar")
    public String eventoListar(Model model,
            @RequestParam(name = "inicio", required = false) String inicio,
            @ModelAttribute("asistenciaDeEvento") AsistenciaDeEvento asistenciaDeEvento,
            RedirectAttributes attr, HttpSession session) {

        int inicioNum = 0;
        if (inicio != null) {
            try {
                inicioNum = Integer.parseInt(inicio);
                if (inicioNum < 0) {
                    attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                    return "redirect:/usuario/listar";
                } else if (inicioNum > 0) {
                    inicioNum--;
                }

            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No juegue con la paginacion");
                return "redirect:/usuario/listar";
            }

        }

        double paginas = (double) eventoRepository.contador();
        double cantPorPaginaDouble = Math.ceil(paginas / 6);
        int cantDePaginas = (int) cantPorPaginaDouble;

        if (cantDePaginas <= inicioNum) {

            return "redirect:/usuario/listar";
        }

        model.addAttribute("cantDePaginas", cantDePaginas);
        List<Evento> listaEvento = eventoRepository.findByFechaAfter(inicioNum * 6, 6);

        model.addAttribute("listaEvento", listaEvento);
        model.addAttribute("paginaActual", ++inicioNum);
        return "usuario/Usuario_Eventos_Publicos";
    }

//Buscar de acuerdo al nombre para la lista de Eventos Publicos(sin filtros de TIempo)
    @GetMapping("usuario/buscar")
    public String buscarEvento(Model model, @RequestParam(name = "nombre") String nombre,
            @RequestParam(name = "inicio", required = false) String inicio, RedirectAttributes attr) {

        int inicioNum = 0;
        if (inicio != null) {
            try {
                inicioNum = Integer.parseInt(inicio);
                if (inicioNum < 0) {
                    attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                    return "redirect:/usuario/listar";
                } else if (inicioNum > 0) {
                    inicioNum--;
                }

            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No juegue con la paginacion");
                return "redirect:/usuario/listar";
            }

        }
        double paginas = (double) eventoRepository.findContadorBuscadorBase(nombre);
        double cantPorPaginaDouble = Math.ceil(paginas / 6);
        int cantDePaginas = (int) cantPorPaginaDouble;

        if (cantDePaginas <= inicioNum) {
            attr.addFlashAttribute("mensaje", "No se encontraron resultados");
            return "redirect:/usuario/buscar?nombre=";
        }

        List<Evento> listaEvento = eventoRepository.findBuscadorBase(nombre, inicioNum * 6, 6);
        model.addAttribute("listaEvento", listaEvento);
        model.addAttribute("search", nombre);
        model.addAttribute("cantDePaginas", cantDePaginas);
        model.addAttribute("paginaActual", ++inicioNum);

        return "usuario/Usuario_Eventos_Publicos_buscadorPublico";
    }

    @GetMapping("usuario/filtroTiempo")
    public String filtrarTiempo(Model model, @RequestParam(name = "tiempo", required = false) String tiempoLetra,
            @RequestParam(name = "inicio", required = false) String inicio, RedirectAttributes attr) {

        int inicioNum = 0;
        if (inicio != null) {
            try {
                inicioNum = Integer.parseInt(inicio);
                if (inicioNum < 0) {
                    attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                    return "redirect:/usuario/listar";
                } else if (inicioNum > 0) {
                    inicioNum--;
                }

            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No juegue con la paginacion");
                return "redirect:/usuario/listar";
            }

        }
        int tiempo = 0;
        if (tiempoLetra != null) {
            try {
                tiempo = Integer.parseInt(tiempoLetra);
                if (tiempo < 0) {
                    attr.addFlashAttribute("mensaje", "Tiempo fuera de rango");
                    return "redirect:/usuario/listar";
                } else if (tiempo > 361) {
                    attr.addFlashAttribute("mensaje", "Tiempo fuera de rango");
                    return "redirect:/usuario/listar";
                }

            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No juegue con el tiempo");
                return "redirect:/usuario/listar";
            }

        }

        double paginas = (double) eventoRepository.contadorTiempo(tiempo);
        double cantPorPaginaDouble = Math.ceil(paginas / 6);
        int cantDePaginas = (int) cantPorPaginaDouble;

        if (cantDePaginas <= inicioNum) {
            attr.addFlashAttribute("mensaje", "No se encontraron resultados");
            return "redirect:/usuario/listar";
        }

        model.addAttribute("cantDePaginas", cantDePaginas);
        model.addAttribute("tiempo", tiempo);
        List<Evento> listaEvento2 = eventoRepository.findFechaBetween(tiempo, inicioNum * 6, 6);

        model.addAttribute("listaEvento", listaEvento2);
        model.addAttribute("paginaActual", ++inicioNum);

        return "usuario/Usuario_Eventos_Publicos_listaFiltradoTiempo";

    }

    @GetMapping("usuario/buscarPorFiltro")
    public String buscarEventoPorFiltro(Model model, @RequestParam(name = "nombre") String nombre,
            @RequestParam(name = "inicio", required = false) String inicio, RedirectAttributes attr,
            @RequestParam(name = "tiempo", required = false) String tiempoLetra) {

        int inicioNum = 0;
        if (inicio != null) {
            try {
                inicioNum = Integer.parseInt(inicio);
                if (inicioNum < 0) {
                    attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                    return "redirect:/usuario/listar";
                } else if (inicioNum > 0) {
                    inicioNum--;
                }

            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No juegue con la paginacion");
                return "redirect:/usuario/listar";
            }

        }
        int tiempo = 0;
        if (tiempoLetra != null) {
            try {
                tiempo = Integer.parseInt(tiempoLetra);
                if (tiempo < 0) {
                    attr.addFlashAttribute("mensaje", "Tiempo fuera de rango");
                    return "redirect:/usuario/listar";
                } else if (tiempo > 361) {
                    attr.addFlashAttribute("mensaje", "Tiempo fuera de rango");
                    return "redirect:/usuario/listar";
                }

            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No juegue con el tiempo");
                return "redirect:/usuario/listar";
            }

        }

        double paginas = (double) eventoRepository.findContadorBuscadorFiltro(nombre, tiempo);
        double cantPorPaginaDouble = Math.ceil(paginas / 6);
        int cantDePaginas = (int) cantPorPaginaDouble;

        if (cantDePaginas <= inicioNum) {

            return "redirect:/usuario/listar";
        }

        List<Evento> listaEvento = eventoRepository.findBuscadorFiltro(nombre, tiempo, inicioNum * 6, 6);

        model.addAttribute("listaEvento", listaEvento);
        model.addAttribute("search", nombre);
        model.addAttribute("tiempo", tiempo);
        model.addAttribute("cantDePaginas", cantDePaginas);
        model.addAttribute("paginaActual", ++inicioNum);
        return "usuario/Usuario_Eventos_Publicos_buscadorFiltroTiempo";
    }

    // FILTROS POR CATEGORIA con Paginacion y Fecha 
    @GetMapping("/usuario/eventosCategoria/{categoria}")
    public String eventosCategoriaUsu(Model model, @PathVariable("categoria") String id, @RequestParam(name = "inicio", required = false) String inicio,
            RedirectAttributes attr) {

        int idNum = 1;
        if (id != null) {
            try {
                idNum = Integer.parseInt(id);
                if (idNum <= 0 || idNum > 10) {
                    attr.addFlashAttribute("mensaje", "La categoria no existe, intente de nuevo");
                    return "redirect:/usuario/listar";
                }

            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "Categoria invalida, intente de nuevo");
                return "redirect:/usuario/listar";
            }

        }

        int inicioNum = 0;
        if (inicio != null) {
            try {
                inicioNum = Integer.parseInt(inicio);
                if (inicioNum < 0) {
                    attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                    return "redirect:/usuario/eventosCategoria/" + idNum;
                } else if (inicioNum > 0) {
                    inicioNum--;
                }

            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No juegue con la paginacion");
                return "redirect:/usuario/eventosCategoria/" + idNum;
            }
        }

        double paginas = (double) eventoRepository.contador_Categorias(idNum);
        double cantPorPaginaDouble = Math.ceil(paginas / 6);
        int cantDePaginas = (int) cantPorPaginaDouble;

        if (cantDePaginas == 0) {

            return "usuario/Usuario_eventosXcategoria";
        } else if (cantDePaginas <= inicioNum) {

            attr.addFlashAttribute("mensaje", "No juegue con la paginacion");
            return "redirect:/usuario/listar";
        }

        List<Evento> listaEventosCategoria = eventoRepository.findByFechaAfter_Categorias(idNum, inicioNum * 6, 6);

        model.addAttribute("cantDePaginas", cantDePaginas);
        model.addAttribute("listaEventosCategoria", listaEventosCategoria);
        model.addAttribute("paginaActual", ++inicioNum);
        model.addAttribute("categoria", idNum);

        return "usuario/Usuario_eventosXcategoria";
    }

    //Buscar Evento Por Catgoria
    @GetMapping("usuario/buscarEventoPorCategoria")
    public String buscarEventoPorCategoria(Model model, @RequestParam(name = "nombre") String nombre,
            @RequestParam(name = "inicio", required = false) String inicio,
            @RequestParam(name = "id", required = false) String id, RedirectAttributes attr) {

        int idNum = 1;
        if (id != null) {
            try {
                idNum = Integer.parseInt(id);
                if (idNum <= 0 || idNum > 10) {
                    attr.addFlashAttribute("mensaje", "No existe esta Categoria");
                    return "redirect:/usuario/listar";
                }

            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No juegue con el id de la Categoria");
                return "redirect:/usuario/listar";
            }

        }

        int inicioNum = 0;
        if (inicio != null) {
            try {
                inicioNum = Integer.parseInt(inicio);
                if (inicioNum < 0) {
                    attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                    return "redirect:/usuario/eventosCategoria/" + idNum;
                } else if (inicioNum > 0) {
                    inicioNum--;
                }

            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No juegue con la paginacion");
                return "redirect:/usuario/eventosCategoria/" + idNum;
            }

        }

        double paginas = (double) eventoRepository.contadorBuscadorPorCategoria(nombre, idNum);
        double cantPorPaginaDouble = Math.ceil(paginas / 6);
        int cantDePaginas = (int) cantPorPaginaDouble;

        if (cantDePaginas <= inicioNum) {
            attr.addFlashAttribute("mensaje", "No se encontraron resultados");
            return "redirect:/usuario/eventosCategoria/" + idNum;
        }

        List<Evento> listaEvento = eventoRepository.findBuscadorPorCategoria(nombre, idNum, inicioNum * 6, 6);

        model.addAttribute("listaEventosCategoria", listaEvento);
        model.addAttribute("search", nombre);
        model.addAttribute("cantDePaginas", cantDePaginas);
        model.addAttribute("paginaActual", ++inicioNum);
        model.addAttribute("categoria", idNum);

        return "usuario/Usuario_eventosXcategoriaBuscador";
    }
////// No se que hace esta parte 

//    @GetMapping("/usuario/eventosCategoriaOcurridos/{categoria}")
//    public String eventosCategoriaOcurridosUsu(Model model, @PathVariable("categoria") int categoria, @RequestParam(name = "inicio", required = false) Integer inicio,
//            RedirectAttributes attr) {
//
//        if (inicio == null) {
//            inicio = 0;
//
//        } else if (inicio > 0) {
//            inicio--;
//        }
//        double paginas = (double) eventoRepository.contador_Categorias1(categoria);
//        double cantPorPaginaDouble = Math.ceil(paginas / 6);
//        int cantDePaginas = (int) cantPorPaginaDouble;
//
//        List<Evento> listaEventosCategoria = eventoRepository.findByFechaBefore_Categorias(categoria, inicio * 6, 6);
//
//        attr.addFlashAttribute("cantDePaginas", cantDePaginas);
//        attr.addFlashAttribute("listaEventosCategoria", listaEventosCategoria);
//        attr.addFlashAttribute("paginaActual", ++inicio);
//
//        return "redirect:/usuario/eventoCategoriaOcurridos1";
//    }
//
//    @GetMapping("usuario/eventoCategoriaOcurridos1")
//    public String eventosCategoriaOcurridos() {
//
//        return "usuario/Usuario_eventosXcategoria";
//    }
    //// EVENTOS CREADOS POR EL USUARIO con Paginacion y Fecha
    @GetMapping("/usuario/misEventos/{idUsu}")
    public String misEventosUsu(Model model, @PathVariable("idUsu") String id, @RequestParam(name = "inicio", required = false) String inicio,
            RedirectAttributes attr, HttpSession session) {

        Usuario usuario = (Usuario) session.getAttribute("usuario");
        int isSesion = usuario.getId();

        int idUsuarioNum = 0;
        if (id != null) {
            try {
                idUsuarioNum = Integer.parseInt(id);
                if (isSesion != idUsuarioNum) {
                    attr.addFlashAttribute("mensaje", "NO TIENE PERMISOS SUFICIENTES PARA REALIZAR ESTA ACCION");
                    return "redirect:/usuario/listar";
                }
            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No juegue con los ids");
                return "redirect:/usuario/listar";
            }
        }

        int inicioNum = 0;
        if (inicio != null) {
            try {
                inicioNum = Integer.parseInt(inicio);
                if (inicioNum < 0) {
                    attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                    return "redirect:/usuario/misEventos/" + idUsuarioNum;
                } else if (inicioNum > 0) {
                    inicioNum--;
                }

            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                return "redirect:/usuario/misEventos/" + idUsuarioNum;
            }
        }

        double paginas = (double) eventoRepository.contador_MisEventos(idUsuarioNum);
        double cantPorPaginaDouble = Math.ceil(paginas / 6);
        int cantDePaginas = (int) cantPorPaginaDouble;
        if (cantDePaginas == 0) {
            return "usuario/Usuario_MisEventos";
        } else if (cantDePaginas <= inicioNum) {
            attr.addFlashAttribute("mensaje", "Numero de paginacion no existe");
            return "redirect:/usuario/listar";
        }

        List<Evento> listaEvento = eventoRepository.findByFechaAfter_MisEventos(idUsuarioNum, inicioNum * 6, 6);

        model.addAttribute("cantDePaginas", cantDePaginas);
        model.addAttribute("listaEvento", listaEvento);
        model.addAttribute("paginaActual", ++inicioNum);
        model.addAttribute("id", idUsuarioNum);

        return "usuario/Usuario_MisEventos";
    }

    @GetMapping("usuario/buscarMisEventos")
    public String buscarMisEventos(Model model, @RequestParam(name = "nombre") String nombre,
            @RequestParam(name = "id") String id,
            @RequestParam(name = "inicio", required = false) String inicio, RedirectAttributes attr,
            HttpSession session) {

        Usuario usuario = (Usuario) session.getAttribute("usuario");
        int isSesion = usuario.getId();

        int idUsuarioNum = 0;
        if (id != null) {
            try {
                idUsuarioNum = Integer.parseInt(id);
                if (isSesion != idUsuarioNum) {
                    attr.addFlashAttribute("mensaje", "NO TIENE PERMISOS SUFICIENTES PARA REALIZAR ESTA ACCION");
                    return "redirect:/usuario/listar";
                }
            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No juegue con los ids");
                return "redirect:/usuario/listar";
            }
        }

        int inicioNum = 0;
        if (inicio != null) {
            try {
                inicioNum = Integer.parseInt(inicio);
                if (inicioNum < 0) {

                    attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                    return "redirect:/usuario/misEventos/" + idUsuarioNum;

                } else if (inicioNum > 0) {
                    inicioNum--;
                }

            } catch (NumberFormatException e) {

                attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                return "redirect:/usuario/misEventos/" + idUsuarioNum;
            }
        }

        double paginas = (double) eventoRepository.contadorMisEventosAfter(nombre, idUsuarioNum);
        double cantPorPaginaDouble = Math.ceil(paginas / 6);
        int cantDePaginas = (int) cantPorPaginaDouble;

        if (cantDePaginas == 0) {
            attr.addFlashAttribute("mensaje", "No se encontraron resultados");
            return "redirect:/usuario/misEventos/" + idUsuarioNum;
        } else if (cantDePaginas <= inicioNum) {
            attr.addFlashAttribute("mensaje", "Numero de paginacion no existe");
            return "redirect:/usuario/listar";
        }

        List<Evento> listaEvento = eventoRepository.findBuscadorMisEventosAfter(nombre, idUsuarioNum, inicioNum * 6, 6);
        model.addAttribute("listaEvento", listaEvento);
        model.addAttribute("search", nombre);
        model.addAttribute("cantDePaginas", cantDePaginas);
        model.addAttribute("paginaActual", ++inicioNum);
        model.addAttribute("id", idUsuarioNum);

        return "usuario/Usuario_MisEventosBuscador";
    }

    @GetMapping("/usuario/misEventosOcurridos/{idUsu}")
    public String misEventosOcurridosUsu(Model model, @PathVariable("idUsu") String id, @RequestParam(name = "inicio", required = false) String inicio,
            RedirectAttributes attr, HttpSession session) {

        Usuario usuario = (Usuario) session.getAttribute("usuario");
        int isSesion = usuario.getId();

        int idUsuarioNum = 0;
        if (id != null) {
            try {
                idUsuarioNum = Integer.parseInt(id);
                if (isSesion != idUsuarioNum) {
                    attr.addFlashAttribute("mensaje", "NO TIENE PERMISOS SUFICIENTES PARA REALIZAR ESTA ACCION");
                    return "redirect:/usuario/listar";
                }
            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No juegue con los ids");
                return "redirect:/usuario/listar";
            }
        }

        int inicioNum = 0;
        if (inicio != null) {
            try {
                inicioNum = Integer.parseInt(inicio);
                if (inicioNum < 0) {
                    attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                    return "redirect:/usuario/misEventosOcurridos/" + idUsuarioNum;
                } else if (inicioNum > 0) {
                    inicioNum--;
                }

            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                return "redirect:/usuario/misEventosOcurridos/" + idUsuarioNum;
            }
        }

        double paginas = (double) eventoRepository.contador_MisEventos1(idUsuarioNum);
        double cantPorPaginaDouble = Math.ceil(paginas / 6);
        int cantDePaginas = (int) cantPorPaginaDouble;

        if (cantDePaginas == 0) {
            return "usuario/Usuario_MisEventosOcurridos";
        } else if (cantDePaginas <= inicioNum) {
            attr.addFlashAttribute("mensaje", "Numero de paginacion no existe");
            return "redirect:/usuario/listar";
        }

        List<Evento> listaEvento = eventoRepository.findByFechaBefore_MisEventos(idUsuarioNum, inicioNum * 6, 6);

        model.addAttribute("cantDePaginas", cantDePaginas);
        model.addAttribute("listaEvento", listaEvento);
        model.addAttribute("paginaActual", ++inicioNum);
        model.addAttribute("id", idUsuarioNum);

        return "usuario/Usuario_MisEventosOcurridos";
    }
    
    @GetMapping("usuario/buscarMisEventosOcurridos")
    public String buscarMisEventosOcurridos(Model model, @RequestParam(name = "nombre") String nombre,
            @RequestParam(name = "id") String id,
            @RequestParam(name = "inicio", required = false) String inicio, RedirectAttributes attr,
            HttpSession session) {

        Usuario usuario = (Usuario) session.getAttribute("usuario");
        int isSesion = usuario.getId();

        int idUsuarioNum = 0;
        if (id != null) {
            try {
                idUsuarioNum = Integer.parseInt(id);
                if (isSesion != idUsuarioNum) {
                    attr.addFlashAttribute("mensaje", "NO TIENE PERMISOS SUFICIENTES PARA REALIZAR ESTA ACCION");
                    return "redirect:/usuario/listar";
                }
            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No juegue con los ids");
                return "redirect:/usuario/listar";
            }
        }

        int inicioNum = 0;
        if (inicio != null) {
            try {
                inicioNum = Integer.parseInt(inicio);
                if (inicioNum < 0) {

                    attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                    return "redirect:/usuario/misEventosOcurridos/" + idUsuarioNum;

                } else if (inicioNum > 0) {
                    inicioNum--;
                }

            } catch (NumberFormatException e) {

                attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                return "redirect:/usuario/misEventosOcurridos/" + idUsuarioNum;
            }
        }

        double paginas = (double) eventoRepository.contadorMisEventosBefore(nombre, idUsuarioNum);
        double cantPorPaginaDouble = Math.ceil(paginas / 6);
        int cantDePaginas = (int) cantPorPaginaDouble;

        if (cantDePaginas == 0) {
            attr.addFlashAttribute("mensaje", "No se encontraron resultados");
            return "redirect:/usuario/misEventosOcurridos/" + idUsuarioNum;
        } else if (cantDePaginas <= inicioNum) {
            attr.addFlashAttribute("mensaje", "Numero de paginacion no existe");
            return "redirect:/usuario/listar";
        }

        List<Evento> listaEvento = eventoRepository.findBuscadorMisEventosBefore(nombre, idUsuarioNum, inicioNum * 6, 6);
        model.addAttribute("listaEvento", listaEvento);
        model.addAttribute("search", nombre);
        model.addAttribute("cantDePaginas", cantDePaginas);
        model.addAttribute("paginaActual", ++inicioNum);
        model.addAttribute("id", idUsuarioNum);

        return "usuario/Usuario_MisEventosOcurridosBuscador";
    }

    @GetMapping("usuario/detallesMisEventos/{idEvento}")
    public String detallesMisEventos(Model model, @PathVariable("idEvento") int idEvento) {

        Optional<Evento> optional = eventoRepository.findById(idEvento);

        if (optional.isPresent()) {
            Evento event = optional.get();
            model.addAttribute("evento", event);
            return "usuario/detalle2";
        } else {
            return "redirect:/usuario/listar";
        }
    }

    @GetMapping("usuario/detallesMisEventos1/{idEvento}")
    public String detallesMisEventos1(Model model, @PathVariable("idEvento") int idEvento) {

        Optional<Evento> optional = eventoRepository.findById(idEvento);

        if (optional.isPresent()) {
            Evento event = optional.get();
            model.addAttribute("evento", event);
            return "usuario/detalle21";
        } else {
            return "redirect:/usuario/listar";
        }
    }

    @GetMapping("usuario/eliminarEvento1/{idEvento}")
    public String eliminarEvento1(Model model, @PathVariable("idEvento") int idEvento) {

        eventoRepository.deleteById(idEvento);
        return "redirect:/usuario/misEventos/12";
    }

    @GetMapping("usuario/eliminarEvento2/{idEvento}")
    public String eliminarEvento2(Model model, @PathVariable("idEvento") int idEvento) {
        eventoRepository.deleteById(idEvento);
        return "redirect:/usuario/misEventosOcurridos/12";
    }

    //////////////////////////////////////// 
    // EVENTOS ASISTIDOS con Paginacion y Fecha
    @GetMapping("usuario/eventosAsistidos/{idUsuario}")
    public String eventosAsistidosUsu(Model model, @PathVariable("idUsuario") String idUsuario, @RequestParam(name = "inicio", required = false) String inicio,
            RedirectAttributes attr, HttpSession session) {

        Usuario usuario = (Usuario) session.getAttribute("usuario");
        int isSesion = usuario.getId();

        int idUsuarioNum = 0;
        if (idUsuario != null) {
            try {
                idUsuarioNum = Integer.parseInt(idUsuario);
                if (isSesion != idUsuarioNum) {
                    attr.addFlashAttribute("mensaje", "NO TIENE PERMISOS SUFICIENTES PARA REALIZAR ESTA ACCION");
                    return "redirect:/usuario/listar";
                }
            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No juegue con los ids");
                return "redirect:/usuario/listar";
            }
        }

        int inicioNum = 0;
        if (inicio != null) {
            try {
                inicioNum = Integer.parseInt(inicio);
                if (inicioNum < 0) {
                    attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                    return "redirect:/usuario/eventosAsistidos/" + idUsuarioNum;
                } else if (inicioNum > 0) {
                    inicioNum--;
                }

            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                return "redirect:/usuario/eventosAsistidos/" + idUsuarioNum;
            }
        }

        double paginas = (double) eventoRepository.contador_Asistencias(idUsuarioNum);
        double cantPorPaginaDouble = Math.ceil(paginas / 6);
        int cantDePaginas = (int) cantPorPaginaDouble;

        if (cantDePaginas == 0) {
            return "usuario/Usuario_Eventos_Asistidos";
        } else if (cantDePaginas <= inicioNum) {
            attr.addFlashAttribute("mensaje", "Numero de paginacion no existe");
            return "redirect:/usuario/listar";
        }
        List<Evento> listaAsistencias = eventoRepository.findByFechaAfter_Asitencias(idUsuarioNum, inicioNum * 6, 6);

        model.addAttribute("cantDePaginas", cantDePaginas);
        model.addAttribute("listaAsistencias", listaAsistencias);
        model.addAttribute("paginaActual", ++inicioNum);
        model.addAttribute("id", idUsuarioNum);

        return "usuario/Usuario_Eventos_Asistidos";
    }

    @GetMapping("usuario/buscarEventosAsistidos")
    public String buscarEventosAsistidos(Model model, @RequestParam(name = "nombre") String nombre,
            @RequestParam(name = "id") String id,
            @RequestParam(name = "inicio", required = false) String inicio, RedirectAttributes attr,
            HttpSession session) {

        Usuario usuario = (Usuario) session.getAttribute("usuario");
        int isSesion = usuario.getId();

        int idUsuarioNum = 0;
        if (id != null) {
            try {
                idUsuarioNum = Integer.parseInt(id);
                if (isSesion != idUsuarioNum) {
                    attr.addFlashAttribute("mensaje", "NO TIENE PERMISOS SUFICIENTES PARA REALIZAR ESTA ACCION");
                    return "redirect:/usuario/listar";
                }
            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No juegue con los ids");
                return "redirect:/usuario/listar";
            }
        }

        int inicioNum = 0;
        if (inicio != null) {
            try {
                inicioNum = Integer.parseInt(inicio);
                if (inicioNum < 0) {

                    attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                    return "redirect:/usuario/eventosAsistidos/" + idUsuarioNum;

                } else if (inicioNum > 0) {
                    inicioNum--;
                }

            } catch (NumberFormatException e) {

                attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                return "redirect:/usuario/eventosAsistidos/" + idUsuarioNum;
            }
        }

        double paginas = (double) eventoRepository.ContadorBuscadorAfter_Asistencias(nombre, idUsuarioNum);
        double cantPorPaginaDouble = Math.ceil(paginas / 6);
        int cantDePaginas = (int) cantPorPaginaDouble;

        if (cantDePaginas == 0) {
            attr.addFlashAttribute("mensaje", "No se encontraron resultados");
            return "redirect:/usuario/eventosAsistidos/" + idUsuarioNum;
        } else if (cantDePaginas <= inicioNum) {
            attr.addFlashAttribute("mensaje", "Numero de paginacion no existe");
            return "redirect:/usuario/listar";
        }

        List<Evento> listaAsistencias = eventoRepository.findBuscadorAfter_Asistencias(nombre, idUsuarioNum, inicioNum * 6, 6);
        model.addAttribute("listaAsistencias", listaAsistencias);
        model.addAttribute("search", nombre);
        model.addAttribute("cantDePaginas", cantDePaginas);
        model.addAttribute("paginaActual", ++inicioNum);
        model.addAttribute("id", idUsuarioNum);

        return "usuario/Usuario_Eventos_AsistidosBuscador";
    }

    @GetMapping("usuario/eventosAsitidos1")
    public String eventosAsistidos() {

        return "usuario/Usuario_Eventos_Asistidos";
    }

    @GetMapping("usuario/eventosAsistidosOcurridos/{idUsuario}")
    public String eventosAsistidosOcurridosUsu(Model model, @PathVariable("idUsuario") String id, @RequestParam(name = "inicio", required = false) String inicio,
            RedirectAttributes attr, HttpSession session) {

        Usuario usuario = (Usuario) session.getAttribute("usuario");
        int isSesion = usuario.getId();

        int idUsuarioNum = 0;
        if (id != null) {
            try {
                idUsuarioNum = Integer.parseInt(id);
                if (isSesion != idUsuarioNum) {
                    attr.addFlashAttribute("mensaje", "NO TIENE PERMISOS SUFICIENTES PARA REALIZAR ESTA ACCION");
                    return "redirect:/usuario/listar";
                }
            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No juegue con los ids");
                return "redirect:/usuario/listar";
            }
        }

        int inicioNum = 0;
        if (inicio != null) {
            try {
                inicioNum = Integer.parseInt(inicio);
                if (inicioNum < 0) {
                    attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                    return "redirect:/usuario/eventosAsistidosOcurridos/" + idUsuarioNum;
                } else if (inicioNum > 0) {
                    inicioNum--;
                }

            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                return "redirect:/usuario/eventosAsistidosOcurridos/" + idUsuarioNum;
            }
        }

        double paginas = (double) eventoRepository.contador_Asistencias1(idUsuarioNum);
        double cantPorPaginaDouble = Math.ceil(paginas / 6);
        int cantDePaginas = (int) cantPorPaginaDouble;

        if (cantDePaginas == 0) {

            return "usuario/Usuario_PorAsistir";
        } else if (cantDePaginas <= inicioNum) {
            attr.addFlashAttribute("mensaje", "Numero de paginacion no existe");
            return "redirect:/usuario/listar";
        }

        List<Evento> listaAsistencias = eventoRepository.findByFechaBefore_Asitencias(idUsuarioNum, inicioNum * 6, 6);

        model.addAttribute("cantDePaginas", cantDePaginas);
        model.addAttribute("listaAsistencias", listaAsistencias);
        model.addAttribute("paginaActual", ++inicioNum);
        model.addAttribute("id", idUsuarioNum);

        return "usuario/Usuario_PorAsistir";
    }

    @GetMapping("usuario/buscarEventosOcurridos")
    public String buscarEventosOcurridos(Model model, @RequestParam(name = "nombre") String nombre,
            @RequestParam(name = "id") String id,
            @RequestParam(name = "inicio", required = false) String inicio, RedirectAttributes attr,
            HttpSession session) {

        Usuario usuario = (Usuario) session.getAttribute("usuario");
        int isSesion = usuario.getId();

        int idUsuarioNum = 0;
        if (id != null) {
            try {
                idUsuarioNum = Integer.parseInt(id);
                if (isSesion != idUsuarioNum) {
                    attr.addFlashAttribute("mensaje", "NO TIENE PERMISOS SUFICIENTES PARA REALIZAR ESTA ACCION");
                    return "redirect:/usuario/listar";
                }
            } catch (NumberFormatException e) {
                attr.addFlashAttribute("mensaje", "No juegue con los ids");
                return "redirect:/usuario/listar";
            }
        }

        int inicioNum = 0;
        if (inicio != null) {
            try {
                inicioNum = Integer.parseInt(inicio);
                if (inicioNum < 0) {

                    attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                    return "redirect:/usuario/eventosAsistidosOcurridos/" + idUsuarioNum;

                } else if (inicioNum > 0) {
                    inicioNum--;
                }

            } catch (NumberFormatException e) {

                attr.addFlashAttribute("mensaje", "No existe ese numero de paginacion");
                return "redirect:/usuario/eventosAsistidosOcurridos/" + idUsuarioNum;
            }
        }

        double paginas = (double) eventoRepository.ContadorBuscadorBefore_Asistencias(nombre, idUsuarioNum);
        double cantPorPaginaDouble = Math.ceil(paginas / 6);
        int cantDePaginas = (int) cantPorPaginaDouble;

        if (cantDePaginas == 0) {
            attr.addFlashAttribute("mensaje", "No se encontraron resultados");
            return "redirect:/usuario/eventosAsistidosOcurridos/" + idUsuarioNum;
        } else if (cantDePaginas <= inicioNum) {
            attr.addFlashAttribute("mensaje", "Numero de paginacion no existe");
            return "redirect:/usuario/listar";
        }

        List<Evento> listaAsistencias = eventoRepository.findBuscadorBefore_Asistencias(nombre, idUsuarioNum, inicioNum * 6, 6);
        model.addAttribute("listaAsistencias", listaAsistencias);
        model.addAttribute("search", nombre);
        model.addAttribute("cantDePaginas", cantDePaginas);
        model.addAttribute("paginaActual", ++inicioNum);
        model.addAttribute("id", idUsuarioNum);

        return "usuario/Usuario_PorAsistirBuscador";
    }

    @GetMapping("usuario/detallesAsistidos/{idEvento}")
    public String detallesAsistidos(Model model, @PathVariable("idEvento") int idEvento) {

        Optional<Evento> optional = eventoRepository.findById(idEvento);

        if (optional.isPresent()) {
            Evento event = optional.get();
            model.addAttribute("evento", event);
            return "usuario/detalle3";
        } else {
            return "redirect:/usuario/listar";
        }
    }

    @GetMapping("usuario/detallesAsistidos1/{idEvento}")
    public String detallesAsistidos1(Model model, @PathVariable("idEvento") int idEvento) {

        Optional<Evento> optional = eventoRepository.findById(idEvento);

        if (optional.isPresent()) {
            Evento event = optional.get();
            model.addAttribute("evento", event);
            return "usuario/detalle31";
        } else {
            return "redirect:/usuario/listar";
        }
    }

    // Psotular A Moderador 
//    @GetMapping("/usuario/postularModerador/{categoria}")
//    public String psotularModerador(Model model , @PathVariable("categoria") int categoria) { 
//        
//        Optional<Categoria> optional = categoriaRepository.findById(categoria) ;
//        
//        if (optional.isPresent()) {
//            Categoria category = optional.get();     
//            model.addAttribute("listaEventosCategoria",eventoRepository.findByCategoria(category)) ;
//            return "moderador/Moderador_EvaluarEvento";   }
//        
//         else { return "redirect:/moderador/listar"; }     
//    }
    @GetMapping("usuario/eventosPublicxs")
    public String eventosPublicxs() {
        return "usuario/Usuario_Eventos_Publicos";
    }

    @PostMapping("usuario/detalles")
    public String verDetalles(@ModelAttribute("asistenciaDeEvento") AsistenciaDeEvento asistenciaDeEvento,
            @RequestParam(name = "idEvento") int idEvento, Model model, HttpSession session) {

        Optional<Evento> optEvento = eventoRepository.findById(idEvento);

        if (optEvento.isPresent()) {
            Evento evento = optEvento.get();
            Usuario usuario = (Usuario) session.getAttribute("usuario");

            model.addAttribute("evento", evento);
            model.addAttribute("usuario", usuario);
            List<AsistenciaDeEvento> asitenciaDeEvento = asitenciaDeEventoRepository.findByUsuarioAndEvento(usuario, evento);

            if (asitenciaDeEvento.isEmpty()) {
                model.addAttribute("asistencia", false);

            } else {
                model.addAttribute("idAsistenciaDeEvento", asitenciaDeEvento.get(0).getId());
                model.addAttribute("asistencia", true);
            }
        } else {
            return "redirect:/usuario/listar";
        }
        return "usuario/Usuario_Detalles";
    }

    // ASISTENCIA A EVENTO 
    @PostMapping("usuario/asistirEvento")
    public String asistirEvento(@ModelAttribute("asistenciaDeEvento") AsistenciaDeEvento asistenciaDeEvento) {
        asitenciaDeEventoRepository.save(asistenciaDeEvento);

        return "redirect:/usuario/listar";
    }

    @PostMapping("usuario/noAsistirEvento")
    public String noAsistirEvento(@ModelAttribute("asistenciaDeEvento") AsistenciaDeEvento asistenciaDeEvento) {
        asitenciaDeEventoRepository.delete(asistenciaDeEvento);
        return "redirect:/usuario/listar";
    }

    @GetMapping("usuario/detalles2")
    public String detalles2() {
        return "usuario/detalle2";
    }

    @GetMapping("usuario/despues2")
    public String despues2() {
        return "usuario/despues2";
    }

    @GetMapping("usuario/editar")
    public String editar() {

        return "usuario/Usuario_EditarEvento";
    }

    @GetMapping("usuario/editar2")
    public String editar2() {
        return "usuario/editar2";
    }

//CrearEvento:
    @GetMapping("usuario/crearEvento")
    public String crearEvento(Model model, @ModelAttribute("evento") Evento evento) {

        List<Categoria> listaCategorias = categoriaRepository.findAll();
        model.addAttribute("listaCategorias", listaCategorias);
        return "usuario/Usuario_CrearEvento";

    }
    // Guardamos Evento y avisamos que fue creado exitosamente:

    @PostMapping("usuario/eventoCreado")
    public String eventoCreado(@ModelAttribute("evento") @Valid Evento evento,
            BindingResult bindingResult,
            @RequestParam("file") MultipartFile file,
            RedirectAttributes attr, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("errores", bindingResult.getFieldErrors());
            List<Categoria> listaCategorias = categoriaRepository.findAll();
            model.addAttribute("listaCategorias", listaCategorias);
            if (file.isEmpty()) {
                model.addAttribute("msgFile", "Debe subir un archivo");
                return "usuario/Usuario_CrearEvento";
            }

            return "usuario/Usuario_CrearEvento";
        } else {
            if (file.isEmpty()) {
                List<Categoria> listaCategorias = categoriaRepository.findAll();
                model.addAttribute("listaCategorias", listaCategorias);
                model.addAttribute("msgFile", "Debe subir un archivo");
                return "usuario/Usuario_CrearEvento";
            } else {

                String[] nombreYextension = file.getOriginalFilename().split("\\.");
                String nombreArchivo = nombreYextension[0];
                String extension = nombreYextension[1];
                String nombreArchivoFinal = nombreArchivo;
                File serverFile;
                for (int i = 2; true; i++) {
                    serverFile = new File(rutaAbsoluta + nombreArchivoFinal + "." + extension);
                    if (serverFile.exists()) {
                        nombreArchivoFinal = nombreArchivo + "(" + i + ")";
                    } else {
                        break;
                    }
                }
                try (BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile))) {
                    byte[] bytes = file.getBytes();
                    stream.write(bytes);

                } catch (IOException e) {
                    Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, e);
                    model.addAttribute("msgFile", "Ocurió un error al subir el archivo");
                    return "usuario/Usuario_CrearEvento";
                }
                evento.setFoto(nombreArchivoFinal + "." + extension);

                evento.setEstadoEvento("por atender");

                eventoRepository.save(evento);
                attr.addFlashAttribute("msg", "Evento guardado correctamente");
                model.addAttribute("foto", evento.getFoto());
                return "usuario/Usuario_EventoCreado";
            }
        }

    }

    @GetMapping("usuario/eventosPorAsistir")
    public String eventosPorAsistir() {
        return "usuario/Usuario_PorAsistir";
    }

    @GetMapping("usuario/detalles3")
    public String detalles3() {
        return "usuario/detalle3";
    }

    @GetMapping("usuario/despues3")
    public String despues3() {
        return "usuario/despues3";
    }

    @GetMapping("usuario/postularModerador/{idUsuario}")
    public String postular(@ModelAttribute("solicitud") Solicitud solicitud, Model model) {
        model.addAttribute("listaCategorias", categoriaRepository.findAll());
        return "usuario/Usuario_Postular";
    }

    @PostMapping(value = "/agregarSolicitud")
    public String agregarSolicitud(@ModelAttribute("solicitud") Solicitud solicitud, Model model, HttpSession session) {
        //Guardar todo en la base de datos con JPA
        solicitud.setEstadoSolicitud("por atender");
        solicitudRepository.save(solicitud);

        return "redirect:/usuario/listar";
    }

}
