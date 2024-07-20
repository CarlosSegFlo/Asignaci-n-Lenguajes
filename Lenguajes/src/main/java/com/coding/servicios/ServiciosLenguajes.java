package com.coding.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding.modelos.Lenguaje;
import com.coding.repositorios.RepositorioLenguajes;

@Service
public class ServiciosLenguajes {
	@Autowired
	private final RepositorioLenguajes repositorioLenguajes;

	public ServiciosLenguajes(RepositorioLenguajes repositorioLenguajes) {
		super();
		this.repositorioLenguajes = repositorioLenguajes;
	}
	
	public Lenguaje agregarLenguaje(Lenguaje nuevoLenguaje) {
		return this.repositorioLenguajes.save(nuevoLenguaje);
	}
	
	public List<Lenguaje> obtenerLenguajes(){
		return this.repositorioLenguajes.findAll();
	}
	
	public Lenguaje obtenerPorId(Long id) {
		return this.repositorioLenguajes.findById(id).orElse(null);
	}
	
	public void eliminarPorId(Long id) {
		this.repositorioLenguajes.deleteById(id);
	}
	
	public Lenguaje actualizarLenguaje(Lenguaje lenguaje) {
		return this.repositorioLenguajes.save(lenguaje);
	}
	
	
}
