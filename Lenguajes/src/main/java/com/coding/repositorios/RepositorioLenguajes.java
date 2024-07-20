package com.coding.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.coding.modelos.Lenguaje;

@Repository
public interface RepositorioLenguajes extends CrudRepository<Lenguaje, Long> {
	List<Lenguaje> findAll();
}
