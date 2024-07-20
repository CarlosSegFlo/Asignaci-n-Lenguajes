package com.coding.controlador;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.coding.modelos.Lenguaje;
import com.coding.servicios.ServiciosLenguajes;

import jakarta.validation.Valid;

@Controller
public class ControladorLenguajes {

    private final ServiciosLenguajes servicioLenguaje;

    public ControladorLenguajes(ServiciosLenguajes servicioLenguaje) {
        this.servicioLenguaje = servicioLenguaje;
    }

    @GetMapping("/languages")
    public String despliegaPanel(Model model) {
        List<Lenguaje> listaLenguajes = servicioLenguaje.obtenerLenguajes();
        model.addAttribute("lenguajes", listaLenguajes);
        model.addAttribute("lenguaje", new Lenguaje());
        return "panelLenguajes.jsp";
    }

    @GetMapping("/languages/{id}")
    public String detallesLenguajes(Model model, @PathVariable("id") Long id) {
        Lenguaje lenguaje = servicioLenguaje.obtenerPorId(id);
        model.addAttribute("lenguaje", lenguaje);
        return "detallesLenguajes.jsp";
    }

    @PostMapping("/languages")
    public String agregarLenguaje(@Valid @ModelAttribute("lenguaje") Lenguaje lenguaje,
                                  BindingResult validaciones, Model model) {
        if (validaciones.hasErrors()) {
            List<Lenguaje> listaLenguajes = servicioLenguaje.obtenerLenguajes();
            model.addAttribute("lenguajes", listaLenguajes);
            return "panelLenguajes.jsp";
        }
        servicioLenguaje.agregarLenguaje(lenguaje);
        return "redirect:/languages";
    }

    @GetMapping("/languages/{id}/edit")
    public String desplegarEdicion(Model model, @PathVariable("id") Long id) {
        Lenguaje lenguaje = servicioLenguaje.obtenerPorId(id);
        model.addAttribute("lenguaje", lenguaje);
        return "edicionLenguajes.jsp";
    }

    @PutMapping("/languages/{id}")
    public String editarLenguaje(@Valid @ModelAttribute("lenguaje") Lenguaje lenguaje,
                                 BindingResult validaciones, Model model) {
        if (validaciones.hasErrors()) {
            model.addAttribute("lenguaje", lenguaje);
            return "edicionLenguajes.jsp";
        }
        servicioLenguaje.actualizarLenguaje(lenguaje);
        return "redirect:/languages";
    }

    @DeleteMapping("/languages/{id}")
    public String eliminarLenguaje(@PathVariable("id") Long id) {
        servicioLenguaje.eliminarPorId(id);
        return "redirect:/languages";
    }
}
